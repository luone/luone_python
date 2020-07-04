import requests
from lxml import etree
import time


class XiLaIp_Spider:

    def __init__(self):
        self.url = 'http://www.xiladaili.com/gaoni/'
        self.headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36',
            'cookie': 'td_cookie=1539882751; csrftoken=lymOXQp49maLMeKXS1byEMMmsavQPtOCOUwy6WIbfMNazZW80xKKA8RW2Zuo6ssy; Hm_lvt_31dfac66a938040b9bf68ee2294f9fa9=1592547159; Hm_lvt_9bfa8deaeafc6083c5e4683d7892f23d=1592535959,1592539254,1592612217; Hm_lpvt_9bfa8deaeafc6083c5e4683d7892f23d=1592612332',
        }
        self.proxy = '196.0.111.194:34638'
        self.proxies = {
            #"http": "http://%(proxy)s/" % {'proxy': self.proxy},
            #"https": "http://%(proxy)s/" % {'proxy': self.proxy}
        }
        self.list1 = []

    def get_url(self):
        file = open('Ip_Proxy.txt', 'w', encoding='utf-8')
        file.truncate()
        ok_file = open('OkIp_Proxy.txt', 'w', encoding='utf-8')
        ok_file.truncate()
        for index in range(5):
            time.sleep(3)
            try:
                res = requests.get(url=self.url if index == 0 else self.url + str(index) + "/", headers=self.headers,
                                   proxies=self.proxies, timeout=10).text
            except:
                continue
            data = etree.HTML(res).xpath("//*[@class='mt-0 mb-2 table-responsive']/table/tbody/tr/td[1]")
            # '//*[@id="scroll"]/table/tbody/tr/td[1]'
            score_data = etree.HTML(res).xpath("//*[@class='mt-0 mb-2 table-responsive']/table/tbody/tr/td[8]")
            for i, j in zip(data, score_data):
                score = int(j.text)
                # 追加评分率大于一万的ip
                if score > 10000:
                    self.list1.append(i.text)
                    file.write(i.text + '\n')
            set(self.list1)
        file.close()
        ok_ip = []
        for i in self.list1:
            try:
                # 验证代理ip是否有效
                res = requests.get(url='https://www.baidu.com', headers=self.headers, proxies={'http': 'http://' + i},
                                   timeout=10)
                if res.status_code == 200:
                    ok_file.write(i + '\n')
                    ok_ip.append(i)
            except:
                continue
        ok_file.close()
        return ok_ip

    def run(self):
        return self.get_url()


dl = XiLaIp_Spider()
dl.run()
