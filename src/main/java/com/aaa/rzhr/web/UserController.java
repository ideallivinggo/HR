package com.aaa.rzhr.web;


import com.aaa.rzhr.pojo.*;
import com.aaa.rzhr.service.UserService;
import com.aaa.rzhr.util.LayuiFy;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
            Date date = new Date();
            //设置要获取到什么样的时间
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            //获取String类型的时间
            String createdate = sdf.format(date);
             userService.L_add_leave(apply_leave.getEmpid(),aa,apply_leave.getLeaday(),apply_leave.getLeatype(),apply_leave.getLeareason(),apply_leave.getLeaenterdate(),createdate,0,apply_leave.getDeptid());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return "上传失败," + e.getMessage();
        } catch (IOException e) {
            e.printStackTrace();
            return "上传失败," + e.getMessage();
        }

        return "L_shouye";
    }
    /*查询未审核  待审核0 通过1 驳回2 待审核撤销3 撤销同意4 撤销驳回5 */
@RequestMapping("L_query_leave")
public  @ResponseBody  List<Map> L_query_leave(Integer empid){
 List<Map> list= userService.L_query_leave(empid);
    System.out.println(list.get(0));
    return list;
}
/*
* 薪资
* */
@RequestMapping("L_query_pay")
public  @ResponseBody
LayuiFy L_query_pay(Integer empid, Integer limit, Integer page){

    System.out.println(empid+"========================-------------");
    return  userService.L_query_pay(empid,limit,page);
}
/**
*加班申请
 */
@RequestMapping("L_add_jiaban")
public  String    L_add_j(Apply_Overtime app, double apovhour_1, double apovhour_2){
    System.out.println(apovhour_1+".....................");
    System.out.println(apovhour_2+"++++++++++++++++++");
    double aa=apovhour_1*8+apovhour_2;
    String bb="";
       String cc=   aa+bb;

    Date date = new Date();
    //设置要获取到什么样的时间
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //获取String类型的时间
    String createdate = sdf.format(date);
   userService.L_add_jiaban(app.getEmpid(),app.getApovtype(),app.getApovstartdate(),createdate,cc,app.getApovreason(),0,app.getDeptid());
    return "L_shouye";
}
    /**
     *离职申请
     */
    @RequestMapping("L_add_lizhi")
    public  String    L_add_lizhi(Apply_Dimission ad){
        System.out.println(ad.getDeptid());
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        userService.L_add_lizhi(ad.getEmpid(),ad.getDimtype(),ad.getDimdetails(),ad.getDimsuggest(),"未移交",createdate,0,ad.getDeptid());
        return "L_shouye";
    }

/*休假*/
    @RequestMapping("L_query_xiujia")
    public  @ResponseBody  List<Map> L_query_xiujia(Integer empid, String fristdate, String overdate, Integer leasate,Integer deptid){
        System.out.println(deptid+"nnnnnnnnnnnnnnnnnnnnnnnnn");
        List<Map> list= userService.L_query_xiujia(empid, fristdate, overdate,leasate,deptid);
        return list;
    }

/*加-------------班*/
    @RequestMapping("L_query_jiaban")
    public  @ResponseBody  List<Map> L_query_jiaban(Integer empid, String fristdate, String overdate, Integer apovstate,Integer deptid){
        System.out.println(empid+"44444444444444444444444");
        System.out.println(fristdate+"333333333333333");
        System.out.println(overdate+"222222222222222222");


        List<Map> list= userService.L_query_jiaban(empid, fristdate, overdate,apovstate,deptid);

        return list;
    }
    /*-----------离职*/

    @RequestMapping("L_query_cizhi")
    public  @ResponseBody  List<Map> L_query_cizhi(Integer empid, String fristdate, String overdate, Integer dimstate,Integer deptid){
        List<Map> list= userService.L_query_cizhi(empid, fristdate, overdate,dimstate,deptid);

        return list;
    }


