package com.globalroam.monitor.service;

import com.globalroam.monitor.domain.DataTable;
import com.globalroam.monitor.domain.Record;

/**
 * Created by yuanrui on 2016/3/23.
 */
public interface RecordService {
    DataTable<Record> getRecordList(String projectName, String fromDate, String toDate, String dataSource,Integer userId,Integer pageNum, Integer pageSize);
}
