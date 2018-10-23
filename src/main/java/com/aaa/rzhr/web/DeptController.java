package com.aaa.rzhr.web;

import com.aaa.rzhr.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author YQL
 * @date 2018/10/22 15:02
 */
@Controller
public class DeptController {

    @Autowired
    private DeptService service;


    @RequestMapping("QueryDeptYqx")
    @ResponseBody
    public List<Map> QueryDeptYqx(){
        System.out.println(service.QueryDeptYqx());
        return service.QueryDeptYqx();
    }
    @RequestMapping("addDept")
    @ResponseBody
    public String addDept(String deptName){
        System.out.println(deptName);
        service.addDept(deptName);
        return "true";
    }
    @RequestMapping("delDept")
    @ResponseBody
    public String delDept(Integer deptId){
        System.out.println(deptId);
        service.delDept(deptId);
        return "true";
    }
}
