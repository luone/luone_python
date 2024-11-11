import json

# 读取 JSON 文件
file_path = '1-原始.json'
new_file_path = '1_new_file.js'
if __name__ == '__main__':

    try:
        with open(file_path, 'r') as file:
            json_data = json.load(file)  # 将文件内容加载为 JSON 对象
            # 将去掉转义后的字符串写入新文件
            new_js_str = json_data['text'].replace('\\"', '"').replace("\\'", "'")
            with open(new_file_path, 'w', encoding='utf-8') as file:
                file.write(new_js_str)
            print("转化新文件成功")
    except FileNotFoundError:
        print(f"文件 {file_path} 未找到。")
    except json.JSONDecodeError as e:
        print("读取失败:", e)