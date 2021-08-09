#!/usr/bin/python
#coding=UTF-8

import re

from pymongo import MongoClient

from config import *


class MongoBase :
    mongoclient = None

    def __init__(self):
        # Connect to the database
        mongoconfig = dbconfig.__getitem__("mongodb")

        # mongo
        self.mongoclient = MongoClient(mongoconfig.__getitem__("host"), mongoconfig.__getitem__("port"))

    #
    # mongodb查询
    #
    def mongoQuery(self, tablename, sqldict, filterdict):
        if tablename == None :
            return None

        if sqldict == None :
            return None

        db = self.mongoclient['rfscript']

        # db
        coll = db[tablename]

        if filterdict == None :
            return coll.find(sqldict)
        else:
            return coll.find(sqldict, filterdict)


    #
    # mongodb查询
    #
    def mongoQueryPage(self, tablename, sqldict, filterdict, page_size=10, page_no=1):
        if tablename == None:
            return None

        if sqldict == None:
            return None

        db = self.mongoclient['rfscript']

        # db
        coll = db[tablename]

        skip = page_size * (page_no - 1)

        if filterdict == None:
            return coll.find(sqldict).limit(page_size).skip(skip)
        else:
            return coll.find(sqldict, filterdict).limit(page_size).skip(skip)


    #
    # mongodb 更新
    #
    def mongoUpdateOne(self, tablename, sqldict, values):
        if tablename == None :
            return None

        if sqldict == None :
            return None

        if values == None :
            return None

        db = self.mongoclient['rfscript']

        # db
        coll = db[tablename]
        coll.update_one(sqldict, values)
        logger.debug('Mongo Update: tablename: {tablename}, sqldict: {sqldict}, values: {values}'
                     .format(tablename = tablename, sqldict = sqldict, values = values))


    #
    # mongodb 插入
    #
    def mongoInsertMany(self, tablename, values):
        if tablename == None:
            return None

        if values == None:
            return None

        db = self.mongoclient['rfscript']

        # db
        coll = db[tablename]
        coll.insert_many(values)
        logger.debug('Mongo Insert: tablename: {tablename}, values: {values}'
                     .format(tablename=tablename, values=str(values).encode('gbk','ignore')))


    #
    # mongodb 更新
    #
    def mongoDeleteMany(self, tablename, sqldict):
        if tablename == None:
            return None

        if sqldict == None:
            return None

        db = self.mongoclient['rfscript']

        # db
        coll = db[tablename]
        coll.delete_many(sqldict)
        logger.debug('Mongo Delete: tablename: {tablename}, sqldict: {sqldict}'
                     .format(tablename=tablename, sqldict=sqldict))


    #
    # 获取table名称
    #
    def mongoTable(self, tablename, taskid):
        if taskid == None:
            return None

        num = re.sub(r'\D', "", taskid)

        if str(num).__len__() == 0:
            return tablename + "_00"
        elif str(num).__len__() < 2:
            return tablename + "_0" + str(num)
        else:
            slen = str(num).__len__()
            return tablename  + "_" + str(num)[(slen - 2):slen]