/*------------------------------撤回休假*/
    @RequestMapping("L_update_xiujia")
    public @ResponseBody   String L_update_xiujia(Integer  leaid){
        System.out.println(leaid);
        userService.L_update_xiujia(leaid);

        return "ok";
    }
    /*------------------------------撤回加班*/
    @RequestMapping("L_update_jiaban")
    public  @ResponseBody  String  L_update_jiaban(Integer apovid){
     userService.L_update_jiaban(apovid);
        return "ok";
    }

    /*------------------------------撤回离职*/
    @RequestMapping("L_update_cizhi")
    public  @ResponseBody String L_update_cizhi( Integer dimid){
     userService.L_update_cizhi(dimid);
        return "ok";
    }
    /*------------------------------通讯录员工查询*/
    @RequestMapping("L_query_emp")
    public  @ResponseBody List<Map> L_query_emp(Integer deptid){
        System.out.println(deptid+"------------------------------------");
        System.out.println(userService.L_query_emp(deptid));
        return userService.L_query_emp(deptid);
    }
    /*------------------------------通讯录员工姓名查询*/
    @RequestMapping("L_query_emp_name")
    public  @ResponseBody List<Map> L_query_emp_name(String empname){
        System.out.println(empname+"------------------------------------");
        System.out.println(userService.L_query_emp_name(empname));
        return userService.L_query_emp_name(empname);
    }
/*员工岗位*/
    @RequestMapping("L_query_emp_empid")
    public  @ResponseBody List<Map> L_query_emp_empid(Integer empid){
        System.out.println(empid+"------------------------------------");
        System.out.println(userService.L_query_emp_empid(empid));
        return userService.L_query_emp_empid(empid);
    }

/*休假----------------  加班-------------------  离职*/
  @RequestMapping("L_shen_leave")
   public @ResponseBody List<Map> L_shen_leave(Integer deptid,Integer leasate){
      System.out.println(deptid+"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbb");
      System.out.println( userService.L_shen_leave(deptid,0));
    return  userService.L_shen_leave(deptid,0);
}
    @RequestMapping("L_shen_jiaban")
    public @ResponseBody List<Map> L_shen_jiaban(Integer deptid,Integer apovstate){
        System.out.println(deptid+"aaaaaaaaaaaaaaaaaaaaaa");
        return  userService.L_shen_jiaban(deptid,0);
    }
    @RequestMapping("L_shen_lizhi")
    public @ResponseBody List<Map> L_shen_lizhi(Integer deptid,Integer dimstate){
         return  userService.L_shen_lizhi(deptid,0);
    }
    /*休假---加班----离职  ----审批 ---*/
    @RequestMapping("L_upd_xiujia_unpass")
    public @ResponseBody String L_upd_xiujia_pass(Integer leasate,String pipeople, String pidate,  String bohui, Integer leaid){
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        userService.L_upd_xiujia_unpass(leasate,pipeople,createdate,bohui,leaid);
        return  "chenggong";
    }
    @RequestMapping("L_upd_jiaban_unpass")
    public @ResponseBody String L_upd_jiaban_unpass(Integer apovstate,String pipeople,String shentime, String bohui, Integer apovid){
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        userService.L_upd_jiaban_unpass(apovstate,pipeople,createdate,bohui,apovid);
        return  "chenggong";
    }
    /**离职审批*/
    @RequestMapping("L_upd_lizhi_unpass")
    public @ResponseBody String L_upd_lizhi_unpass(Integer dimstate,String dimsign, String nodim, String bohui, Integer dimid,Integer empid){
        System.out.println("zhici进来了");
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        userService.L_upd_lizhi_unpass(dimstate,dimsign,createdate,bohui,dimid);
        return  "chenggong";
    }
    /*--------查询已审批过的-----*/
    @RequestMapping("L_queryAll_leave")
    public @ResponseBody List<Map> L_queryAll_leave(Integer deptid,Integer leasate){
        return  userService.L_shen_leave(deptid,null);
    }
    @RequestMapping("L_queryAll_jiaban")
    public @ResponseBody List<Map> L_queryAll_jiaban(Integer deptid,Integer apovstate){
        return  userService.L_shen_jiaban(deptid,null);
    }
    @RequestMapping("L_queryAll_lizhi")
    public @ResponseBody List<Map> L_queryAll_lizhi(Integer deptid,Integer dimstate){
        System.out.println( userService.L_shen_lizhi(deptid,null)+"aaaaaaaaaaaaaaaa");
        return  userService.L_shen_lizhi(deptid,null);
    }
    /**----------模糊查询工资单-------*/
    @RequestMapping("L_query_pay_time")
    public @ResponseBody
    LayuiFy L_query_pay_time(String empid, String time1, String time2, Integer limit, Integer page){
        return  userService.L_query_pay_time(empid,time1,time2,limit,page);
    }
    /*----修改密码----*/
    @RequestMapping("L_update_pwd")
    public @ResponseBody String L_update_pwd(String empnumber,String pwd,String repwd){
        List<Map> list1=userService.L_query_user_name(empnumber);
        String salt = (String) list1.get(0).get("salt");
        String yuanmima= (String) list1.get(0).get("password");
        int times = 2;
        String algorithmName = "md5";
      String yanzhneg=new SimpleHash(algorithmName, pwd, salt, times).toString();
         if (yanzhneg.equals(yuanmima)){
           String encodedPassword = new SimpleHash(algorithmName, repwd, salt, times).toString();
             Emp emp=new Emp();
             emp.setEmpnumber(empnumber);
             emp.setPassword(encodedPassword);
             emp.setSalt(salt);
             userService.L_update_pwd(emp);
             return "ok";
         }else {
             return "no";
         }
    }
