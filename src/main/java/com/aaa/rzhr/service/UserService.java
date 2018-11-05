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
    void L_add_leave(int empid, String leaoverdate, String leaday, String leatype, String leareason, String leaenterdate,String shendate,int leasate,int deptid);
     /**
      * 修改密码*/
     void L_update_pwd(Emp emp);
    /**
     *查询各个审核状态*/
    List<Map> L_query_leave(Integer empid);

    /**工资单查询*/
    LayuiFy L_query_pay(Integer empid,Integer limit,Integer page);
    /**加班申请*/
    void L_add_jiaban(int empid,String apovtype,String apovstartdate,String apoverdate,String apovhour,String aovreason,int apovstate,int deptid);
    /**离职申请*/
    void L_add_lizhi(int empid,String dimtype,String dimdetails,String dimsuggest,String dimturn,String dimapplydate,int dimstate,int deptid);

    /**查询休假*/
    List<Map> L_query_xiujia( Integer empid,  String fristdate,String overdate, Integer leasate);
    /**查询加班*/
    List<Map> L_query_jiaban( Integer empid,String fristdate,String overdate,Integer apovstate);
    /**查询  辞职*/
    List<Map> L_query_cizhi( Integer empid,String fristdate,String overdate,Integer dimstate);
    /**修改休假的状态  为3*/
    void L_update_xiujia(Integer leaid);
    /**修改加班的状态  为3*/
    void L_update_jiaban(Integer apovid);
    /**修改离职的状态  为3*/
    void L_update_cizhi(Integer dimid);
    /**查询所有信息*/
    List<Map> L_query_emp(Integer deptid);
    /**姓名查询信息*/
    List<Map> L_query_emp_name( String empname);
    /**个人员工岗位说明书*/
    List<Map> L_query_emp_empid(@Param("empid") Integer empid);
    /**查询未审批的休假*/
    List<Map> L_shen_leave(Integer deptid,Integer leasate);
    /**查询未审批的加班*/
    List<Map> L_shen_jiaban(Integer deptid,Integer apovstate);
    /**查询未审批的离职*/
    List<Map> L_shen_lizhi(Integer deptid,Integer dimstate);
    /** 修改休假状态  1和2   状态  审批人  审批时间 驳回理由  id*/
    void L_upd_xiujia_unpass(Integer leasate,String pipeople, String pidate, String bohui, Integer leaid);
    /** 修改加班状态  1和2*/
    void L_upd_jiaban_unpass(Integer apovstate, String pipeople,String shentime,String bohui, Integer apovid);
    /** 修改离职状态  1和2*/
    void L_upd_lizhi_unpass(Integer dimstate, String dimsign, String nodim, String bohui, Integer dimid);
   /**  根据时间查询工资单*/
   LayuiFy L_query_pay_time(String empid, String time1,String time2,Integer limit,Integer page );

}
