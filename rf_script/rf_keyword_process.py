#!/usr/bin/python
# coding=UTF-8


from mongobase import MongoBase
from mysqlbase import MysqlBase
import time
import uuid


class rf_keyword_process:
    # mysql
    mysqlbase = MysqlBase()
    # mongo
    mongo = MongoBase()

    # 1.获取指定测试集下的用例
    def get_testcase(self,tc_parent_sid):
        if tc_parent_sid is None:
            return;
        sql = ''' select * from `db_file`.`test_case` where tc_parent_sid = %s'''
        test_cases = self.mysqlbase.queryByParas(sql,[tc_parent_sid])
        for test_case in test_cases:
            print(test_case)

        tablename = "KeywordScript"
        keywordScripts = self.mongo.mongoQuery(tablename,{"_id":"26fe9c74-8901-4f15-b305-4380f2da8b15"},None)
        # print(keywordScripts)
        for keywordScript in keywordScripts:
            print(keywordScript)

if __name__ == '__main__':
    # print(a)
    # print(12312312)
    # print(uuid.uuid4())
    a =rf_keyword_process()
    a.get_testcase("bd2a2edbb0e74eccb7bc4e02dce5e875")

# keywordscript 关键字 kwType=1 系统关键字, kwType=2 用户关键字
