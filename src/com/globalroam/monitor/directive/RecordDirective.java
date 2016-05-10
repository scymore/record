package com.globalroam.monitor.directive;

import com.globalroam.monitor.domain.DataTable;
import com.globalroam.monitor.domain.Record;
import com.globalroam.monitor.service.RecordService;
import com.grcms.core.freemarker.FreemarkerTemplateUtility;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import java.io.IOException;
import java.util.Map;

/**
 * Created by yuanrui on 2016/3/23.
 */
public class RecordDirective implements TemplateDirectiveModel {

    @Autowired
    RecordService recordService;

    private String DATA_SOURCE = "";

    @Override
    public void execute(Environment environment, Map map, TemplateModel[] templateModels, TemplateDirectiveBody templateDirectiveBody) throws TemplateException, IOException {
        // 从前端获取信息
        String projectName = FreemarkerTemplateUtility.getStringValueFromParams(map, "projectName");
        String toDate = FreemarkerTemplateUtility.getStringValueFromParams(map, "toDate");
        String fromDate = FreemarkerTemplateUtility.getStringValueFromParams(map, "fromDate");
        Integer userId = Integer.parseInt(FreemarkerTemplateUtility.getStringValueFromParams(map, "userId"));
        Integer pageNum = FreemarkerTemplateUtility.getIntValueFromParams(map, "pageNum");
        Integer pageSize = FreemarkerTemplateUtility.getIntValueFromParams(map, "pageSize");

        // 判断获取到的信息是否为空
        Assert.notNull(projectName);
        Assert.notNull(toDate);
        Assert.notNull(fromDate);
        Assert.notNull(userId);
        Assert.notNull(pageNum);
        Assert.notNull(pageSize);

        // 根据不同项目进入对应数据源
        if (projectName.equals("GNUM")) {
            DATA_SOURCE = "SOCIALDIAL";
        } else {
            // for product DB
             DATA_SOURCE = "PFINGO_P";
            // for stage DB
//            DATA_SOURCE = "PFINGO_S";
        }

        // 调用service层获取数据
        DataTable<Record> userStat = recordService.getRecordList(projectName, fromDate, toDate, DATA_SOURCE,userId,pageNum, pageSize);

        // 将获取到的数据封装到模板模型中
        templateModels[0] = ObjectWrapper.DEFAULT_WRAPPER.wrap(userStat.getDatas());
        templateModels[1] = ObjectWrapper.DEFAULT_WRAPPER.wrap(userStat.getDatas().size());

        // 将封装后的数据返回到freemarker模板中转换为json对象
        templateDirectiveBody.render(environment.getOut());
    }
}
