package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.UserDao;
import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.util.LayuiFy;
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
    public List<Map> L_query_leave(Integer empid,Integer leasate) {

       return userDao.L_query_leave(empid,leasate);
    }

    @Override
    public LayuiFy L_query_pay(Integer empid) {
        LayuiFy aa=new LayuiFy();
        aa.setCount(userDao.L_query_pay(empid).size());
        aa.setData(userDao.L_query_pay(empid));
        return aa;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}