/**-----------------------------------------------------------------------二级审核处理*/
/**二级审核查询*/
    @RequestMapping("J_query_xiujia")
    public @ResponseBody  LayuiFy J_query_xiujia(Integer empid, String time1, String time2,Integer leasate,Integer deptid,  Integer limit, Integer page){
        return  userService.J_query_xiujia(null,"","",1,deptid,limit,page);
    }
    /**模糊*/
    @RequestMapping("J_query_xiujia_a")
    public @ResponseBody  LayuiFy J_query_xiujia_a(Integer empid, String time1, String time2,Integer leasate, Integer deptid, Integer limit, Integer page){
        return  userService.J_query_xiujia(null,time1,time2,1,deptid,limit,page);
    }
    /**二级审核- 查询加班*/
    @RequestMapping("J_query_jiaban")
    public @ResponseBody  LayuiFy J_query_jiaban(Integer empid, String time1, String time2,Integer leasate,Integer deptid , Integer limit, Integer page) {

        return  userService.J_query_jiaban(null,"","",1,deptid,limit,page);
    }
    /**模糊查询*/
    @RequestMapping("J_query_jiaban_a")
    public @ResponseBody  LayuiFy J_query_jiaban_a(Integer empid, String time1, String time2,Integer leasate,Integer deptid,  Integer limit, Integer page) {
        return  userService.J_query_jiaban(null,time1,time2,1,deptid,limit,page);
    }
    /**二级离职查询*/
    @RequestMapping("J_query_lizhi")
    public @ResponseBody  LayuiFy J_query_lizhi(Integer empid, String time1, String time2,Integer leasate,Integer deptid  ,Integer limit, Integer page) {
        return  userService.J_query_cizhi(null,"","",1,deptid,limit,page);
    }
    /**模糊查询*/
    @RequestMapping("J_query_lizhi_a")
    public @ResponseBody  LayuiFy J_query_lizhi_a(Integer empid, String time1, String time2,Integer leasate,Integer deptid,  Integer limit, Integer page) {
        return  userService.J_query_cizhi(null,time1,time2,1,deptid,limit,page);
    }

    /**  二级审核修改状态*/
 /*休假---加班----离职  ----审批 ---*/
    @RequestMapping("J_update_xiujia")
    public @ResponseBody String J_upd_xiujia_pass(Integer leasate,String zongshen,String zongshendate,String zongbohui, Integer leaid){
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        userService.J_upd_xiujia_unpass(leasate,zongshen,createdate,zongbohui,leaid);
        return  "chenggong";
    }
    @RequestMapping("J_upd_jiaban")
    public @ResponseBody String J_upd_jiaban_unpass(Integer apovstate,String zongshen,String zongshendate,String zongbohui, Integer apovid){
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        userService.J_upd_jiaban_unpass(apovstate,zongshen,createdate,zongbohui,apovid);
        return  "chenggong";
    }
    /**离职审批*/
    @RequestMapping("J_upd_lizhi")
    public @ResponseBody String J_upd_lizhi_unpass(Integer dimstate,String zongshen,String zongshendate,String zongbohui, Integer dimid,Integer empid){
        System.out.println("zhici进来了");
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        userService.J_upd_lizhi_unpass(dimstate,zongshen,createdate,zongbohui,dimid);
        if(dimstate==5){
            Emp emp=new Emp();
            emp.setEmpid(empid);
            emp.setEmpstateid(3);
            userService.L_update_emp_empstateid(emp);
        }

        return  "chenggong";
    }

    /**出差申请*/
    @RequestMapping("L_add_out")
    public  String L_add_out(Apply_Office apply_office){
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        apply_office.setShentime(createdate);
        apply_office.setOffstate(0);
        System.out.println(apply_office.getDeptid());
        System.out.println("777777777777");
        System.out.println(apply_office.getLeaday());
        userService.L_add_out(apply_office);
        return  "L_shouye";
    }
    /**转正申请*/
    @RequestMapping("L_add_zhuan")
    public  String L_add_zhuan(Zhuanzheng zhuanzheng){
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        zhuanzheng.setShendate(createdate);
        zhuanzheng.setShenqingstate(0);
        System.out.println("777777777777");
        userService.L_add_zhuanzheng(zhuanzheng);
        return  "L_shouye";
    }
    /**一级审核   出差  转正 查询*/
    /**转正*/
    @RequestMapping("L_query_zhuan")
    public @ResponseBody  LayuiFy L_shen_zhuan(Integer deptid, Integer shenqingstate ,String time1, String time2, Integer limit, Integer page) {
        return  userService.L_shen_zhuan(deptid,0,"","",limit,page);
    }
    @RequestMapping("L_query_zhuan_a")
    public @ResponseBody  LayuiFy L_shen_zhuan_a(Integer deptid, Integer shenqingstate ,String time1, String time2, Integer limit, Integer page) {
        return  userService.L_shen_zhuan(deptid,0,time1,time2,limit,page);
    }
    /**出差*/
    @RequestMapping("L_query_out")
    public @ResponseBody  LayuiFy L_query_out(Integer deptid, Integer shenqingstate ,String time1, String time2, Integer limit, Integer page) {
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        return  userService.L_shen_out(deptid,0,"","",limit,page);
    }
    @RequestMapping("L_query_out_a")
    public @ResponseBody  LayuiFy L_query_out_a(Integer deptid, Integer offstate ,String time1, String time2, Integer limit, Integer page) {
        return  userService.L_shen_out(deptid,0,time1,time2,limit,page);
    }

    /**转正*/
    @RequestMapping("L_query_zhuan_tow")
    public @ResponseBody  LayuiFy L_query_zhuan_tow(Integer deptid, Integer shenqingstate ,String time1, String time2, Integer limit, Integer page) {
        return  userService.L_shen_zhuan(deptid,1,"","",limit,page);
    }
    @RequestMapping("L_query_zhuan_tow_a")
    public @ResponseBody  LayuiFy L_query_zhuan_tow_a(Integer deptid, Integer shenqingstate ,String time1, String time2, Integer limit, Integer page) {
        return  userService.L_shen_zhuan(deptid,1,time1,time2,limit,page);
    }
    /**出差*/
    @RequestMapping("L_query_out_tow")
    public @ResponseBody  LayuiFy L_query_out_tow(Integer deptid, Integer shenqingstate ,String time1, String time2, Integer limit, Integer page) {
        return  userService.L_shen_out(deptid,1,"","",limit,page);
    }
    @RequestMapping("L_query_out_tow_a")
    public @ResponseBody  LayuiFy L_query_out_tow_a(Integer deptid, Integer offstate ,String time1, String time2, Integer limit, Integer page) {
        return  userService.L_shen_out(deptid,1,time1,time2,limit,page);
    }
    /**审核状态   出差  培训  转正*/
