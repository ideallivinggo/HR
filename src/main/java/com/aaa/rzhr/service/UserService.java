package com.aaa.rzhr.service;


import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.util.LayuiFy;

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
    List<Map> L_query_leave(Integer empid,Integer leasate);

    /**工资单查询*/
    LayuiFy L_query_pay(Integer empid);
}
