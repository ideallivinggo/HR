package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Emp;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * @author ljp
 */
@Mapper
public interface UserDao {
    /**个人信息*/
     List<Map> L_query_user(Integer empid);
    /**请假申请*/
     void L_add_leave(int empid, String leaoverdate, String leaday, String leatype, String leareason, String leaenterdate,String shendate,int leasate);
    /**修改登录密码*/
     void L_update_pwd(Emp emp);
    /**查询审批各个状态*/
    List<Map> L_query_leave(@Param("empid") Integer empid, @Param("leasate") Integer leasate );
    /**工资单查询*/
    List<Map> L_query_pay(Integer empid);
}
