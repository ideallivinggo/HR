package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Apply_Office;
import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Keapply;
import com.aaa.rzhr.pojo.Zhuanzheng;
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
    /**修改登录密码*/
     void L_update_pwd(Emp emp);
    /**查询审批各个状态*/
    List<Map> L_query_leave(@Param("empid") Integer empid);
    /**工资单查询*/
    List<Map> L_query_pay(Integer empid);
    /**请假申请*/
    void L_add_leave(int empid, String leaoverdate, String leaday, String leatype, String leareason, String leaenterdate, String shendate, int leasate, int deptid);
    /**加班申请*/
    void L_add_jiaban(int empid, String apovtype, String apovstartdate, String apoverdate, String apovhour, String aovreason, int apovstate, int deptid);
    /**离职申请*/
    void L_add_lizhi(int empid, String dimtype, String dimdetails, String dimsuggest, String dimturn, String dimapplydate, int dimstate, int deptid);


    /**查询休假*/
    List<Map> L_query_xiujia(@Param("empid") Integer empid, @Param("fristdate") String fristdate, @Param("overdate") String overdate, @Param("leasate") Integer leasate, @Param("deptid") Integer deptid);
    /**查询加班*/
    List<Map> L_query_jiaban(@Param("empid") Integer empid, @Param("fristdate") String fristdate, @Param("overdate") String overdate, @Param("apovstate") Integer apovstate, @Param("deptid") Integer deptid);
    /**查询辞职*/
    List<Map> L_query_cizhi(@Param("empid") Integer empid, @Param("fristdate") String fristdate, @Param("overdate") String overdate, @Param("dimstate") Integer dimstate, @Param("deptid") Integer deptid);
    /**修改休假的状态    为3*/
    void L_update_xiujia(Integer leaid);
    /**修改加班的状态  为3*/
    void L_update_jiaban(Integer apovid);
    /**修改离职的状态  为3*/
    void L_update_cizhi(Integer dimid);
    /**查询所有信息*/
    List<Map> L_query_emp(@Param("deptid") Integer deptid);
    /**姓名查询信息*/
    List<Map> L_query_emp_name(@Param("empname") String empname);
    /**个人员工岗位说明书*/
    List<Map> L_query_emp_empid(@Param("empid") Integer empid);
    /**查询未审批的休假*/
    List<Map> L_shen_leave(@Param("deptid") Integer deptid, @Param("leasate") Integer leasate);
    /**查询未审批的加班*/
    List<Map> L_shen_jiaban(@Param("deptid") Integer deptid, @Param("apovstate") Integer apovstate);
    /**查询未审批的离职*/
    List<Map> L_shen_lizhi(@Param("deptid") Integer deptid, @Param("dimstate") Integer dimstate);
    /** 修改休假状态  1和2*/
     void L_upd_xiujia_unpass(@Param("leasate") Integer leasate, @Param("pipeople") String pipeople, @Param("pidate") String pidate, @Param("bohui") String bohui, @Param("leaid") Integer leaid);
    /** 修改加班状态  1和2*/
    void L_upd_jiaban_unpass(@Param("apovstate") Integer apovstate, @Param("pipeople") String pipeople, @Param("shentime") String shentime, @Param("bohui") String bohui, @Param("apovid") Integer apovid);
    /** 修改离职状态  1和2*/
    void L_upd_lizhi_unpass(@Param("dimstate") Integer dimstate, @Param("dimsign") String dimsign, @Param("nodim") String nodim, @Param("bohui") String bohui, @Param("dimid") Integer dimid);
    /** 根据时间工资单查询*/
    List<Map> L_query_pay_time(@Param("empid") String empid, @Param("time1") String time1, @Param("time2") String time2);
    /**根据empnumber查询*/
    List<Map> L_query_user_name(@Param("empnumber") String empnumber);
    /**修改emp状态 为3*/
    void L_update_emp_empstateid(Emp emp);
    /**---------------------------------二级审核*/
    /** 修改休假状态  1和2*/
    void J_upd_xiujia_unpass(@Param("leasate") Integer leasate, @Param("zongshen") String zongshen, @Param("zongshendate") String zongshendate, @Param("zongbohui") String zongbohui, @Param("leaid") Integer leaid);
    /** 修改加班状态  1和2*/
    void J_upd_jiaban_unpass(@Param("apovstate") Integer apovstate, @Param("zongshen") String zongshen, @Param("zongshendate") String zongshendate, @Param("zongbohui") String zongbohui, @Param("apovid") Integer apovid);
    /** 修改离职状态  1和2*/
    void J_upd_lizhi_unpass(@Param("dimstate") Integer dimstate, @Param("zongshen") String zongshen, @Param("zongshendate") String zongshendate, @Param("zongbohui") String zongbohui, @Param("dimid") Integer dimid);
     /**出差申请添加*/
     void L_add_out(Apply_Office apply_office);
    /**转正申请*/
    void L_add_zhuanzheng(Zhuanzheng zhuanzheng);
    /**一级审批查询培训  转正  出差*/
    /**转正*/
    List<Map>  L_shen_zhuan(@Param("deptid") Integer deptid, @Param("shenqingstate") Integer shenqingstate, @Param("fristdate") String fristdate, @Param("overdate") String overdate);
    /**出差*/
    List<Map>  L_shen_out(@Param("deptid") Integer deptid, @Param("offstate") Integer offstate, @Param("fristdate") String fristdate, @Param("overdate") String overdate);
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
    List<Map> L_query_pei();
    /**报名课程*/
    void  L_add_keapply(Keapply keapply);

}
