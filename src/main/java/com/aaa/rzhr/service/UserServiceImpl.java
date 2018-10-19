package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.UserDao;
import com.aaa.rzhr.pojo.Apply_Leave;
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
    public void L_add_leave(int empid, String leaoverdate, String leaday, String leatype, String leareason, String leaenterdate) {
        userDao.L_add_leave(empid, leaoverdate, leaday, leatype, leareason, leaenterdate);
    }


}
