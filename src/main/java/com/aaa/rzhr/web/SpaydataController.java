package com.aaa.rzhr.web;


import com.aaa.rzhr.pojo.Latedata;
import com.aaa.rzhr.service.SpaydataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.aaa.rzhr.pojo.Payrolldata;

import java.util.*;

/**
 * @author SJP
 * @date 2018/10/15 0015 10:02
 */
@Controller
public class SpaydataController {
    @Autowired
    SpaydataService service;
    @RequestMapping("/getpaysjp")
    public @ResponseBody List<Payrolldata> getpaydata() {
        List<Payrolldata> list = service.Sgetpaydata();
        return list;
    }
    @RequestMapping("/getlatesjp")
    public @ResponseBody List<Latedata> getlatedata() {
        List<Latedata> list = service.Sgetlate();
        return list;
    }
    @RequestMapping("/updlatesjp")
    public @ResponseBody boolean updlatedata(String lat1,String lat2,String latp) {
        boolean flag=service.Sdelpaydata();
        System.out.println("sjp====");
        System.out.println(flag);
        if(flag==true) {
            System.out.println("success");
            String[] latone = lat1.split(",");
            String[] lattwo = lat2.split(",");
            String[] latpunish = latp.split(",");
            Map m = new HashMap();
            for (int i = 0; i < latone.length; i++) {
                m.put("latone", latone[i]);
                m.put("lattwo", lattwo[i]);
                m.put("latpunish", latpunish[i]);
                 boolean sss=service.Saddpaydata(m);
                if (i+1==latone.length) {
                    System.out.println(sss);
                    return sss;
                }
            }
        }
        return false;
    }
    @RequestMapping("/addlatesjp")
    public @ResponseBody boolean addpaydata(String shangone,String shangtwo,String shangthree,String shangfour,String shangfive) {
       String[] pay1 = shangone.split(",");
        String[] pay2 = shangtwo.split(",");
        String[] pay3 = shangthree.split(",");
        String[] pay4 = shangfour.split(",");
        String[] pay5 = shangfive.split(",");
        Map m = new HashMap();
        System.out.println(m+"ssss");
        m.put("payrbase",pay1[0]);
        m.put("payrdays",pay1[1]);
       service.Supdpdata1(m);
        Map m1 = new HashMap();
        m1.put("payrbase",pay2[0]);
        m1.put("payrdays",pay2[1]);
        m1.put("payrhour",pay2[2]);
      service.Supdpdata2(m1);
        Map m2 = new HashMap();
        m2.put("payrbase",pay3[0]);
        m2.put("payrdays",pay3[1]);
        m2.put("payrhour",pay3[2]);
        service.Supdpdata3(m2);
        Map m3 = new HashMap();
        m3.put("payrbase",pay4[0]);
        m3.put("payrdays",pay4[1]);
        m3.put("payrhour",pay4[2]);
        m3.put("payrpacific",pay4[3]);
        m3.put("payrweekend",pay4[4]);
        m3.put("payrlegal",pay4[5]);
       service.Supdpdata4(m3);
        Map m4 = new HashMap();
        m4.put("payrbase",pay5[0]);
        m4.put("payjixiao",pay5[1]);
       boolean flag=service.Supdpdata5(m4);
        return flag;
    }

    }
