package com.aaa.rzhr.web;

import com.aaa.rzhr.service.DeptService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
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

/**
 * 查询部门
 * */
    @RequestMapping("QueryDeptYqx")
    @ResponseBody
    public List<Map> QueryDeptYqx(){
        System.out.println(service.QueryDeptYqx()+"dddddddddddddd");
        return service.QueryDeptYqx();
    }

    @RequestMapping("QueryDeptSelectYqx")
    @ResponseBody
    public List<Map> QueryDeptSelectYqx(HttpServletRequest request){
        System.out.println("ssssssssscxffffffffffffffffffffffffffffffff");
        HttpSession session = request.getSession();
        List<Map> listSelect = service.QueryDeptYqx();
        session.setAttribute("listSelect",listSelect);
        return listSelect;
    }


    @RequestMapping("addDept")
    @ResponseBody
    public String addDept(String deptName,Integer deptnum){
        System.out.println(deptName);
        service.addDept(deptName,deptnum);
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
