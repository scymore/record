package com.globalroam.monitor.action;

import com.globalroam.monitor.service.RecordService;
import com.grcms.common.util.CommonUtility;
import com.grcms.core.response.JsonResponse;
import com.grcms.core.util.CMSInit;
import com.grcms.core.util.ForwardUtility;
import com.grcms.core.util.HttpUtility;
import com.grcms.management.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Created by yuanrui on 2016/3/23.
 */
@Controller
@RequestMapping("/management/record")
public class RecordController {

    @Autowired
    RecordService recordService;

    /**
     * 跳转到用户报表页面
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String recordList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("date", defaultDate());
        return ForwardUtility.forwardAdminView("/report/record");
    }

    /**
     * 通过freemarker模板获取用户报表数据
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public String recordInfo(HttpServletRequest request, HttpServletResponse response) {
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

        User user = (User) request.getSession().getAttribute(CMSInit.CMS_USER_KEY);
        request.setAttribute("projectName", user.getProject());
        request.setAttribute("fromDate", fromDate);
        request.setAttribute("toDate", toDate);
        request.setAttribute("userId", user.getId());
        return ForwardUtility.forwardAdminView("/report/data/data_json_record_list");
    }

    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public void delete(HttpServletRequest request, HttpServletResponse response){
        Integer id = Integer.parseInt(request.getParameter("id"));
        User user = (User) request.getSession().getAttribute(CMSInit.CMS_USER_KEY);
        recordService.delete(id, user.getProject());
        HttpUtility.writeToClient(response, CommonUtility.toJson(new JsonResponse()));
    }

    @RequestMapping(value = "add",method = RequestMethod.GET)
    public String goAdd(HttpServletRequest request,HttpServletResponse response){
        return ForwardUtility.forwardAdminView("/report/add_record");
    }

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public void addRecord(HttpServletRequest request, HttpServletResponse response){
        String recordName = request.getParameter("recordName");
        String recordValue = request.getParameter("recordValue");

        Assert.notNull(recordName);
        Assert.notNull(recordValue);

        User user = (User) request.getSession().getAttribute(CMSInit.CMS_USER_KEY);
        recordService.add(recordName ,recordValue , user.getProject(),user.getId());
        HttpUtility.writeToClient(response, CommonUtility.toJson(new JsonResponse()));
    }

    @RequestMapping(value = "update",method = RequestMethod.GET)
    public String goUpdate(HttpServletRequest request,HttpServletResponse response){
        Integer id = Integer.parseInt(request.getParameter("id"));
        String recordName = request.getParameter("recordName");
        String recordValue = request.getParameter("recordValue");

        Assert.notNull(id);
        Assert.notNull(recordName);
        Assert.notNull(recordValue);

        request.setAttribute("id", id);
        request.setAttribute("recordName", recordName);
        request.setAttribute("recordValue", recordValue);

        return ForwardUtility.forwardAdminView("/report/update_record");
    }

    @RequestMapping(value = "update",method = RequestMethod.POST)
    public void updateRecord(HttpServletRequest request,HttpServletResponse response){
        Integer id = Integer.parseInt(request.getParameter("id"));
        String recordName = request.getParameter("recordName");
        String recordValue = request.getParameter("recordValue");

        Assert.notNull(id);
        Assert.notNull(recordName);
        Assert.notNull(recordValue);

        User user = (User) request.getSession().getAttribute(CMSInit.CMS_USER_KEY);
        recordService.update(id, recordName, recordValue, user.getProject());

        HttpUtility.writeToClient(response, CommonUtility.toJson(new JsonResponse()));
    }

    /**
     * 获取当前的日期
     */
    private String defaultDate() {
        Calendar calendar = Calendar.getInstance();
        return new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
    }
}
