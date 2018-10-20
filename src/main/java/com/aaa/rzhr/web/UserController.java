package com.aaa.rzhr.web;


import com.aaa.rzhr.pojo.Apply_Leave;
import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    private Integer empid;
    /**个人信息中心*/
@RequestMapping("/L_query_user")
    public @ResponseBody List<Map> L_query_user(Integer empid, HttpServletRequest request){
    List<Map> list=userService.L_query_user(empid);
    HttpSession session=request.getSession();
    System.out.println("你是傻逼  你知道吗");
    session.setAttribute("emp",list.get(0));
     return  list;
}
    /**申请请假添加*/
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(HttpServletRequest req, @RequestParam("file") MultipartFile file, Model m,Apply_Leave apply_leave) {
        try {
            String fileName = System.currentTimeMillis()+file.getOriginalFilename();
            String destFileName=req.getServletContext().getRealPath("")+"upload"+ File.separator+fileName;
            File destFile = new File(destFileName);
            destFile.getParentFile().mkdirs();
            file.transferTo(destFile);
            System.out.println(apply_leave.getLeaenterdate()+"日期");
            System.out.println(fileName);
            m.addAttribute("fileName",fileName);
            String aa="upload/"+fileName;
            System.out.println(aa);
             userService.L_add_leave(apply_leave.getEmpid(),aa,apply_leave.getLeaday(),apply_leave.getLeatype(),apply_leave.getLeareason(),apply_leave.getLeaenterdate());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return "上传失败," + e.getMessage();
        } catch (IOException e) {
            e.printStackTrace();
            return "上传失败," + e.getMessage();
        }

        return "L_shouye";
    }

    public Integer getEmpid() {

        return empid;
    }

    public void setEmpid(Integer empid) {

        this.empid = empid;
    }
}
