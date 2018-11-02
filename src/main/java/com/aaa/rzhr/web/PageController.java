package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.TreeVO;
import com.aaa.rzhr.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class PageController {
    @Autowired
    TreeService treeService;

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
    @RequestMapping("/sendnotice")
    public String sendnotice(){
      return "sendmessage";
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

    /**
     * 员工考勤
     */
    @RequestMapping("L_kaoqin")
    public  String L_kaoqin(){
        return "L_kaoqin";

    }

    /**
     * 员工加班
     */
    @RequestMapping("L_jiaban")
    public  String L_jiaban(){
        return "L_jiaban";
    }

    /**
     * 员工离职申请
     */
    @RequestMapping("L_lizhi")
    public  String L_lizhi(){
        return "L_lizhi";
    }

    /**
     * 员工请假休假离职审批
     */
    @RequestMapping("L_1111")
    public  String L_1111(){
        return "L_1111";
    }
    //----------------------------------月亮鹏-------------------------

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
    @RequestMapping("Ytalents")
    public String Ytalents(){
        return "Ytalents";
    }
    @RequestMapping("Yinterview")
    public String Yinterview(){
        return "Yinterview";
    }
    @RequestMapping("Yinterviewtwo")
    public String Yinterviewtwo(){
        return "Yinterviewtwo";
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
