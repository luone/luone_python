import asyncio
import inspect
from playwright.async_api import async_playwright
import json
from pathlib import Path
import os
import re
from loguru import logger
import random

# --- Constants ---
LOG_FILE = "download.log"
COOKIES_FILE = "cookies.json"
#BASE_DOWNLOAD_DIR_NAME = "tencent_docs_downloads"
BASE_DOWNLOAD_DIR_NAME = "tencent_docs_downloads/D-Test项目/01-工程文档/1.1 需求文档"
LIST_VIEW_SELECTOR = ".desktop-list-view-inner"
LIST_ITEM_SELECTOR = f"{LIST_VIEW_SELECTOR} > li"
DOC_LINK_SELECTOR = "a.desktop-node-link-router"
MORE_ACTIONS_BUTTON_SELECTOR = "button.desktop-icon-button-pc.desktop-list-item-action-button:nth-child(2)"
DOWNLOAD_MENU_ITEM_SELECTOR = "#DownloadMenuItem"
FILE_ICON_SELECTOR = ".sc-file-icon"
USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36"

headers = {
    # ... 保持你的原有的 headers 不变 ...
}


def sanitize_filename(filename):
    """清理文件名中的非法字符"""
    return re.sub(r'[\\/:*?"<>|]', '_', filename)


async def get_file_extension(item):
    """根据 HTML 元素分析获取文件扩展名"""
    link = await item.query_selector(DOC_LINK_SELECTOR)
    if not link:
        return ".pdf"

    href = await link.get_attribute("href")
    icon_div = await item.query_selector(FILE_ICON_SELECTOR)
    if icon_div:
        background_image = await icon_div.get_attribute("style")
        if "application-vnd.tdocs-apps.doc" in background_image:
            return ".docx"
        elif "application-vnd.tdocs-apps.spreadsheet" in background_image:
            return ".xlsx"
    return ".pdf" if "/doc/" not in href and "/sheet/" not in href else ".docx" if "/doc/" in href else ".xlsx"


async def login_and_save_cookies(username, password, output_file=COOKIES_FILE):
    """使用 Playwright 登录腾讯文档并保存 Cookie"""
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=False)
        page = await browser.new_page()
        await page.goto("https://docs.qq.com/")
        await page.wait_for_selector('div[data-e2e-name="昵称"]')
        logger.info("请手动登录腾讯文档，登录完成后按回车键继续...")
        input()
        cookies = await page.context.cookies()
        with open(output_file, "w", encoding="utf-8") as f:
            json.dump(cookies, f, ensure_ascii=False, indent=4)
        logger.info(f"Cookie 已保存到 {output_file}")
        await browser.close()


async def save_download_file(download, file_name, final_path):
    """保存下载文件到指定路径"""
    try:
        logger.info(f"开始下载文件: {file_name}")
        await download.save_as(final_path)

        if final_path.exists():
            logger.info(f"下载完成: {file_name} 到 {final_path}")
            return {"file_name": file_name, "final_download_path": str(final_path)}
        else:
            logger.error(f"文件下载失败，文件不存在: {file_name}")
            return None
    except Exception as e:
        logger.error(f"保存文件时出错: {file_name}, 错误: {str(e)}")
        return None


async def smooth_scroll(page, steps=5):
    """模拟平滑滚动，基于列表容器元素"""
    try:
        # 获取滚动容器元素
        container = await page.query_selector('.desktop-scrollbars-view')
        if not container:
            logger.error("找不到滚动容器元素")
            return

        # 获取容器的当前滚动位置和高度
        current_scroll = await container.evaluate('element => element.scrollTop')
        container_height = await container.evaluate('element => element.clientHeight')
        
        # 计算滚动距离为容器高度的1/3
        scroll_distance = container_height / 3
        step_size = scroll_distance / steps
        
        for i in range(steps):
            # 计算每一小步的滚动位置
            current_step = current_scroll + step_size * (i + 1)
            # 执行滚动，添加一些随机偏移
            await container.evaluate(f'element => element.scrollTop = {current_step + random.randint(-10, 10)}')
            # 随机等待时间，模拟人为操作
            await asyncio.sleep(random.uniform(0.1, 0.3))
            
    except Exception as e:
        logger.error(f"平滑滚动时出错: {str(e)}")


