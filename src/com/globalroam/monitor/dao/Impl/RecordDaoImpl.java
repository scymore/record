package com.globalroam.monitor.dao.Impl;

import com.globalroam.monitor.common.MDSSqlSession;
import com.globalroam.monitor.dao.RecordDao;
import com.globalroam.monitor.domain.Record;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yuanrui on 2016/3/23.
 */
@Repository
@Transactional
public class RecordDaoImpl implements RecordDao {

    @Autowired
    MDSSqlSession mdsSqlSession;

    private Logger logger = Logger.getLogger(RecordDaoImpl.class);
    private SqlSession sqlSession;

    /**
     * 获取相关注册用户信息
     *
     * @param projectName 所属项目
     * @param fromDate    开始日期
     * @param toDate      结束日期
     * @param dataSource  数据源
     * @return
     */
    @Override
    public List<Record> getAll(String projectName, String fromDate, String toDate, String dataSource,Integer userId,Integer pageNum, Integer pageSize) {
        sqlSession = mdsSqlSession.getSQLSession(projectName);

        Map<String, Object> params = new HashMap<String, Object>();

        params.put("startIndex", ((pageNum - 1) * pageSize));
        params.put("endIndex", (pageNum * pageSize));
        params.put("fromDate", fromDate);
        params.put("toDate", toDate);
        params.put("format", "%Y-%c-%d %h:%i:%s");
        params.put("userId",userId);

        String method = this.getClass().getName() + "." + "getAll";

        logger.debug("execute: " + method);

        return sqlSession.selectList(method, params);
    }

    @Override
    public Integer delete(Integer id,String projectName) {
        sqlSession = mdsSqlSession.getSQLSession(projectName);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id",id);
        String method = this.getClass().getName() + "." + "delete";
        logger.debug("execute:" + method);
        return sqlSession.delete(method,params);
    }

    @Override
    public Integer add(String recordName, String recordValue, String projectName,Integer id) {
        sqlSession = mdsSqlSession.getSQLSession(projectName);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("recordName",recordName);
        params.put("recordValue",recordValue);
        params.put("id",id);
        String method = this.getClass().getName() + "." + "add";
        logger.debug("execute:" + method);
        return sqlSession.insert(method,params);
    }

    @Override
    public Integer update(Integer id, String recordName, String recordValue, String projectName) {
        sqlSession = mdsSqlSession.getSQLSession(projectName);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("recordName",recordName);
        params.put("recordValue",recordValue);
        params.put("id",id);
        String method = this.getClass().getName() + "." + "update";
        logger.debug("execute:" + method);
        return sqlSession.insert(method, params);
    }
}
