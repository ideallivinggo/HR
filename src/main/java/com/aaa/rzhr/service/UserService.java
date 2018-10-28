package com.aaa.rzhr.service;


import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.util.LayuiFy;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserService {
    /**
    *个人中心的信息查询*/
     List<Map> L_query_user(Integer empid);
    /**
     *请假申请*/
     void L_add_leave(int empid, String leaoverdate, String leaday, String leatype, String leareason, String leaenterdate,String shendate,int leasate);
    /**
     *修改密码*/
     void L_update_pwd(Emp emp);
    /**
     *查询各个审核状态*/
    List<Map> L_query_leave(Integer empid);

    /**工资单查询*/
    LayuiFy L_query_pay(Integer empid,Integer limit,Integer page);
    /**加班申请*/
    void L_add_jiaban(int empid,String apovtype,String apovstartdate,String apoverdate,String apovhour,String aovreason,int apovstate);
    /**离职申请*/
    void L_add_lizhi(int empid,String dimtype,String dimdetails,String dimsuggest,String dimturn,String dimapplydate,int dimstate);

    /**查询休假*/
    List<Map> L_query_xiujia( Integer empid,  String fristdate,String overdate, Integer leasate);
    /**查询加班*/
    List<Map> L_query_jiaban( Integer empid,String fristdate,String overdate,Integer apovstate);
    /**查询辞职*/
    List<Map> L_query_cizhi( Integer empid,String fristdate,String overdate,Integer dimstate);
    /**修改休假的状态  为3*/
    void L_update_xiujia(Integer leaid);
    /**修改加班的状态  为3*/
    void L_update_jiaban(Integer apovid);
    /**修改离职的状态  为3*/
    void L_update_cizhi(Integer dimid);
}