async def download_file(page, item, current_folder_path):
    """处理单个文件下载"""
    try:
        link = await item.query_selector(DOC_LINK_SELECTOR)
        if not link:
            logger.warning("找不到文件链接，跳过此项")
            return None

        # 先移动鼠标到文件项上，触发显示更多按钮
        await item.hover()
        await asyncio.sleep(0.5)  # 等待动画完成
        
        title = await link.get_attribute("title")
        extension = await get_file_extension(item)
        file_name = sanitize_filename(title) + extension
        final_path = current_folder_path / file_name

        # 检查文件是否已存在
        if final_path.exists():
            logger.info(f"文件已存在，跳过下载: {file_name}")
            return {"file_name": file_name, "final_download_path": str(final_path)}

        try:
            # 等待更多按钮出现并点击
            more_btn = await item.wait_for_selector(MORE_ACTIONS_BUTTON_SELECTOR)
            if not more_btn:
                logger.warning(f"找不到更多操作按钮: {title}，跳过此文件")
                return None

            await more_btn.click()
            
            # 等待下载菜单项出现
            download_btn = await page.wait_for_selector(DOWNLOAD_MENU_ITEM_SELECTOR)
            if not download_btn:
                logger.warning(f"找不到下载按钮: {title}，跳过此文件")
                return None

            async with page.expect_download() as download_info:
                await download_btn.click()

                try:
                    download = await download_info.value
                    return await save_download_file(download, file_name, final_path)
                except Exception as e:
                    # 超时则判断下载对话框有没有
                    normal_download_btn = await page.wait_for_selector(
                        'button.dui-button-type-default:has-text("普通下载")',
                        timeout=3000
                    )
                    if normal_download_btn:
                        async with page.expect_download(timeout=60000) as download_info:
                            await normal_download_btn.click()
                            try:
                                download = await download_info.value
                                return await save_download_file(download, file_name, final_path)
                            except Exception as e:
                                logger.error(f"保存文件时出错: {file_name}, 错误: {str(e)}")
                                return None

        except Exception as e:
            logger.error(f"下载操作失败: {file_name}, 错误: {str(e)}")
            return None
            
    except Exception as e:
        logger.error(f"处理文件时出错: {str(e)}")
        return None

    return None


async def wait_and_scroll_for_items(page, folder_id):
    """等待并滚动加载所有列表项，每次滚动后处理新数据"""
    try:
        # 确保列表视图已加载
        retry_count = 0
        while not await page.is_visible(LIST_VIEW_SELECTOR) and retry_count < 3:
            logger.warning(f"列表未加载完成，第{retry_count + 1}次等待...")
            await asyncio.sleep(3)
            retry_count += 1
            
        if not await page.is_visible(LIST_VIEW_SELECTOR):
            logger.error(f"文件夹 {folder_id} 列表加载失败")
            return []

        # 先获取初始列表项
        processed_items = set()  # 用于记录已处理的项目
        all_items = []  # 存储所有项目

        previous_count = 0
        same_count_retries = 0
        max_retries = 3  # 连续3次数量相同则认为加载完成

        while same_count_retries < max_retries:
            # 获取当前所有列表项
            current_items = await page.query_selector_all(LIST_ITEM_SELECTOR)
            current_count = len(current_items)
            
            logger.debug(f"当前加载项目数: {current_count}")
            
            # 处理新加载的项目
            for item in current_items:
                try:
                    link = await item.query_selector(DOC_LINK_SELECTOR)
                    if link:
                        href = await link.get_attribute("href")
                        title = await link.get_attribute("title")
                        item_key = f"{href}_{title}"
                        
                        if item_key not in processed_items:
                            all_items.append(item)
                            processed_items.add(item_key)
                            logger.debug(f"新增项目: {title}")
                except Exception as e:
                    logger.error(f"处理列表项时出错: {str(e)}")
                    continue
            
            if current_count == previous_count:
                same_count_retries += 1
            else:
                same_count_retries = 0
                
            # 如果项目数小于等于8，无需继续滚动
            if current_count <= 8:
                break
                
            # 平滑滚动列表容器
            await smooth_scroll(page)
            # 随机等待一段时间，模拟人为操作
            await asyncio.sleep(random.uniform(1.0, 2.0))
            
            previous_count = current_count

        logger.info(f"在文件夹 {folder_id} 中找到 {len(all_items)} 个项目")
        return all_items

    except Exception as e:
        logger.error(f"加载列表项时出错: {str(e)}")
        return []


