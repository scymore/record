package com.globalroam.monitor.common;

import org.apache.ibatis.session.SqlSession;

import java.util.Map;

/**
 * Created by zhangjian on 2016/2/29.
 */
public class MDSSqlSession {
    private Map<String,SqlSession> sqlSessionMap;

    public static String GNUM = "GNUM";
    public static String PFINGO = "PFINGO";

    public SqlSession getSQLSession(String sqlSessionName){
        return  sqlSessionMap.get(sqlSessionName);
    }

    public Map<String, SqlSession> getSqlSessionMap() {
        return sqlSessionMap;
    }

    public void setSqlSessionMap(Map<String, SqlSession> sqlSessionMap) {
        this.sqlSessionMap = sqlSessionMap;
    }
}
