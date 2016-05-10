package com.globalroam.monitor.action;

import com.grcms.core.util.CMSInit;
import com.grcms.core.util.ForwardUtility;
import com.grcms.management.domain.User;
import org.springframework.stereotype.Controller;
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
        request.setAttribute("userId",user.getId());
        return ForwardUtility.forwardAdminView("/report/data/data_json_record_list");
    }

    /**
     * 获取前一天的日期
     */
    private String defaultDate() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, -1);
        return new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
    }
}
