import requests
import re
import time

payload = ""

# 请求头
headers = {
    "Accept": "*/*",
    "Accept-Encoding": "gzip, deflate, br",
    "Accept-Language": "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3",
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_0) AppleWebKit/537.36 (KHTML, like Gecko) "
                  "Chrome/83.0.4103.106 Safari/537.36 "
}


# 获得文章列表urls 参数: 作者文章目录
def get_urls(url):
    # 发送请求
    resp = requests.request("GET", url, data=payload, headers=headers)
    # 设置解码方式
    resp.encoding = resp.apparent_encoding
    # 用设置的解码方式解码
    html_source = resp.text
    # 正则表达式，取出网页中的url链接（一些寻找注入点的工具也是这么做出来的）
    urls = re.findall("https://[^>\";\']*\d", html_source)
    new_urls = []
    for url in urls:
        if 'details' in url:
            if url not in new_urls:
                new_urls.append(url)
    return new_urls


# 定向文章地址
def target_urls():
    urls = []
    urls.append("https://blog.csdn.net/u013698807/article/details/107096016")
    return urls


urls = target_urls()
num = 0
while True:
    for url in urls:
        requests.request("GET", url, data=payload, headers=headers)
        num = num + 1
        print(url, "Ok, currNum is:" + str(num))
        time.sleep(5)
    time.sleep(3)
