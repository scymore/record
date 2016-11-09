package com.globalroam.monitor.service;

import com.globalroam.monitor.domain.DataTable;
import com.globalroam.monitor.domain.Record;

/**
 * Created by yuanrui on 2016/3/23.
 */
public interface RecordService {
    DataTable<Record> getRecordList(String projectName, String fromDate, String toDate, String dataSource, Integer userId, Integer pageNum, Integer pageSize);

    Integer delete(Integer id, String projectName);

    Integer add(String recordName, String recordValue, String projectName, Integer id);

    Integer update(Integer id, String recordName, String recordValue, String projectName);

    Boolean exist(String recordName, String projectName);
}
