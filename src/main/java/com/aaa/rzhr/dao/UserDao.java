package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Apply_Leave;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;


/**
 * @author ljp
 */
@Mapper
public interface UserDao {
    //个人信息
    public List<Map> L_query_user(Integer empid);
    //请假申请
    public void L_add_leave(int empid, String leaoverdate, String leaday, String leatype, String leareason, String leaenterdate);
}
