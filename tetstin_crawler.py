import asyncio
from crawl4ai import AsyncWebCrawler
import re
import os
# from xai import Grok  # 假设使用 xAI 的 Grok

# 初始化 Grok
# grok = Grok(api_key=os.getenv("XAI_API_KEY"))


# 自定义函数：从 Markdown 中提取 URL
def extract_urls_from_text(text):
    # 使用正则表达式提取 Markdown 中的 URL，例如 [text](url)
    url_pattern = r'\[.*?\]\((https?://[^\s)]+)\)'
    urls = re.findall(url_pattern, text)
    return urls


# 异步爬取单个网页
async def crawl_single_page(url):
    async with AsyncWebCrawler(verbose=True) as crawler:
        result = await crawler.arun(url=url)
        if result.success:
            return result.markdown
        else:
            raise Exception(f"爬取失败: {result.error_message}")


# 异步爬取多个网页
async def crawl_multiple_pages(urls):
    async with AsyncWebCrawler(verbose=True) as crawler:
        results = await crawler.arun_many(urls=urls)
        return {result.url: result.markdown for result in results if result.success}


# 主函数：爬取主页面并递归获取子链接内容
async def get_detailed_content(main_url, user_input):
    # 爬取主页面
    main_content = await crawl_single_page(main_url)
    print("主页面内容：\n", main_content)

    # 从主页面提取所有子链接
    sub_urls = extract_urls_from_text(main_content)
    print("提取到的子链接：", sub_urls)

    # 爬取所有子链接的内容
    sub_contents = await crawl_multiple_pages(sub_urls)

    # 合并所有内容作为知识库
    knowledge_base = f"主页面内容：\n{main_content}\n\n子页面内容：\n"
    for url, content in sub_contents.items():
        knowledge_base += f"--- {url} ---\n{content}\n"

    # 构造提示词
    prompt = f"""
    以下是网页的知识库内容：
    {knowledge_base}

    用户输入：{user_input}

    请根据知识库内容回答用户的问题或生成相关结果。
    """

    # 调用 AI 生成结果
    # response = grok.chat(prompt=prompt)
    return response


# 示例运行
if __name__ == "__main__":
    main_url = "http://test.zqpro.testin.cn/docs/base/"
    user_input = "请告诉我关于 App自动化 的具体内容是什么？"

    # 运行异步函数
    response = asyncio.run(get_detailed_content(main_url, user_input))
    print("AI 输出结果：\n", response)