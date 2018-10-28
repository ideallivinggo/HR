package com.aaa.rzhr.web;


import com.aaa.rzhr.pojo.Apply_Dimission;
import com.aaa.rzhr.pojo.Apply_Leave;
import com.aaa.rzhr.pojo.Apply_Overtime;
import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.service.UserService;
import com.aaa.rzhr.util.LayuiFy;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
             userService.L_add_leave(apply_leave.getEmpid(),aa,apply_leave.getLeaday(),apply_leave.getLeatype(),apply_leave.getLeareason(),apply_leave.getLeaenterdate(),createdate,0);
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
public  @ResponseBody LayuiFy L_query_pay(Integer empid,Integer limit,Integer page){

    System.out.println(empid+"========================-------------");
    return  userService.L_query_pay(empid,limit,page);
}
/**
*加班申请
 */
@RequestMapping("L_add_jiaban")
public  String    L_add_j(Apply_Overtime app,double apovhour_1,double apovhour_2){
    System.out.println(apovhour_1+".....................");
    System.out.println(apovhour_2+"++++++++++++++++++");
    double aa=apovhour_1*8+apovhour_2;
    String bb="";

    System.out.println(aa+"------------------------");
       String cc=   aa+bb;
    System.out.println(cc+"//////////////////////////////////");
    Date date = new Date();
    //设置要获取到什么样的时间
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //获取String类型的时间
    String createdate = sdf.format(date);
   userService.L_add_jiaban(app.getEmpid(),app.getApovtype(),app.getApovstartdate(),createdate,cc,app.getApovreason(),0);
    return "L_shouye";
}
    /**
     *离职申请
     */
    @RequestMapping("L_add_lizhi")
    public  String    L_add_lizhi(Apply_Dimission ad){


        Date date = new Date();
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获取String类型的时间
        String createdate = sdf.format(date);
        userService.L_add_lizhi(empid,ad.getDimtype(),ad.getDimdetails(),ad.getDimsuggest(),"未移交",createdate,0);
        return "L_shouye";
    }

/*休假*/
    @RequestMapping("L_query_xiujia")
    public  @ResponseBody  List<Map> L_query_xiujia(Integer empid, String fristdate, String overdate, Integer leasate){
        System.out.println(empid+"44444444444444444444444");
       System.out.println(fristdate+"333333333333333");
        System.out.println(overdate+"222222222222222222");
        System.out.println(leasate+"111111111111111111111111");

        List<Map> list= userService.L_query_xiujia(empid, fristdate, overdate,leasate);

        return list;
    }

/*加-------------班*/
    @RequestMapping("L_query_jiaban")
    public  @ResponseBody  List<Map> L_query_jiaban(Integer empid, String fristdate, String overdate, Integer apovstate){
        System.out.println(empid+"44444444444444444444444");
        System.out.println(fristdate+"333333333333333");
        System.out.println(overdate+"222222222222222222");


        List<Map> list= userService.L_query_jiaban(empid, fristdate, overdate,apovstate);

        return list;
    }
    /*-----------离职*/

    @RequestMapping("L_query_cizhi")
    public  @ResponseBody  List<Map> L_query_cizhi(Integer empid, String fristdate, String overdate, Integer dimstate){
        System.out.println(empid+"44444444444444444444444");
        System.out.println(fristdate+"333333333333333");
        System.out.println(overdate+"222222222222222222");

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




    public Integer getEmpid() {

        return empid;
    }

    public void setEmpid(Integer empid) {

        this.empid = empid;
    }
}
