package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Emp_Role;

import java.util.List;

/**
 * @author XBJ
 * @date 2018-10-19 0:01
 */
public interface EmpRoleService {
    //根据用户 查询用户-角色中间表
    List<Emp_Role> SelectByEmp(Emp emp);
    //根据用户信息删除中间表
    int  delEmpRoleByempid(Integer empid);
    //为用户设置新的角色
    int saveEmpRole(List<String> list,Integer empid);
}
