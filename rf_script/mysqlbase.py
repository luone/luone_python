#!/usr/bin/python
#coding=UTF-8

import pymysql.cursors

from config import *

class MysqlBase :
    mysql_connection = None

    def __init__(self):
        # Connect to the database
        mysql_config = dbconfig.__getitem__("mysql")

        # Connect to mysql database
        #self.mysql_connection = pymysql.connect(mysql_config.__getitem__("host"), mysql_config.__getitem__("user"), mysql_config.__getitem__("password"), mysql_config.__getitem__("db"))
        self.mysql_connection = pymysql.connect(**mysql_config)

    #
    # 查询sql相关信息
    #
    def query(self, sql):
        if sql == None:
            logger.debug('sql is invalid!')
            return

        result = None

        try:
            with self.mysql_connection.cursor() as cursor:
                # Read a single record
                cursor.execute(sql)
                result = cursor.fetchall()

            return result
        finally:
            logger.debug("sql:%s", sql)


    #
    # 查询sql相关信息
    #
    def queryByParas(self, sql, paras):
        if sql == None:
            logger.debug('sql is invalid!')
            return

        result = None

        try:
            with self.mysql_connection.cursor() as cursor:
                # Read a single record
                cursor.execute(sql, paras)
                result = cursor.fetchall()

            return result
        finally:
            # logger.debug("sql:%s; paras:[" + paras + "]", sql)
            logger.debug('sql:{sql}; paras:{paras}'.format(sql=sql, paras=paras))

    #
    # 查询sql相关信息
    #
    def insertByParas(self, sql, paras):
        if sql == None:
            logger.debug('sql is invalid!')
            return

        result = None

        try:
            with self.mysql_connection.cursor() as cursor:
                # Read a single record
                cursor.execute(sql, paras)
                result = cursor.fetchall()

            self.mysql_connection.commit()
            return result
        finally:
            # logger.debug("sql:%s; paras:[" + paras + "]", sql)
            logger.debug('sql:{sql}; paras:{paras}'.format(sql=sql, paras=paras))