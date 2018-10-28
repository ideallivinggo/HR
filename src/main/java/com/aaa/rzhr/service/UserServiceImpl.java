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
    public void L_add_leave(int empid, String leaoverdate, String leaday, String leatype, String leareason, String leaenterdate,String shendate,int leasate) {
        userDao.L_add_leave(empid, leaoverdate, leaday, leatype, leareason, leaenterdate,shendate,leasate);
    }

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

    @Override
    public void L_add_jiaban(int empid, String apovtype, String apovstartdate, String apoverdate, String apovhour, String aovreason, int apovstate) {
        userDao.L_add_jiaban(empid, apovtype, apovstartdate, apoverdate, apovhour, aovreason, apovstate);
    }

    @Override
    public void L_add_lizhi(int empid, String dimtype, String dimdetails, String dimsuggest, String dimturn, String dimapplydate, int dimstate) {
userDao.L_add_lizhi(empid, dimtype, dimdetails, dimsuggest, dimturn, dimapplydate, dimstate);
    }

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
    @Override
    public void L_update_xiujia(Integer leaid) {
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
    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}