async def process_folder(page, folder_id, current_folder_path):
    """递归处理文件夹和文件，深度优先搜索所有文件夹"""
    downloaded_files_info = []

    try:
        # 等待页面加载完成
        await page.wait_for_load_state("networkidle")
        
        # 获取所有列表项（包括滚动加载的内容）
        list_items = await wait_and_scroll_for_items(page, folder_id)
        if not list_items:
            return downloaded_files_info
            
        # 首先收集所有文件夹和文件的信息
        folders = []
        files = []
        
        for item in list_items:
            link = await item.query_selector(DOC_LINK_SELECTOR)
            if not link:
                continue

            href = await link.get_attribute("href")
            title = await link.get_attribute("title")

            if "/folder/" in href:
                folder_id_match = re.search(r'/folder/([a-zA-Z0-9]+)', href)
                if folder_id_match:
                    folders.append({
                        'id': folder_id_match.group(1),
                        'title': title
                    })
            elif "/doc/" in href or "/sheet/" in href:
                files.append(item)

        # 先处理当前文件夹中的所有文件
        for file_item in files:
            file_info = await download_file(page, file_item, current_folder_path)
            if file_info:
                downloaded_files_info.append(file_info)
            await asyncio.sleep(1)  # 避免过于频繁操作

        # 然后递归处理所有子文件夹
        for folder in folders:
            folder_name = sanitize_filename(folder['title'])
            new_folder_path = current_folder_path / folder_name
            new_folder_path.mkdir(parents=True, exist_ok=True)
            
            # 保存当前页面URL
            current_url = page.url
            logger.info(f"进入子文件夹: {folder_name} ({folder['id']})")
            
            # 导航到子文件夹
            await page.goto(f"https://docs.qq.com/desktop/mydoc/folder/{folder['id']}")
            await page.wait_for_load_state("networkidle")
            
            # 递归处理子文件夹
            subfolder_files = await process_folder(page, folder['id'], new_folder_path)
            downloaded_files_info.extend(subfolder_files)
            
            # 返回上一级文件夹
            logger.info(f"返回上级文件夹: {folder_id}")
            await page.goto(current_url)
            await page.wait_for_load_state("networkidle")

    except Exception as e:
        logger.error(f"处理文件夹 {folder_id} 时出错: {str(e)}")
        logger.exception(e)

    return downloaded_files_info


async def main():
    logger.add(LOG_FILE, rotation="500 MB", level="INFO")

    #folder_id_to_download = "SWKKxtddCqku"
    folder_id_to_download="eUYMsPaBkLdR"
    base_download_path = Path(BASE_DOWNLOAD_DIR_NAME)
    base_download_path.mkdir(exist_ok=True)

    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=False, downloads_path=str(base_download_path))
        page = await browser.new_page(user_agent=USER_AGENT)

        # 加载 Cookie
        try:
            with open(COOKIES_FILE, "r", encoding="utf-8") as f:
                cookies = json.load(f)
            await page.context.add_cookies(cookies)
            logger.info("Cookie 加载完成")
        except Exception as e:
            logger.error(f"加载 Cookie 出错: {e}")
            await browser.close()
            return

        await page.set_extra_http_headers(headers)
        await page.goto(f"https://docs.qq.com/desktop/mydoc/folder/{folder_id_to_download}")

        if await page.query_selector('text="登录"') or await page.query_selector('text="QQ登录"'):
            logger.warning("Cookie 无效或过期")
            await browser.close()
            return

        downloaded_files_info = await process_folder(page, folder_id_to_download, base_download_path)

        await browser.close()

        if downloaded_files_info:
            logger.info(json.dumps(downloaded_files_info, ensure_ascii=False, indent=4))
            logger.info("\n已下载的文件信息:")
            for file_info in downloaded_files_info:
                logger.info(f"- 文件: {file_info['file_name']}, 保存到: {file_info['final_download_path']}")
        else:
            logger.info("\n没有文件被下载。")

    logger.info("所有文档处理完成！")
    logger.info("所有文档处理完成！")


if __name__ == "__main__":
    asyncio.run(main())