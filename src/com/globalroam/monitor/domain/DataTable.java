package com.globalroam.monitor.domain;

import java.util.List;

/**
 * Created by Administrator on 2016/3/4.
 */
public class DataTable<T> {

    private List<T> datas;
    private Integer records;
    private Integer recordsFiltered;


    public List<T> getDatas() {
        return datas;
    }

    public void setDatas(List<T> datas) {
        this.datas = datas;
    }

    public Integer getRecords() {
        return records;
    }

    public void setRecords(Integer records) {
        this.records = records;
    }

    public Integer getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(Integer recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }
}
