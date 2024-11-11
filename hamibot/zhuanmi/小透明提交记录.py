# if __name__ == '__main__':
#
#     import requests
#
#
#     def get_all_commits(owner, repo, access_token):
#         url = f"https://gitee.com/api/v5/repos/{owner}/{repo}/commits"
#         all_commits = []
#         page = 1
#         per_page = 100  # 每页获取的提交数量
#
#         while True:
#             # 发送 GET 请求，获取指定页的提交记录
#             response = requests.get(url, params={'access_token': access_token, 'page': page, 'per_page': per_page})
#
#             # 检查响应状态
#             if response.status_code == 200:
#                 commits = response.json()
#                 if not commits:  # 如果没有更多提交记录，退出循环
#                     break
#                 all_commits.extend(commits)  # 将当前页的提交记录添加到总记录中
#                 page += 1  # 请求下一页
#             else:
#                 print(f"请求失败，状态码: {response.status_code}")
#                 break
#
#         return all_commits
#
#
#     # 使用示例
#     owner = "xiaotoumingzzz"
#     repo = "hamibot-script"
#     access_token = "3ec2d75e823866d3cf42df7369dd5879"  # 替换为您的访问令牌
#
#     # 获取所有提交记录
#     commits = get_all_commits(owner, repo, access_token)
#
#     # 打印所有提交记录
#     for commit in commits:
#         print(f"提交信息: {commit['commit']['message']}")
#         print(f"提交者: {commit['commit']['author']['name']}")
#         print(f"提交时间: {commit['commit']['committer']['date']}")
#         print(f"提交链接: {commit['html_url']}")
#         print("-" * 40)
#
#     print(f"总提交记录数: {len(commits)}")


# if __name__ == '__main__':
import os
import requests
import base64


def get_repo_contents(owner, repo, path='', access_token=''):
    """获取仓库的文件和目录列表"""
    url = f"https://gitee.com/api/v5/repos/{owner}/{repo}/contents/{path}"
    response = requests.get(url, params={'access_token': access_token})

    if response.status_code == 200:
        return response.json()
    else:
        print(f"请求失败，状态码: {response.status_code}")
        return None


def download_file(file_info, save_path):
    """下载文件并保存到本地"""
    # 解码文件内容
    content = base64.b64decode(file_info['content']).decode('utf-8')

    # 确保目录存在
    os.makedirs(os.path.dirname(save_path), exist_ok=True)

    # 保存文件
    with open(save_path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"已下载: {save_path}")


def download_repo_files(owner, repo, access_token):
    """下载仓库中的所有文件"""
    contents = get_repo_contents(owner, repo, access_token=access_token)

    if contents:
        for item in contents:
            if item['type'] == 'file' and 'js' in item['path']:
                # 下载文件
                download_file(item, item['path'])
            elif item['type'] == 'dir':
                # 递归下载目录中的文件
                download_repo_files(owner, repo, item['path'], access_token)


if __name__ == "__main__":
    # 使用示例
    owner = "xiaotoumingzzz"  # 替换为仓库拥有者
    repo = "hamibot-script"  # 替换为仓库名称
    access_token = "3ec2d75e823866d3cf42df7369dd5879"  # 替换为您的访问令牌

    # 下载仓库中的所有文件
    download_repo_files(owner, repo, access_token)
