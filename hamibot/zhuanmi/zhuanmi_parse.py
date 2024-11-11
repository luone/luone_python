import json
import os
import re
import urllib.request
from datetime import datetime
import base64

import jsbeautifier


def split_functions_from_file(filename):
    # 读取文件内容
    with open(filename, 'r') as file:
        js_code = file.read()

    functions = js_code.split('xinmeng-')

    # # 将每个函数写入单独的文件
    for i, func in enumerate(functions):
        if not os.path.exists("test20240704"):
            os.makedirs("test20240704")
        with open(f'test20240704/function_{i + 1}.js', 'w') as f:
            f.write(func)


def buildNew_1():
    global file
    directory_path = "test20240704"
    output_file_path = "2024-07-04_15_2.js"

    # 获取目录中所有以 .js 结尾的文件
    # input_files = sorted([file for file in os.listdir(directory_path) if file.endswith(".js")])
    # 自定义排序规则函数
    def custom_sort(file_name):
        match = re.search(r"function_(\d+)\.js", file_name)
        if match:
            return int(match.group(1))
        else:
            return float('inf')

    # 获取目录中所有以 .js 结尾的文件，并按照自定义规则进行排序
    input_files = sorted([file for file in os.listdir(directory_path) if file.endswith(".js")], key=custom_sort)
    # 打开目标文件以写入模式
    with open(output_file_path, "w") as output_file:
        for input_file in input_files:
            # 构建输入文件的完整路径
            input_file_path = os.path.join(directory_path, input_file)

            # 打开每个输入文件以读取模式
            with open(input_file_path, "r") as input_file:
                # 将输入文件的内容写入目标文件
                # output_file.write(input_file.read())
                output_file.write(input_file.read().replace('\n', ' '))


def download():
    global url, file, file_path
    url = 'https://gitee.com/api/v5/repos/xiaotoumingzzz/hamibot-script/contents/hamibot_ui_pro.js?access_token=3ec2d75e823866d3cf42df7369dd5879&ref=online'
    # autoxjs
    #url = 'https://gitee.com/api/v5/repos/xiaotoumingzzz/hamibot-script/contents/autoxjs.js?access_token=3ec2d75e823866d3cf42df7369dd5879&ref=online'
    current_time = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    file_name = f"xinmeng_ui_file_{current_time}.js"
    # file_name = "2024-07-04_15.json"
    # 下载文件
    urllib.request.urlretrieve(url, file_name)
    with open(file_name, "r") as file:
        json_data = json.load(file)
        decoded_data = base64.b64decode(json_data['content'])
        # 设置格式化选项
        # decoded_data = decoded_data.decode('utf-8')
        # options = jsbeautifier.BeautifierOptions()
        # options.indent_size = 4  # 设置缩进大小
        # options.indent_with_tabs = False  # 使用空格而不是制表符
        #
        # 格式化代码
        # formatted_code = jsbeautifier.beautify(decoded_data, options)
        # file_path = "2024-07-04_15.js"
        with open(file_name, "w") as jsFile:
            jsFile.write(decoded_data.decode('utf-8'))


if __name__ == '__main__':
    # print(123)
    download()

    # split_functions_from_file("2024-07-04_15_1.js")

    # output_file_path = "2024-07-04_15_2.js"
    # input_files = ["file1.js", "file2.js", "file3.js"]
    #
    # # 打开目标文件以写入模式
    # with open(output_file_path, "w") as output_file:
    #     for input_file in input_files:
    #         # 打开每个输入文件以读取模式
    #         with open(input_file, "r") as input_file:
    #             # 将输入文件的内容写入目标文件
    #             output_file.write(input_file.read())

    # buildNew_1()
