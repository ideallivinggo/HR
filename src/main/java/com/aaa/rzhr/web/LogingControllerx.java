package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.service.EmpService;
import com.aaa.rzhr.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author XBJ
 * @date 2018-10-16 15:25
 */
@Controller
public class LogingControllerx {

    @Autowired
    EmpService empService;
    UserService userService;

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


            List<Emp> listb=empService.queryallempX();
            Map<String,Emp> map=new HashMap<>();
            for (Emp e:listb
                    ) {
                System.out.println();
                map.put("a"+e.getEmpid().toString(),e);
            }
            s.setAttribute("listemp",map);
           // System.out.println(map.toString());

            return "okok";

        } catch (AuthenticationException e) {
            return "nono";
        }
    }

      @RequestMapping("L_update_pwd")
      public @ResponseBody String updatePassword(String empnumber,String password,String repassword){


          System.out.println(empnumber+"empnumber");
          String salt = new SecureRandomNumberGenerator().nextBytes().toString();
          int times = 2;
          String algorithmName = "md5";
          System.out.println(salt);
         String encodedPassword = new SimpleHash(algorithmName, repassword, salt, times).toString();
          System.out.println("***************************"+encodedPassword+"!!!!!");
          Emp emp=new Emp();
           emp.setEmpnumber(empnumber);
           emp.setPassword(encodedPassword);
           emp.setSalt(salt);
         // userService.L_update_pwd(emp);
        return "1";
      }

     @RequestMapping("logout")
    public String  logout(){
         System.out.println("注销登录");
         Subject subject= SecurityUtils.getSubject();
         subject.logout();

        return "redirect:login";
    }




}
