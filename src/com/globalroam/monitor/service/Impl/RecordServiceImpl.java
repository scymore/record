package com.globalroam.monitor.service.Impl;

import com.globalroam.monitor.dao.RecordDao;
import com.globalroam.monitor.domain.DataTable;
import com.globalroam.monitor.domain.Record;
import com.globalroam.monitor.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by yuanrui on 2016/3/23.
 */
@Service
public class RecordServiceImpl implements RecordService {

    @Autowired
    RecordDao userStatDao;

    /**
     * 获取相关信息
     *
     * @param projectName 所属项目
     * @param fromDate    开始日期
     * @param toDate      结束日期
     * @param dataSource  数据源
     * @return
     */
    @Override
    public DataTable<Record> getRecordList(String projectName, String fromDate, String toDate, String dataSource,Integer userId,Integer pageNum, Integer pageSize) {
        DataTable<Record> userStatDataTable = new DataTable<Record>();
        userStatDataTable.setDatas(userStatDao.getAll(projectName, fromDate, toDate, dataSource,userId,pageNum,pageSize));
        return userStatDataTable;
    }
}
