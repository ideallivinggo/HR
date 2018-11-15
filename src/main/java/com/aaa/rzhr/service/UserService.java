package com.aaa.rzhr.service;


import com.aaa.rzhr.pojo.*;
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
    void L_add_leave(int empid, String leaoverdate, String leaday, String leatype, String leareason, String leaenterdate, String shendate, int leasate, int deptid);
     /**
      * 修改密码*/
     void L_update_pwd(Emp emp);
    /**
     *查询各个审核状态*/
    List<Map> L_query_leave(Integer empid);

    /**工资单查询*/
    LayuiFy L_query_pay(Integer empid, Integer limit, Integer page);
    /**加班申请*/
    void L_add_jiaban(int empid, String apovtype, String apovstartdate, String apoverdate, String apovhour, String aovreason, int apovstate, int deptid);
    /**离职申请*/
    void L_add_lizhi(int empid, String dimtype, String dimdetails, String dimsuggest, String dimturn, String dimapplydate, int dimstate, int deptid);

    /**查询休假*/
    List<Map> L_query_xiujia(Integer empid, String fristdate, String overdate, Integer leasate, Integer deptid);
    /**查询加班*/
    List<Map> L_query_jiaban(Integer empid, String fristdate, String overdate, Integer apovstate, Integer deptid);
    /**查询  辞职*/
    List<Map> L_query_cizhi(Integer empid, String fristdate, String overdate, Integer dimstate, Integer deptid);
    /**修改休假的状态  为3*/
    void L_update_xiujia(Integer leaid);
    /**修改加班的状态  为3*/
    void L_update_jiaban(Integer apovid);
    /**修改离职的状态  为3*/
    void L_update_cizhi(Integer dimid);
    /**查询所有信息*/
    List<Map> L_query_emp(Integer deptid);
    /**姓名查询信息*/
    List<Map> L_query_emp_name(String empname);
    /**个人员工岗位说明书*/
    List<Map> L_query_emp_empid(@Param("empid") Integer empid);
    /**查询未审批的休假*/
    List<Map> L_shen_leave(Integer deptid, Integer leasate);
    /**查询未审批的加班*/
    List<Map> L_shen_jiaban(Integer deptid, Integer apovstate);
    /**查询未审批的离职*/
    List<Map> L_shen_lizhi(Integer deptid, Integer dimstate);
    /** 修改休假状态  1和2   状态  审批人  审批时间 驳回理由  id*/
    void L_upd_xiujia_unpass(Integer leasate, String pipeople, String pidate, String bohui, Integer leaid);
    /** 修改加班状态  1和2*/
    void L_upd_jiaban_unpass(Integer apovstate, String pipeople, String shentime, String bohui, Integer apovid);
    /** 修改离职状态  1和2*/
    void L_upd_lizhi_unpass(Integer dimstate, String dimsign, String nodim, String bohui, Integer dimid);
   /**  根据时间查询工资单*/
   LayuiFy L_query_pay_time(String empid, String time1, String time2, Integer limit, Integer page);
   /**number查询emp*/
    List<Map> L_query_user_name(String empnumber);

    /**
     * 修改emp状态 为3
     */
    void L_update_emp_empstateid(Emp emp);
    /**经理查询休假    ---------------------------------二级审核
     * */
    /**查询休假*/
    LayuiFy J_query_xiujia(Integer empid, String fristdate, String overdate, Integer leasate, Integer deptid, Integer limit, Integer page);
    /**查询加班*/
    LayuiFy J_query_jiaban(Integer empid, String fristdate, String overdate, Integer apovstate, Integer deptid, Integer limit, Integer page);
    /**查询  辞职*/
    LayuiFy J_query_cizhi(Integer empid, String fristdate, String overdate, Integer dimstate, Integer deptid, Integer limit, Integer page);
    /** 修改休假状态  5 和2*/
    void J_upd_xiujia_unpass(Integer leasate, String zongshen, String zongshendate, String zongbohui, Integer leaid);
    /** 修改加班状态  5 和2*/
    void J_upd_jiaban_unpass(Integer apovstate, String zongshen, String zongshendate, String zongbohui, Integer apovid);
    /** 修改离职状态 5 和2*/
    void J_upd_lizhi_unpass(Integer dimstate, String zongshen, String zongshendate, String zongbohui, Integer dimid);
    /**出差申请添加*/
    void L_add_out(Apply_Office apply_office);
    /**转正申请*/
    void L_add_zhuanzheng(Zhuanzheng zhuanzheng);
    /**一级审批查询培训  转正  出差*/
    /**转正*/
    LayuiFy L_shen_zhuan(Integer empid, Integer deptid, Integer shenqingstate, String fristdate, String overdate, Integer limit, Integer page);
    /**出差*/
    LayuiFy  L_shen_out(Integer empid, Integer deptid, Integer offstate, String fristdate, String overdate, Integer limit, Integer page);
    /**一级审核修改状态 培训 转正 出差*/
    /**转正*/
    void L_upd_zhuan(Zhuanzheng zhuanzheng);
    /**出差*/
    void L_upd_out(Apply_Office apply_office);
    /**  二级审核*/
    /**转正*/
    void L_upd_zong_zhuan(Zhuanzheng zhuanzheng);
    /**出差*/
    void L_upd_zong_out(Apply_Office apply_office);
    /**培训课程查询*/
    LayuiFy L_query_pei(Integer limit, Integer page);
    /**报名课程*/
    void  L_add_keapply(Keapply keapply);
    /** 部门主管审核  培训申请*/
    /**查询部门经理要审批的培训*/
    LayuiFy L_query_kecheng(Integer deptid, Integer empid, String fristdate, String overdate, Integer kstate, Integer limit, Integer page);
    /**一级部门审核*/
    void L_upd_pei(Keapply keapply);
    /** 培训中心审核*/
    void L_zong_pei(Keapply keapply);
    /**查询报名课程现在人数*/
    Integer L_query_ren(Keemp keemp);
    /**add课*/
    void L_add_ke(Keemp keemp);
}
