#!/usr/bin/python
# -*- coding: UTF-8 -*-

import pymysql

# 打开数据库连接
db = pymysql.connect("10.10.210.20", "clouduser", "87b96d06", "db_test", charset='utf8' )

# 使用cursor()方法获取操作游标
cursor = db.cursor()

# 使用execute方法执行SQL语句
cursor.execute("SELECT *, CASE WHEN price is null THEN '' ELSE price END from test_info ")

# 使用 fetchone() 方法获取一条数据
data = cursor.fetchall()

print(data)

# 关闭数据库连接
db.close()