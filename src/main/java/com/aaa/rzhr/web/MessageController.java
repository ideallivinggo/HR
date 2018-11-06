package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Rzmessage;
import com.aaa.rzhr.service.RzmessageService;
import io.goeasy.GoEasy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author XBJ
 * @date 2018-11-02 9:55
 */
@RestController
@RequestMapping("/sendmessage")
public class MessageController {

    @Autowired
    RzmessageService rzmessageService;

    @RequestMapping("/zhong")
    public String sendZhong(Rzmessage rzmessage, HttpServletRequest req) {
        Emp e= (Emp) req.getSession().getAttribute("emp");
        System.out.println(e.getDeptid()+"deptid");
        rzmessage.setDeptid(e.getDeptid());
        int a= rzmessageService.addRzmessageX(rzmessage);
        if (a>0){
            String tongzhi=rzmessage.getMetitle()+"♈"+rzmessage.getMetext();
           if (rzmessage.getMestate().equals("1")){
               if (compareDate(rzmessage.getBegintime())){
               GoEasy goEasy = new GoEasy("http://rest-hangzhou.goeasy.io", "BC-ce1dd32a157e46f892f1dc98a07ebaad");
               goEasy.publish("zhong",tongzhi);}
           }else if (rzmessage.getMestate().equals("2")){


           if (compareDate(rzmessage.getBegintime())){
               GoEasy goEasy = new GoEasy("http://rest-hangzhou.goeasy.io", "BC-ce1dd32a157e46f892f1dc98a07ebaad");
               goEasy.publish("yiban"+e.getDeptid(),tongzhi);
               System.out.println("发送通知");
             }
           }
            return "ok";
        }else {
            return "no";
        }
    }

    public boolean compareDate(String beginDate){
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String date1 = formatter.format(currentTime);
        String date2 =beginDate;
        Integer i=date1.compareTo(date2);
        System.out.println(i);
         if (i==0){
             return true;
         }else {
             return false;
         }
    }

    @RequestMapping("/betweendatezhong")
    public  List<Rzmessage>  betweendatezhong(){
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String date1 = formatter.format(currentTime);
        List<Rzmessage> rzmessages = rzmessageService.queryRzmessageX(date1,"1");
        for (Rzmessage r:rzmessages
             ) {
            System.out.println(r.getMeid()+"meid");
        }
        return rzmessages;
    }
    @RequestMapping("/betweendateyiban")
    public  List<Rzmessage>  betweendateyiban(){
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String date1 = formatter.format(currentTime);
        List<Rzmessage> rzmessages = rzmessageService.queryRzmessageX(date1,"2");
        for (Rzmessage r:rzmessages
                ) {
            System.out.println(r.getMeid()+"meid");
        }
        return rzmessages;
    }




}
