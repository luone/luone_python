#!/usr/bin/python
# coding=UTF-8

from mongobase import *
import time


class pmrealReportDetail:
    '''
        需要mongo支持
    '''
    mongo = MongoBase()
    # 1.获取所有的报告，从报告中获取taskid,subtaskid,subsubtaskid,orderNum
    # 2.查找单条的pmrealAdaptResult_  找到scriptid,scriptNo,orderNum
    # 3.查询单条的pmrealScriptSummay  找到scripts节点  一一赋值给pmrealReportDetail
    '''
        获取单个脚本
    '''

    def get_pm_real_script_summary(self, task_id, script_id, script_no, oder_num, table_index):
        # logger.debug("get pmrealScriptSummary starting")
        if not all([task_id, script_id, script_no, oder_num]):
            logger.error("please check params,"
                         "task_id:%s, script_id:%s, script_no:%s, oder_num:%s,table_index:%s",
                         task_id, script_id, script_no, oder_num, table_index)
            return None

        script_summary_table = "pmrealScriptSummary_" + table_index
        # 查询条件字典
        sqldict = {
            "taskid": task_id,
            "scriptId": script_id,
            "scriptNo": script_no,
            "orderNum": oder_num
        }
        # 过滤字典
        filterdict = {
            "scripts": 1,
            "_id": 1
        }
        # logger.debug("get pmrealScriptSummary params:%s", sqldict)
        # 脚本信息
        script_summary = self.mongo.mongoQueryOne(script_summary_table, sqldict, filterdict)
        if script_summary is None:
            logger.error("script_summary is none, params:" + str(sqldict))
            return None

        # logger.debug("get pmrealScriptSummary end, value:%s", script_summary)
        return script_summary

    '''
        获取单个pmrealAdaptResult
    '''

    def get_pm_real_adapt_result(self, task_id, sub_task_id, sub_sub_task_id, order_num, table_index):
        # logger.debug("get pmrealAdaptResult starting")
        if not all([task_id, sub_task_id, sub_sub_task_id, order_num, table_index]):
            logger.error("please check params")
            return None

        report_detail_table = 'pmrealAdaptResult_' + table_index

        # 查询条件字典
        sqldict = {
            "taskid": task_id,
            "subtaskid": sub_task_id,
            "tasks.subsubtaskid": sub_sub_task_id,
            "adaptscript.orderNum": order_num
        }
        # logger.debug("get pmrealAdaptResult params:%s", sqldict)
        # 过滤字典
        filterdict = {
            "adaptscript": 1,
            "_id": 1
        }
        adapt_result = self.mongo.mongoQueryOne(report_detail_table, sqldict, filterdict)
        if adapt_result is None:
            logger.error("adapt_results is none, params:" + str(sqldict))
            return

        # logger.debug("get pmrealAdaptResult end, value:%s", adapt_result)
        return adapt_result

    def get_all_pm_real_report_detail(self):
        report_detail_table = 'pmrealReportDetail_'
        # all_update_count = 0

        for i in range(0, 100):
            table_index = '%02d' % i
            tableName = report_detail_table + table_index
            logger.debug("开始处理表：%s", tableName)
            try:
                self.handle_report_detail(tableName, table_index)
            except Exception as e:
                print(e)
                logger.error(tableName)
                logger.error(e)
            logger.debug("表：%s，数据已处理完成", tableName)

    '''
        处理数据 分页处理
    '''

    def handle_report_detail(self, tableName, table_index):
        # 查询report_detail总数
        count = self.mongo.mongoQuery(tableName, {}, {"_id": 1}).count()
        # 单页数量
        page_size = 50
        # 页数
        page_no = 1
        # 总页数
        page_count = count / page_size + 1
        # 返回的字段
        filterdict = {"_id": 1, "taskid": 1, "subtaskid": 1, "subsubtaskid": 1, "orderNum": 1, "testCases": 1}
        while page_no < page_count:
            report_details = self.mongo.mongoQuery(tableName, {}, filterdict, page_size, page_no)
            self.handler_report_detail_testcases(report_details, tableName, table_index)
            page_no = page_no + 1

    '''
        处理每个report_detail中的testcases
    '''

    def handler_report_detail_testcases(self, report_details, tableName, table_index):
        # 遍历每一个报告详情
        for report_detail in report_details:
            # 判断report_detail是否包含testCases
            if "testCases" not in report_detail:
                continue

            # 判断testCases是否为空
            test_cases = report_detail['testCases']
            if test_cases is None:
                logger.debug("report_detail.test_cases is None :%s", test_cases)
                continue

            # 获取adapt_result结果信息
            taskid = report_detail['taskid']
            subtaskid = report_detail['subtaskid']
            subsubtaskid = report_detail['subsubtaskid']
            order_num = report_detail['orderNum']
            adapt_result = self.get_pm_real_adapt_result(taskid, subtaskid, subsubtaskid, order_num,
                                                         table_index)
            if adapt_result is None:
                logger.error("adapt_result is None")
                continue

            # 获取脚本信息
            scriptid = adapt_result['adaptscript']['scriptid']
            scriptno = adapt_result['adaptscript']['scriptNo']
            script_summary = self.get_pm_real_script_summary(taskid, scriptid, scriptno, order_num, table_index)
            if script_summary is None:
                logger.error("script_summary is None")
                continue

            script_summary_scripts = script_summary['scripts']
            if script_summary_scripts is None:
                logger.error("script_summary_scripts is None, script_summary :%s", script_summary)
                continue

            self.update_report_detail_testcases(report_detail, script_summary_scripts, tableName, test_cases)

    '''
        更新report_detail_testcases数据
    '''

    def update_report_detail_testcases(self, report_detail, script_summary_scripts, tableName, test_cases):
        # 是否需要更新
        is_need_update = False
        # 修改之后的test_cases
        new_test_cases = test_cases
        # test_cases
        for index, value in enumerate(test_cases):
            summary_script = script_summary_scripts[index]
            script_tag = summary_script['scriptTag']

            # 下标为0，代表主脚本，判断主脚本是否callTag是否有正确
            if index == 0:
                if script_tag != value['callTag']:
                    logger.debug("主脚本不一致，taskid:%s,正确的callTag:%s ,错误的callTag:%s, 修改的数据id为:%s,taskid:%s",
                                 report_detail['taskid'], script_tag, value['callTag'],
                                 report_detail["_id"])
                    new_test_cases[index]['callTag'] = script_tag
                    is_need_update = True
                continue

            # 判断调用脚本的callTag是否正确
            caller_script_no = summary_script['callerScriptNo']
            caller_step_id = summary_script['callerStepid']
            # 此处caller_script_no是int类型需要转字符串
            if str(caller_script_no) == value['callerCaseid'] and caller_step_id == value['stepid']:
                # 如果test_cases中的script_tag和  summary_script#scriptTag不等，则需要更新
                if script_tag != value['callTag']:
                    logger.debug("正确的callTag:%s ,错误的callTag:%s, 修改的数据id为:%s, 任务ID:%s", script_tag, value['callTag'],
                                 report_detail["_id"], report_detail['taskid'])
                    new_test_cases[index]['callTag'] = script_tag
                    is_need_update = True
            else:
                summary_script_error_msg = "summary_script中的scripts数据： scriptcaller_script_no:%s,caller_step_id:%s,   "
                reportdetail_error_mgs = "reportdetail中的testcase数据：callerCaseid:%s,stepid:%s "
                logger.error(
                    "更新报告信息taskid为：%s报错，原因：" + summary_script_error_msg + reportdetail_error_mgs,
                    report_detail['taskid'], caller_script_no, caller_step_id,
                    value['callerCaseid'], value['stepid'])
                # logger.error("callerScriptNo or callerCaseid is not matach, script_summary_scripts:%s,\n"
                # "test_case:%s", script_summary_scripts, value)
                continue
        # 更新操作。
        id = report_detail["_id"]
        if is_need_update:
            update_sqldict = {"_id": id}
            update_values = {'$set': {"testCases": new_test_cases}}
            self.mongo.mongoUpdateOne(tableName, update_sqldict, update_values)
            # logger.debug("update success, _id:%s, table_name:%s，任务id：%s", id, tableName, report_detail["taskid"])


#
# main
#
if __name__ == '__main__':
    start_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    print("数据开始执行更新,开始时间:%s", start_time)
    pmrealReportDetail = pmrealReportDetail()
    pmrealReportDetail.get_all_pm_real_report_detail()
    end_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    print("数据全部更新完成,结束时间:%s", end_time)
