#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import arxiv
import os
import time
import requests
from datetime import datetime
from tqdm import tqdm


class ArxivCrawler:
    def __init__(self, save_dir='papers'):
        """
        初始化ArxivCrawler
        :param save_dir: PDF文件保存目录
        """
        self.save_dir = save_dir
        self.ensure_dir_exists()

    def ensure_dir_exists(self):
        """确保保存目录存在"""
        if not os.path.exists(self.save_dir):
            os.makedirs(self.save_dir)

    def search_papers(self, query, max_results=10):
        """
        搜索论文
        :param query: 搜索关键词
        :param max_results: 最大结果数
        :return: 搜索结果列表
        """
        print(f"正在搜索: {query}")
        search = arxiv.Search(
            query=query,
            max_results=max_results,
            sort_by=arxiv.SortCriterion.SubmittedDate
        )
        return list(search.results())

    def download_pdf(self, paper):
        """
        下载论文PDF
        :param paper: arxiv论文对象
        :return: 保存的文件路径
        """
        # 生成文件名
        file_name = f"{paper.get_short_id().split('/')[-1]}_{self._clean_title(paper.title)}.pdf"
        file_path = os.path.join(self.save_dir, file_name)

        # 如果文件已存在，跳过下载
        if os.path.exists(file_path):
            print(f"文件已存在: {file_name}")
            return file_path

        # 下载PDF
        try:
            response = requests.get(paper.pdf_url, stream=True)
            total_size = int(response.headers.get('content-length', 0))

            with open(file_path, 'wb') as f, tqdm(
                    desc=file_name,
                    total=total_size,
                    unit='B',
                    unit_scale=True,
                    unit_divisor=1024,
            ) as pbar:
                for data in response.iter_content(chunk_size=1024):
                    size = f.write(data)
                    pbar.update(size)

            return file_path
        except Exception as e:
            print(f"下载失败: {e}")
            if os.path.exists(file_path):
                os.remove(file_path)
            return None

    def save_paper_info(self, paper, file_path):
        """
        保存论文信息
        :param paper: arxiv论文对象
        :param file_path: PDF文件路径
        """
        info_path = file_path.rsplit('.', 1)[0] + '.txt'

        with open(info_path, 'w', encoding='utf-8') as f:
            f.write(f"标题: {paper.title}\n")
            f.write(f"作者: {', '.join(author.name for author in paper.authors)}\n")
            f.write(f"发布时间: {paper.published.strftime('%Y-%m-%d')}\n")
            f.write(f"arXiv ID: {paper.get_short_id()}\n")
            f.write(f"PDF URL: {paper.pdf_url}\n")
            f.write(f"摘要:\n{paper.summary}\n")
            f.write(f"分类: {', '.join(paper.categories)}\n")

    def _clean_title(self, title):
        """
        清理标题用于文件名
        :param title: 原始标题
        :return: 清理后的标题
        """
        # 移除特殊字符
        title = ''.join(c if c.isalnum() or c.isspace() else '_' for c in title)
        # 限制长度
        return title[:50]

    def crawl(self, query, max_results=10, delay=1):
        """
        执行爬取任务
        :param query: 搜索关键词
        :param max_results: 最大结果数
        :param delay: 下载间隔(秒)
        """
        # 搜索论文
        papers = self.search_papers(query, max_results)
        print(f"找到 {len(papers)} 篇论文")

        # 下载论文
        for paper in papers:
            print(f"\n处理论文: {paper.title}")

            # 下载PDF
            file_path = self.download_pdf(paper)
            if file_path:
                # 保存论文信息
                self.save_paper_info(paper, file_path)
                print(f"保存完成: {os.path.basename(file_path)}")

            # 延时，避免请求过于频繁
            time.sleep(delay)


def main():
    # 创建爬虫实例
    crawler = ArxivCrawler(save_dir='arxiv_papers')

    # 设置搜索参数
    query = input("请输入搜索关键词: ")
    max_results = int(input("请输入最大下载数量(默认10): ") or "10")

    # 执行爬取
    crawler.crawl(query, max_results)


if __name__ == '__main__':
    main()