/**转正*/
@RequestMapping("L_upd_zhuan")
public @ResponseBody String L_upd_zhuan(Integer shenqingstate,String pipeople,String shentime,String bohui, Integer shenid){
    Date date = new Date();
    //设置要获取到什么样的时间
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //获取String类型的时间
    String createdate = sdf.format(date);
    Zhuanzheng zz=new Zhuanzheng();
   zz.setPipeople(pipeople);
   zz.setShentime(createdate);
   zz.setShenqingstate(shenqingstate);
   zz.setBohui(bohui);
   zz.setShenid(shenid);
    userService.L_upd_zhuan(zz);
    return  "chenggong";
}

    /**出差*/
    @RequestMapping("L_upd_out")
    public @ResponseBody String L_upd_out(Integer offstate,String pipeople,String pidate,String bohui, Integer offid){
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        Apply_Office zz=new Apply_Office();
        zz.setPipeople(pipeople);
        zz.setOffstate(offstate);
        zz.setPidate(createdate);
        zz.setBohui(bohui);
        zz.setOffid(offid);
        userService.L_upd_out(zz);
        return  "chenggong";
    }

/**二级审核*/
    /**转正*/
    @RequestMapping("L_upd_zong_zhuan")
    public @ResponseBody String L_upd_zong_zhuan(Integer shenqingstate,String zongshen,String zongbohui,String zongshentiem,Integer shenid){
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        Zhuanzheng zz=new Zhuanzheng();
        zz.setZongshen(zongshen);
        zz.setZongbohui(zongbohui);
        zz.setShenqingstate(shenqingstate);
         zz.setZongshentiem(createdate);
        zz.setShenid(shenid);
        userService.L_upd_zong_zhuan(zz);
        return  "chenggong";
    }

    /**出差*/
    @RequestMapping("L_upd_zong_out")
    public @ResponseBody String L_upd_zong_out(Integer offstate,String zongshen,String zongbohui,String zongshendate, Integer offid){
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        Apply_Office zz=new Apply_Office();
        zz.setZongshen(zongshen);
        zz.setZongbohui(zongbohui);
        zz.setZongshendate(createdate);
        zz.setOffstate(offstate);
        zz.setOffid(offid);
        userService.L_upd_zong_out(zz);
        return  "chenggong";
    }
/**查询培训表*/
    @RequestMapping("L_query_pei")
    public  @ResponseBody  LayuiFy L_query_pei(Integer limit,Integer page) {
        return userService.L_query_pei(limit,page);
    }
    /**课程报名*/
    @RequestMapping("L_add_keapply")
    public @ResponseBody    String L_add_keapply(Integer keid, Integer empid,Integer  kstate,String kadate) {
        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        Keapply ke=new Keapply();
        ke.setEmpid(empid);
        ke.setKadate(createdate);
        ke.setKeid(keid);
        ke.setKstate(kstate);
        userService.L_add_keapply(ke);
        return "chenggong";
    }


    public Integer getEmpid() {

        return empid;
    }

    public void setEmpid(Integer empid) {

        this.empid = empid;
    }
}
