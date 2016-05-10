package com.globalroam.monitor.dao;

import com.globalroam.monitor.domain.Record;

import java.util.List;

/**
 * Created by yuanrui on 2016/3/23.
 */
public interface RecordDao {
    /**
     * 获取相关注册用户信息
     *
     * @param projectName 所属项目
     * @param fromDate    开始日期
     * @param toDate      结束日期
     * @param dataSource  数据源
     * @return
     */
    List<Record> getAll(String projectName, String fromDate, String toDate, String dataSource,Integer userId,Integer pageNum, Integer pageSize);

    Integer delete(Integer id,String projectName);

    Integer add(String recordName,String recordValue, String projectName,Integer id);

    Integer update(Integer id,String recordName,String recordValue,String projectName);
}
