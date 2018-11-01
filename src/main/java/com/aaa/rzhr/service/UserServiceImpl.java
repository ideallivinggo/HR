package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.UserDao;
import com.aaa.rzhr.pojo.Apply_Leave;
import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.util.LayuiFy;
import com.aaa.rzhr.util.layuiUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author 15G5567
 */
@Service

public class UserServiceImpl implements  UserService {
    @Autowired
    private UserDao userDao;
    @Override
    /**个人信息中心*/
    public List<Map> L_query_user(Integer empid) {
        return userDao.L_query_user(empid);
    }

    /**请假申请*/
    @Override
    public void L_add_leave(int empid, String leaoverdate, String leaday, String leatype, String leareason, String leaenterdate,String shendate,int leasate,int deptid) {
        userDao.L_add_leave(empid, leaoverdate, leaday, leatype, leareason, leaenterdate,shendate,leasate,deptid);
    }
/**
 * 修改密码
 * */
    @Override
    public void L_update_pwd(Emp emp) {

        userDao.L_update_pwd(emp);
    }

    @Override
    public List<Map> L_query_leave(Integer empid) {

       return userDao.L_query_leave(empid);
    }

    @Override
    public LayuiFy L_query_pay(Integer empid,Integer limit,Integer page) {
        LayuiFy aa= layuiUtil.getData(userDao.L_query_pay(empid),limit,page);
        return aa;
    }
/**
 * 加班申请
 * */
    @Override
    public void L_add_jiaban(int empid, String apovtype, String apovstartdate, String apoverdate, String apovhour, String aovreason, int apovstate,int deptid) {
        userDao.L_add_jiaban(empid, apovtype, apovstartdate, apoverdate, apovhour, aovreason, apovstate,deptid);
    }
/**
 * 离职申请
 * */
    @Override
    public void L_add_lizhi(int empid, String dimtype, String dimdetails, String dimsuggest, String dimturn, String dimapplydate, int dimstate,int deptid) {
userDao.L_add_lizhi(empid, dimtype, dimdetails, dimsuggest, dimturn, dimapplydate, dimstate,deptid);
    }
/**休假加班离职*/
    @Override
    public List<Map> L_query_xiujia(Integer empid,String fristdate,String overdate, Integer leasate) {

        return userDao.L_query_xiujia(empid,fristdate,overdate,leasate);
    }

    @Override
    public List<Map> L_query_jiaban(Integer empid, String fristdate, String overdate, Integer apovstate) {
        return userDao.L_query_jiaban(empid,fristdate,overdate,apovstate);
    }

    @Override
    public List<Map> L_query_cizhi(Integer empid, String fristdate, String overdate, Integer dimstate) {
        return userDao.L_query_cizhi(empid,fristdate,overdate,dimstate);
    }
    /**休假加班离职撤回*/
    @Override
    public void  L_update_xiujia(Integer leaid) {
       userDao.L_update_xiujia(leaid);
    }

    @Override
    public void L_update_jiaban(Integer apovid) {
        userDao.L_update_jiaban(apovid);
    }

    @Override
    public void L_update_cizhi(Integer dimid) {
       userDao.L_update_cizhi(dimid);
    }

    @Override
    public List<Map> L_query_emp(Integer deptid) {
        return userDao.L_query_emp(deptid);
    }
    /**员工通讯录*/
    @Override
    public List<Map> L_query_emp_name(String empname) {
        return userDao.L_query_emp_name(empname);
    }

    @Override
    public List<Map> L_query_emp_empid(Integer empid) {
        return userDao.L_query_emp_empid(empid);
    }
    /**休假加班离职 审核*/
    @Override
    public List<Map> L_shen_leave(Integer deptid,Integer leasate) {
        return userDao.L_shen_leave(deptid,leasate);
    }

    @Override
    public List<Map> L_shen_jiaban(Integer deptid,Integer apovstate) {
        return userDao.L_shen_jiaban(deptid,apovstate);
    }

    @Override
    public List<Map> L_shen_lizhi(Integer deptid,Integer dimstate) {
        return userDao.L_shen_lizhi(deptid,dimstate);
    }
/**修改  审批状态  休假加班   离职*/
    @Override
    public void L_upd_xiujia_unpass(Integer leasate,String pipeople, String pidate, String bohui, Integer leaid) {
      userDao.L_upd_xiujia_unpass(leasate,pipeople,pidate,bohui,leaid);
    }

    @Override
    public void L_upd_jiaban_unpass(Integer apovstate, String pipeople,String shentime, String bohui, Integer apovid) {
    userDao.L_upd_jiaban_unpass(apovstate,pipeople,shentime,bohui,apovid);
    }

    @Override
    public void L_upd_lizhi_unpass(Integer dimstate,String dimsign, String nodim, String bohui, Integer dimid) {
     userDao.L_upd_lizhi_unpass(dimstate, dimsign, nodim, bohui, dimid);
    }

    @Override
    public LayuiFy L_query_pay_time(String empid, String time1, String time2,Integer limit,Integer page) {
        LayuiFy aa= layuiUtil.getData(userDao.L_query_pay_time(empid,time1,time2),limit,page);
        return aa;
    }
}

