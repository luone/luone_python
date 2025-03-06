import requests

# Gitea URL
gitea_url = 'http://gitea.xinmeng.local.com/repo/create'

# CSRF Token
csrf_token = 'Lg70NfLWod2316IMJ4UhN5Mobmg6MTczNjc1OTA0NTkzMDA2MTk1OA'

# 请求头
headers = {
    'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
    'Accept-Language': 'zh-CN,zh;q=0.9',
    'Cache-Control': 'max-age=0',
    'Connection': 'keep-alive',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Cookie': 'gitea_incredible=Tu7crqje63%3A5b44ba6a8e0566edf6972804d738da4f48e5777c8820faa6c56bb11a7348ddf0; i_like_gitea=08b9f68df8c3c3d0; lang=zh-CN; _csrf=' + csrf_token,
    'Origin': 'null',
    'Upgrade-Insecure-Requests': '1',
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36'
}

# 要创建的仓库名称列表
repo_names = [
    'd_test_case', 'd_test_cockpit', 'd_test_evaluation', 'd_test_event',
    'd_test_issues', 'd_test_library', 'd_test_mind', 'd_test_report',
    'd_test_review', 'd_test_story', 'd_test_task', 'd_test_third',
    'd_test_ui', 'd_test_ui_doc', 'd_test_ui_mind', 'd_test_ui_simplified',
    'd_test_workbench', 'd_test_workitem', 'testin_cloud'
]

# 批量创建仓库
for repo_name in repo_names:
    # 创建数据字典
    data = {
        '_csrf': csrf_token,
        'uid': '3',  # 用户 ID
        'repo_name': repo_name,
        'private': 'on',  # 设置为私有仓库
        'description': '',  # 默认描述为空
        'repo_template': '',  # 默认模板为空
        'issue_labels': '',  # 问题标签为空
        'gitignores': '',  # 默认不使用 gitignore 模板
        'license': '',  # 许可协议为空
        'readme': 'Default',  # 默认 README
        'default_branch': 'main',  # 默认分支
        'object_format_name': 'sha1'  # 使用 sha1 格式
    }

    # 发送 POST 请求
    response = requests.post(gitea_url, headers=headers, data=data, verify=False)

    if response.status_code == 200:
        print(f'仓库 {repo_name} 创建成功!')
    else:
        print(f'创建仓库 {repo_name} 失败，状态码: {response.status_code}')
        print(f'响应内容: {response.text}')
