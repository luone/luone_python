#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
import logging
import uuid

import demjson as demjson
import requests

# from poc.银河证券.Crypter import Crypter

logger = logging.getLogger('console')


class EsbCaller(object):
    """Esb请求者"""

    def build_headers(self, user, password, func_no, func_version, sysCode):
        headers = {}
        headers['Content-Type'] = 'application/json;charset=UTF-8'
        headers['Tracking-Id'] = str(uuid.uuid4())
        headers['User'] = user
        crypter = Crypter()
        nonce = crypter.generate_nonce()
        timestamp = crypter.generate_timestamp()
        headers['Nonce'] = nonce
        headers['Created'] = timestamp
        headers['Password-Digest'] = crypter.generate_password_digest(nonce, timestamp, password)
        headers['Function-No'] = func_no
        headers['Function-Version'] = func_version
        headers['Caller-System-Code'] = sysCode
        headers['Accept-Encoding'] = ''
        return headers

    def post(self, url, header, request):
        logger.info("req:%s, %s, %s", url, request, header)
        result = requests.post(url, data=request, headers=header)
        logger.info("res:%s", result.text)
        return result


# func_no = "YH0007000400004"
# func_version = "1"
# sysCode = 'MPA'
# request = '{"CustNo":"10300010053", "OprMode":"B", "OrgNo":"0103", "AssetAcct":"", "FortuneAcct":"-1"}'
# caller = EsbCaller()
# headers = caller.build_headers("mpa", 'china@123', func_no, func_version, sysCode)
# result = caller.post("http://10.1.85.106:22112/apiJson/V2/mpa", headers, request)
# print('应答header')
# print(result.headers)
# print('应答body')
# print(result.content.decode("utf-8"))

if __name__ == '__main__':
    # func_no = "YH0007000400004"
    # func_version = "1"
    # sysCode = 'MPA'
    # request = '{"CustNo":"10300010053", "OprMode":"B", "OrgNo":"0103", "AssetAcct":"", "FortuneAcct":"-1"}'
    # caller = EsbCaller()
    # headers = caller.build_headers("mpa", 'china@123', func_no, func_version, sysCode)
    # print(headers)
    # result = caller.post("http://10.1.85.106:22112/apiJson/V2/mpa", headers, request)
    # print('应答header')
    # print(result.headers)
    # print('应答body')
    # print(result.content.decode("utf-8"))
    # a = {"foo": "this is foo", "bar": "this is bar"}
    # print(type(a))
    # # b = json.loads('''${a}''')
    # # c= json.loads("""{'a':'1'}""")
    #
    # d = {'a':1}
    # json.load(d)
    # # print(type(b))
    # # print(type(demjson.decode(d)))
    str="a,b"
    print(len(str)%2)