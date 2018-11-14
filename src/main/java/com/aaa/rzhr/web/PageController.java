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
      @RequestMapping("/Xding")
     public String Xding(){

          return "showdingding";
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
    @RequestMapping("QqueryEmp")
    public String QqueryEmp(){
        return "QqueryEmp";
    }
    @RequestMapping("QoneEmp")
    public String QoneEmp(){

        return "QoneEmp";
    }
    @RequestMapping("Qupdatemp")
    public String Qupdatemp(){

        return "Qupdatemp";
    }
    /**转正*/
    @RequestMapping("QmanageTurn")
    public String QmanageTurn(){

        return "QmanageTurn";
    }
    /**
     * 添加员工
     * */
    @RequestMapping("QaddEmp")
    public String QaddEmp(){
        return "QaddEmp";
    }
    /**入职*/
    @RequestMapping("QmanageEntry")
    public String QmanageEntry(){
        return "QmanageEntry";
    }
    /**离职查询*/
    @RequestMapping("QmanageDimission")
    public String QmanageDimission(){
        return "QmanageDimission";
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
    /**
     * 分组查询部门
     * */
    @RequestMapping("QGroupDept")
    public String QGroupDept(){
        return "QGroupDept";
    }
    /**
     * 转正
     * */
    @RequestMapping("QTurnJob")
    public String QTurnJob(){
        return "QTurnJob";
    }
    /**
     * 离职管理
     * */
    @RequestMapping("QResignation")
    public String QResignation(){
        return "QResignation";
    }
    /**
     * 离职详情
     * */
    @RequestMapping("QResignationJob")
    public String QResignationJob(){
        return "QResignationJob";
    }
    /**
     * 请假管理
     * */
    @RequestMapping("QManageLeave")
    public String QManageLeave(){
        return "QManageLeave";
    }
    @RequestMapping("QManageLeaveD")
    public String QManageLeaveD(){
        return "QManageLeaveD";
    }
    /**
     * 加班管理
     * */
    @RequestMapping("QManageOvertime")
    public String QManageOvertime(){
        return "QManageOvertime";
    }
    @RequestMapping("QManageOvertimeD")
    public String QManageOvertimeD(){
        return "QManageOvertimeD";
    }
    /**
     * 出差管理
     * */
    @RequestMapping("QManageTravel")
    public String QManageTravel(){
        return "QManageTravel";
    }
    @RequestMapping("QManageTravelD")
    public String QManageTravelD(){
        return "QManageTravelD";
    }
    /**实习合同.jsp*/
    @RequestMapping("QqueryConPractice")
    public String QqueryConPractice(){
        return "QqueryConPractice";
    }
    /**查看合同QqueryContractD*/
    @RequestMapping("QqueryContractD")
    public String QqueryContractD(){
        return "QqueryContractD";
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
    /**
     * 老板二级审批请假休假离职审批
     */
    @RequestMapping("/L_zong_leave")
    public  String L_zong_leave(){
        return "/L_zong_leave";
    }
    @RequestMapping("/L_zong_jiaban")
    public  String L_zong_jiaban(){
        return "/L_zong_jiaban";
    }
    @RequestMapping("/L_zong_lizhi")
    public  String L_zong_lizhi(){
        return "/L_zong_lizhi";
    }

    /**培训申请*/
    @RequestMapping("/L_pei")
    public  String L_pei(){
        return "/L_pei";
    }
    /**外出申请*/
    @RequestMapping("/L_out")
    public  String L_out(){
        return "/L_out";
    }
    /**转正申请报告*/
    @RequestMapping("/L_zhuan")
    public  String L_zhuan(){
        return "/L_zhuan";
    }
    /**一级审核 部门经理   出差 培训 转正*/
    @RequestMapping("L_yiji_out")
    public  String L_yiji_out(){
        return "L_yiji_out";
    }
    @RequestMapping("L_shen_out")
    public  String L_shen_out(){
        return "L_shen_out";
    }
    @RequestMapping("L_shen_zhuan")
    public  String L_shen_zhuan(){
        return "L_shen_zhuan";
    }
    /**二级审核*/
    @RequestMapping("L_erji_out")
    public  String L_erji_out(){
        return "L_erji_out";
    }
    @RequestMapping("L_zong_out")
    public  String L_zong_out(){
        return "L_zong_out";
    }
    @RequestMapping("L_zong_zhuan")
    public  String L_zong_zhuan(){
        return "L_zong_zhuan";
    }




    //----------------------------------靳风儒-------------------------
    /**
     * 课程审批
     */
    @RequestMapping("Japproval")
    public  String Japproval(){
        return "Japproval";
    }

    /**
     * 培训记录
     */
    @RequestMapping("Jjilu")
    public  String Jjilu(){
        return "Jjilu";
    }

    //----------------------------------岳梁朋-------------------------
    //招聘申请表

    @RequestMapping("Yapply")
    public String Yapply(){
        return "Yapply";
    }



    //招聘发布表
    @RequestMapping("Yfabu")
    public String Yfabu(){
        return "Yfabu";
    }
    //简历筛选

    @RequestMapping("Yshaixuan")
    public String Yshaixuan(){
        return "Yshaixuan";
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

    //员工录用推送
    @RequestMapping("Ytuisong")
    public String Ytuisong(){
        return "Ytuisong";
    }
    //员工录用回复
    @RequestMapping("Yhuifu")
    public String Yhuifu(){
        return "Yhuifu";
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
    @RequestMapping("Yjihuo")
    public String Yjihuo(){
        return "Yjihuo";
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
    @RequestMapping("sygxz")
    public String Sygxz(){ return "Sygxz"; }
    @RequestMapping("sjxbd")
    public String Sjxbd(){ return "Sjxbd"; }
    @RequestMapping("skhmb")
    public String Sjxkh(){ return "Skhmb"; }
    @RequestMapping("sjxpg")
    public String Sjxpg(){ return "Sjxpg"; }
    @RequestMapping("spgmx")
    public String Spgmx(String perid,String empid,Model mo){
        mo.addAttribute("perid",perid);
        mo.addAttribute("empid",empid);
        return "Spgmx";
    }
    @RequestMapping("sjxpgyg")
    public String Sjxpgyg(String perid,String empid,Model mo){
        mo.addAttribute("perid",perid);
        mo.addAttribute("empid",empid);
        return "Sjxpgyg";
    }



    //--------------------------------靳风儒
  @RequestMapping("/J200")
    public String  J200(){

        return "kecheng";
    }

}
