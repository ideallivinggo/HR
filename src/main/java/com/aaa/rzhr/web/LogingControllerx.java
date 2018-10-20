package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.TreeVO;
import com.aaa.rzhr.service.EmpService;
import com.aaa.rzhr.service.TreeService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author XBJ
 * @date 2018-10-16 15:25
 */
@Controller
public class LogingControllerx {

    @Autowired
    EmpService empService;

 @RequestMapping("checkuser")
    public @ResponseBody String  login(String empname, String emppassword, ServletRequest request){
        //System.out.println("进入主页");

        Subject subject= SecurityUtils.getSubject();
        UsernamePasswordToken token=new UsernamePasswordToken(empname,emppassword);
        try {
            subject.login(token);
              Session s=  subject.getSession();
                 Emp emp=empService.getByName(subject.getPrincipal().toString());
            s.setAttribute("emp",emp);
             return "okok";
        } catch (AuthenticationException e) {
           // e.printStackTrace();
            return "nono";
        }

    }
     @RequestMapping("logout")
    public String  logout(){
         System.out.println("注销登录");
         Subject subject= SecurityUtils.getSubject();
         subject.logout();

        return "redirect:login";
    }




}
