package com.aaa.rzhr.web;


import com.aaa.rzhr.pojo.Apply_Dimission;
import com.aaa.rzhr.pojo.Apply_Leave;
import com.aaa.rzhr.pojo.Apply_Overtime;
import com.aaa.rzhr.pojo.Emp;
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

    return  userService.L_query_pay(empid,limit,page);
}
/**
*加班申请
 */
@RequestMapping("L_add_jiaban")
public  String    L_add_j(Apply_Overtime app, double apovhour_1, double apovhour_2){

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
        System.out.println(ad.getDeptid());
        System.out.println(ad.getDimdetails());
        System.out.println(ad.getDimsuggest());
        System.out.println(ad.getDimtype());
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
    public  @ResponseBody  List<Map> L_query_xiujia(Integer empid, String fristdate, String overdate, Integer leasate){
     /*   System.out.println(empid+"44444444444444444444444");
       System.out.println(fristdate+"333333333333333");
        System.out.println(overdate+"222222222222222222");
        System.out.println(leasate+"111111111111111111111111");*/

        List<Map> list= userService.L_query_xiujia(empid, fristdate, overdate,leasate);

        return list;
    }

/*加-------------班*/
    @RequestMapping("L_query_jiaban")
    public  @ResponseBody  List<Map> L_query_jiaban(Integer empid, String fristdate, String overdate, Integer apovstate){
       /* System.out.println(empid+"44444444444444444444444");
        System.out.println(fristdate+"333333333333333");
        System.out.println(overdate+"222222222222222222");*/


        List<Map> list= userService.L_query_jiaban(empid, fristdate, overdate,apovstate);

        return list;
    }
    /*-----------离职*/

    @RequestMapping("L_query_cizhi")
    public  @ResponseBody  List<Map> L_query_cizhi(Integer empid, String fristdate, String overdate, Integer dimstate){
       /* System.out.println(empid+"44444444444444444444444");
        System.out.println(fristdate+"333333333333333");
        System.out.println(overdate+"222222222222222222");*/

        List<Map> list= userService.L_query_cizhi(empid, fristdate, overdate,dimstate);

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
     /*   System.out.println(empname+"------------------------------------");
        System.out.println(userService.L_query_emp_name(empname));*/
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
        System.out.println(dimsign+"--------------");

        System.out.println(createdate+"33333333333333333333");
        System.out.println(dimstate+"4444444444444444444");
        System.out.println(bohui+"55555555555555");
        System.out.println(dimid+"2222222222222222222");
        System.out.println(empid+"66666666666666666666666");
        userService.L_upd_lizhi_unpass(dimstate,dimsign,createdate,bohui,dimid);
        if(empid!=null){
            Emp emp=new Emp();
            emp.setEmpid(empid);
            emp.setEmpstateid(3);
            userService.L_update_emp_empstateid(emp);
        }

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
    /*----------模糊查询工资单-------*/
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
        System.out.println(yuanmima+"--------------------++++++++++++++++++");
        System.out.println(list1);
        int times = 2;
        String algorithmName = "md5";
      String yanzhneg=new SimpleHash(algorithmName, pwd, salt, times).toString();
         if (yanzhneg.equals(yuanmima)){
           String encodedPassword = new SimpleHash(algorithmName, repwd, salt, times).toString();
             System.out.println("***************************"+encodedPassword+"!!!!!");
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




    public Integer getEmpid() {

        return empid;
    }

    public void setEmpid(Integer empid) {

        this.empid = empid;
    }
}
