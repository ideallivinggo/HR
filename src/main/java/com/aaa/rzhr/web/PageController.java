package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.Activation;
import com.aaa.rzhr.pojo.TreeVO;
import com.aaa.rzhr.service.TreeService;
import com.aaa.rzhr.service.YapplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletRequest;
import java.util.List;

@Controller
public class PageController {
    @Autowired
    TreeService treeService;
    @Autowired
    YapplyService yapplyService;

     @RequestMapping("login")
     public  String aa(){
         return "login";
     }
     @RequestMapping("index")
     public String index(Model model){
         System.out.println("进入主页面");
         List<TreeVO> treevo = treeService.queryall();
          model.addAttribute("treevo",treevo);
         return "index";
     }
    @RequestMapping("test")
      public String xutest(){

         return "test";
      }


     @RequestMapping("me")
     public String bb(){

         return "me";
     }
    @RequestMapping("you")
    public String you(){

        return "you";
    }
    @RequestMapping("unauthorized")
    public String unauthorized(){

        return "unauthorized";
    }
    @RequestMapping("testmessage")
    public String testmessage(){

        return "testmssage";
    }
///----------------------------------于青县区--------------------------------//
@RequestMapping("Qemp")
public String Qemp(){

    return "Qemp";
}
    @RequestMapping("QoneEmp")
    public String QoneEmp(){

        return "QoneEmp";
    }
    @RequestMapping("QupdateEmp")
    public String QupdateEmp(){
        return "QupdateEmp";
    }
    @RequestMapping("Qdept")
    public String Qdept(){
        return "Qdept";
    }

    @RequestMapping("QqueryContract")
    public String QqueryContract(){
        return "QqueryContract";
    }
    @RequestMapping("Qmanage")
    public String Qmanage(){
        return "Qmanage";
    }

    ///----------------------------------李佳鹏区--------------------------------//

    /**
     * 用户个人信息
     */
    @RequestMapping("L_user")
    public  String user(){
        return "L_user";
    }
    /**
     * 员工登录后首页
     */
    @RequestMapping("L_shouye")
    public  String L_shouye(){
        return "L_shouye";

    }
    /**
     * 员工薪资
     */
    @RequestMapping("L_salary")
    public  String L_salary(){
        return "L_salary";

    }
    /**
     * 员工通讯录
     */
    @RequestMapping("L_list")
    public  String L_list(){
        return "L_list";

    }


    /**
     * 员工请假审批
     */
    @RequestMapping("L_leave")
    public  String L_leave(){
        return "L_leave";

    }
    //----------------------------------岳梁朋-------------------------
    //招聘申请表
    @RequestMapping("Yapply")
    public String Yapply(){
        return "Yapply";
    }
    //招聘发布表
    @RequestMapping("Yissue")
    public String Yissue(){
        return "Yissue";
    }
    //简历筛选
    @RequestMapping("Yresume")
   public String Yresume(){
        return "Yresume";
    }
    //简历人才资源库
    @RequestMapping("Ytalents")
    public String Ytalents(){
        return "Ytalents";
    }
    //面试表
    @RequestMapping("Yinterview")
    public String Yinterview(){
        return "Yinterview";
    }
    @RequestMapping("Yinterviewtwo")
    public String Yinterviewtwo(){
        return "Yinterviewtwo";
    }
    //员工录用推送
    @RequestMapping("Yhire")
    public String Yhire(){
        return "Yhire";
    }
    //员工录用回复details
    @RequestMapping("Yreply")
    public String Yreply(){
        return "Yreply";
    }

    @RequestMapping("jihuo")
    public String jihuo(String gh, String name, ServletRequest req){
        req.setAttribute("name",name);
        req.setAttribute("gh",gh);
        Activation a=new Activation();
        a.setActnumber(gh);
        String p=yapplyService.judge(a);
      if (p.equals("")){
          return "jihuo";
      }else {
          return "jihuoOK";
      }
    }
    //激活详情
    @RequestMapping("Ydetails")
    public String Ydetails(){
        return "Ydetails";
    }



   //----------------------------------宋金鹏-------------------------
    @RequestMapping("spaydata")
    public String Spaydata(){
        return "Spaydata";
    }
    @RequestMapping("sxztz")
    public String Sxztz(){
        return "Sxztz";
    }

}
