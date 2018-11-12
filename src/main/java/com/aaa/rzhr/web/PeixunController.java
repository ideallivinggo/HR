package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Kecheng;
import com.aaa.rzhr.service.PeixunService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/peixun")
public class PeixunController {
    @Autowired
    PeixunService peixunService;

     @RequestMapping("/addkecheng")
    public  String  addkecheng(Kecheng kecheng){
               kecheng.setKestate(1);
         String[] empid=kecheng.getKebaomingtimeend().split(",");
         List<String> empids= Arrays.asList(empid);

               String baomingbegin=kecheng.getKebaomingtimebegin().substring(0,10);
               String baomingend=kecheng.getKebaomingtimebegin().substring(13,23);
               String begin=kecheng.getKebegintime().substring(0,10);
               String end=kecheng.getKebegintime().substring(13,23);
         kecheng.setKebaomingtimebegin(baomingbegin);
         kecheng.setKebaomingtimeend(baomingend);
         kecheng.setKeendtime(end);
         kecheng.setKebegintime(begin);

           peixunService.addkecheng(kecheng);
           peixunService.addKeTeacher(empids,kecheng.getKeid());

       /*  Emp emp=new Emp();
         List<Emp> emps =  peixunService.queryEmpByEmp(emp);
         System.out.println(emps.get(0).getEmpname());
         System.out.println("涛涛涛涛涛涛涛涛涛涛涛涛+++");*/
        return "okok";
    }
    @RequestMapping("/queryEmpByEmp")
    public List<Emp> queryEmpByEmp(String empnumber,String empname){
        Map emp=new HashMap();
         emp.put("empnumber",empnumber);
         emp.put("empname",empname);

        System.out.println(empnumber);
        System.out.println(empname);

        List<Emp> emps =  peixunService.queryEmpByEmp(emp);
        for (Emp e:emps
             ) {
            System.out.println(e.getEmpname());

        }
        return emps;
    }

     @RequestMapping("/getKechengbyEmpid")
    public  List<Kecheng> getKechengbyEmpid(Integer empid){
         List<Kecheng> kechengByEmpid = peixunService.getKechengByEmpid(empid);

         return kechengByEmpid;
    }


}
