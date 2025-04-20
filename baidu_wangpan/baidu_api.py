import requests
import json
import urllib.parse

class BaiduPanAPI:
    def __init__(self):
        self.headers = {
            'Accept': 'application/json, text/plain, */*',
            'Accept-Language': 'zh-CN,zh;q=0.9',
            'Connection': 'keep-alive',
            'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36',
            'X-Requested-With': 'XMLHttpRequest',
            'sec-ch-ua': '"Google Chrome";v="135", "Not-A.Brand";v="8", "Chromium";v="135"',
            'sec-ch-ua-mobile': '?0',
            'sec-ch-ua-platform': '"macOS"'
        }
        
        # 从curl.txt中提取的cookie
        self.cookies = {
            'BDUSS': 'nMzQn50T1M5SzJrNnYyflpCM0lkc2kxQ01GfkVkRzRzLWdITngxQVV1dTZIU3RvRVFBQUFBJCQAAAAAAAAAAAEAAAA818c4bHVfb25lXwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALqQA2i6kANoe',
            'STOKEN': 'a34466ded40f3e1dc2d8e99178b63802607a430cb517309266f03f244e296c82',
            # 其他cookie值...
        }
        
        self.base_url = 'https://pan.baidu.com/api'
        self.bdstoken = '7eeeb94f50229f7814a52f0e54f54bf7'  # 从curl中提取的token
        
    def list_files(self, dir_path):
        """递归列出指定目录的所有文件"""
        params = {
            'clienttype': '0',
            'app_id': '250528',
            'web': '1',
            'order': 'time',
            'desc': '1',
            'dir': dir_path,
            'num': '200',
            'page': '1'
        }
        
        url = f'{self.base_url}/list'
        response = requests.get(
            url,
            params=params,
            headers=self.headers,
            cookies=self.cookies
        )
        
        result = response.json()
        if result['errno'] != 0:
            return result
        
        # 递归处理子目录
        all_files = []
        for item in result['list']:
            if item['isdir'] == 1:
                # 是目录，递归获取子目录内容
                sub_files = self.list_files(item['path'])
                if sub_files['errno'] == 0:
                    all_files.extend(sub_files['list'])
            else:
                # 是文件，直接添加
                all_files.append(item)
        
        result['list'] = all_files
        return result
    
    def rename_file(self, file_id, old_path, new_name):
        """重命名单个文件
        Args:
            file_id: 文件ID
            old_path: 原文件路径
            new_name: 新文件名
        Returns:
            响应结果的JSON对象
        """
        url = f'{self.base_url}/filemanager'
        
        params = {
            'async': '2',
            'onnest': 'fail',
            'opera': 'rename',
            'bdstoken': self.bdstoken,
            'clienttype': '0',
            'app_id': '250528',
            'web': '1'
        }
        
        data = {
            'filelist': json.dumps([{
                'id': file_id,
                'path': old_path,
                'newname': new_name
            }])
        }
        
        response = requests.post(
            url,
            params=params,
            headers=self.headers,
            cookies=self.cookies,
            data=data
        )
        
        return response.json()

def main():
    api = BaiduPanAPI()
    
    # 示例：列出目录
    dir_path = '/我的资源/20250404006-赵晓路4.5-sucess'
    result = api.list_files(dir_path)
    print("列出文件结果:", json.dumps(result, indent=2, ensure_ascii=False))
    
    # 循环处理所有文件
    if result['errno'] == 0 and result['list']:
        for file in result['list']:
            if file['isdir'] == 1:
                continue  # 跳过目录
            
            # 如果文件名已经以.txt结尾，跳过处理
            if file['server_filename'].lower().endswith('.txt'):
                print(f"跳过已处理的文件: {file['path']}")
                continue
                
            file_id = file['fs_id']
            old_path = file['path']
            new_name = file['server_filename'] + '.txt'
            
            print(f"正在处理文件: {old_path}")
            rename_result = api.rename_file(file_id, old_path, new_name)
            print(f"重命名结果: {json.dumps(rename_result, indent=2, ensure_ascii=False)}")

if __name__ == '__main__':
    main()