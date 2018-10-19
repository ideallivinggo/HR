package com.aaa.rzhr.service;


import java.util.List;
import java.util.Map;

public interface UserService {
    /**
    *个人中心的信息查询*/
    public List<Map> L_query_user(Integer empid);
    /**
     *请假申请*/
    public void L_add_leave(int empid, String leaoverdate, String leaday, String leatype, String leareason, String leaenterdate);

}
