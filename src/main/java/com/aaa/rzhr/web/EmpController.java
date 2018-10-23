package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.service.EmpService;
import com.aaa.rzhr.service.TreeService;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author XBJ
 * @date 2018-10-16 23:28
 */
 @Controller
public class EmpController {
      @Autowired
    EmpService empService;

      @Autowired
    TreeService treeService;

     @RequestMapping("testadduser")
     public String testadEmp(){
         System.out.println("进入主页面testadduser");
         System.out.println("添加用户");

         String salt = new SecureRandomNumberGenerator().nextBytes().toString();
         int times = 2;
         String algorithmName = "md5";
         String encodedPassword = new SimpleHash(algorithmName, "12345", salt, times).toString();

         System.out.println(encodedPassword);
         System.out.println(salt);
         Emp emp=new Emp();
         emp.setEmpnumber("admin");
         emp.setPassword(encodedPassword);
         emp.setSalt(salt);

         empService.addEmp(emp);
         return "index";
     }

    @RequestMapping("QqueryEmp")
    public @ResponseBody
    PageInfo<Map> QqueryEmp(Integer pageNum, Integer deptid, String empname,Integer poid,Integer emptypeid){
        System.out.println("查询"+"部门"+deptid+"姓名"+empname);
        PageInfo<Map> info = empService.QqueryEmp(pageNum,deptid,empname,poid,emptypeid);
        System.out.println(info);
        return info;
    }
    @RequestMapping("QqueryEmpIf")
    public @ResponseBody
    List<Map> QqueryEmpIf(Integer empid, HttpServletRequest request){
        System.out.println(empid+"sqqqqqqqqqqqqqqqqqs");
        List<Map> list = empService.QqueryEmpIf(empid);
        HttpSession session = request.getSession();
        session.setAttribute("list",list.get(0));
        return list;
    }
    @RequestMapping("DelEmpYqx")
    @ResponseBody
    public String DelEmpYqx(String s){
        String ss = s.substring(0,s.length()-1);
        System.out.println(ss+"ssssssssssssssssssssssssssssssss");
        empService.DelEmpYqx(ss);
        return "true";
    }
}
