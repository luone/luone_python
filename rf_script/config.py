#!/usr/bin/python
#coding=UTF-8
import logging
from logging.config import dictConfig


# log setting
import pymysql

logging_config = dict(
    version = 1,
    formatters = {
        'f': {'format':
              '%(asctime)s %(name)-12s %(levelname)-8s %(message)s'}
        },
    handlers = {
        'h': {'class': 'logging.StreamHandler',
              'formatter': 'f',
              'level': logging.DEBUG},
        'file': {'class': 'logging.handlers.RotatingFileHandler',
               'formatter': 'f',
               'filename': 'testinprov7.2.0.log',
               'maxBytes': 1000000000,
               'backupCount': 3}
        },


    root = {
        'handlers': ['file'],
        'level': logging.DEBUG,
        },
)
dictConfig(logging_config)
# logging
logger = logging.getLogger()

# 数据库配置
dbconfig = {
    "mongodb": {
        #"host": "mongo.pro.testin.cn",
        "host": "127.0.0.1",
        "port": 27017
    },
    "mysql": {
        "host": "mysql.pro.testin.cn",
        "port": 3306,
        "db": "db_file",
        "user": "clouduser",
        "password": "87b96d06",
        "charset": "utf8mb4",
        "cursorclass": pymysql.cursors.DictCursor
    }
}
