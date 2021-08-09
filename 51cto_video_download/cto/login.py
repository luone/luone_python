# -*- coding: utf-8 -*-
import pickle, requests, os
from cto.urls import urls
from lxml import etree
from cto import tools


# 自动登录类
class Login(object):
    headers = {
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
        "Accept-Encoding": "gzip, deflate, br",
        "Accept-Language": "zh,en-US;q=0.9,en;q=0.8,zh-CN;q=0.7",
        "Connection": "keep-alive",
        "DNT": "1",
        "Upgrade-Insecure-Requests": "1",
        "Host": 'home.51cto.com',
        "User-Agent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36',
        # "Cookie": "gr_user_id=f4140af9-96c2-4562-817b-f2d1a24d442f; _uab_collina=160350979973759808942678; _ourplusFirstTime=120-10-24-11-23-19; www51cto=4D632A9747C6C4D8145A04DD51F70C83nvkT; look_course_log=%5B14225%2C24944%5D; pub_smile=1DD0D9; pub_visitedfid=57; UM_distinctid=175b262c1b113a-066444ec162715-230346c-240000-175b262c1b2d19; pub_cookietime=2592000; lastlogin=on; Hm_lvt_110fc9b2e1cae4d110b7959ee4f27e3b=1605015616,1605061978; BigUser=0c919697066595f1c25468b8e8513944d3fdd17d9fb36e8518908e5ff98ae594a%3A2%3A%7Bi%3A0%3Bs%3A7%3A%22BigUser%22%3Bi%3A1%3Bs%3A87%3A%222279UlNSAAkGCAcJVFgOAAcBUwAFUlYDVwJVAVBVU1dcUVFUVwQFAVAOBFtVUlIHVVNRUQYGUgVUV1BUUlcEBgE%22%3B%7D; sensorsdata2015jssdkcross=%7B%22distinct_id%22%3A%2214971526%22%2C%22first_id%22%3A%221756a51845f5f0-0ecf75561f4d1c-303464-2359296-1756a518460ea7%22%2C%22props%22%3A%7B%22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%2C%22%24latest_referrer%22%3A%22%22%7D%2C%22%24device_id%22%3A%221756a51845f5f0-0ecf75561f4d1c-303464-2359296-1756a518460ea7%22%7D; zg_did=%7B%22did%22%3A%20%221756a5185df1034-09f08c5dd4cdce-303464-240000-1756a5185e0ea0%22%7D; zg_c66b72eff73f441d8513d9e9ce5d966b=%7B%22sid%22%3A%201605068598328%2C%22updated%22%3A%201605068603974%2C%22info%22%3A%201605061999197%2C%22superProperty%22%3A%20%22%7B%7D%22%2C%22platform%22%3A%20%22%7B%7D%22%2C%22utm%22%3A%20%22%7B%7D%22%2C%22referrerDomain%22%3A%20%22edu.51cto.com%22%2C%22zs%22%3A%200%2C%22sc%22%3A%200%2C%22firstScreen%22%3A%201605068598328%2C%22cuid%22%3A%20%2214971526%22%7D; acw_tc=2760827b16050847996173398eac924331d1e6bc1ea4300e54180ccf96e64d; _csrf=77cf4121ecdca302ab8839058736899a2648f1b2f21db7b9d3c7bc60be90b0bea%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22RkwJaPcjnyNlBSfepn35f26u3C5yYbb5%22%3B%7D; Hm_lvt_844390da7774b6a92b34d40f8e16f5ac=1603509800,1605061947,1605061979,1605084801; ad_2020_blogact_157home=1; callback_api_url=https%3A%2F%2Fhome.51cto.com%2Findex; pub_wechatopen=aG0wVVNVAlILAQMJVA; PHPSESSID=tsammpt8gi4l0jgdcrso773om1; _ourplusReturnCount=11; _ourplusReturnTime=120-11-11-17-1-45; Hm_lpvt_844390da7774b6a92b34d40f8e16f5ac=1605085306",
    }

    # 初始化缓存信息路径
    def __init__(self):
        self.cache_path = tools.join_path(tools.main_path(), 'cache')
        tools.check_or_make_dir(self.cache_path)
        self.path = {
            'auth': tools.join_path(self.cache_path, "auth"),
            'cookies': tools.join_path(self.cache_path, "cookies"),
        }
        pass

    def login(self):
        session = requests.Session()
        result = self.check_cookies(session)
        if result:
            return result
        else:
            result = self.check_auth(session)
            if result:
                return result
            else:
                result = False
                while not result:
                    print('账号或密码错误')
                    result = self.re_login(session)
                print('重新登陆成功')
                return result

    def re_login(self, session):
        print("请重新登录")
        # username = input('登录账号:')
        # password = input('密码:')
        username = "15011305041"
        password = "Aa15011305041"

        auth = {
            'username': username,
            'password': password
        }

        return self.login_with_auth(session, auth)

    def is_login_avalid(self, session):
        resp = session.get(urls['sign'])
        text = resp.text
        if len(text) < 100:
            print('cookies登陆成功')
            return session
        else:
            return False

    def check_auth(self, session):
        if os.path.exists(self.path['auth']):
            # 从文件中读取cookie
            with open(self.path['auth'], 'r') as f:
                print("如果读取有错误，请查看或删除 [%s]" % self.path['auth'])
                auth = pickle.load(f)

            headers = self.headers
            headers['host'] = 'edu.51cto.com'
            headers['referer'] = 'edu.51cto.com/center/course/user/get-study-course'
            session.headers = headers

            if self.login_with_auth(session, auth):
                print('auth登陆成功')
                return session
            else:
                print("账号或密码失效")
                print("请重新登录")
                return False
        else:
            return False

    def check_cookies(self, session):
        if os.path.exists(self.path['cookies']):
            # 从文件中读取cookie
            with open(self.path['cookies'], 'rb') as fr:
                cookies = requests.utils.cookiejar_from_dict(pickle.load(fr))
            session.cookies = cookies
            headers = self.headers
            headers['Host'] = 'edu.51cto.com'
            headers['Referer'] = 'edu.51cto.com/center/course/user/get-study-course'
            session.headers = headers

            if self.is_login_avalid(session):
                return session
            else:
                print("cookies失效")
                return False
        else:
            return False

    def login_with_auth(self, session, auth):
        headers = self.headers

        resp = session.get(urls['login'], headers=headers)
        html = etree.HTML(resp.text)
        csrf = html.xpath('//input[@name="_csrf"]/@value')[0]

        data = {
            "_csrf": csrf,
            "LoginForm[username]": auth['username'],
            "LoginForm[password]": auth['password'],
            "LoginForm[rememberMe]": 1,
            "login - button": "登录"
        }

        resp = session.post(urls['login'], data=data)

        if 'Set-Cookie' in resp.headers:

            with open(self.path['auth'], 'wb') as fw:
                pickle.dump(auth, fw)
                print('写入成功！')
            with open(self.path['cookies'], 'wb') as fw:
                pickle.dump(requests.utils.dict_from_cookiejar(session.cookies), fw)
            return session
        else:
            return False

    def decodeFile(self, fileName):
        with open(fileName, 'rb') as fr:
            data = pickle.load(fr)
            return data


if __name__ == '__main__':
    login = Login()
    login.login()

    # 解析文件字符
    #file_name = os.path.join(os.getcwd(), 'cache', 'auth')
    #print(login.decodeFile(file_name))
