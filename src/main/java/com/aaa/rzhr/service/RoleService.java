package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Role;

import java.util.List;

@SuppressWarnings("ALL")
public interface RoleService {
     List<Role> listRoles(String empName);
     List<Role> listRoles(Emp emp);
     List<Role>  listrolex();
     //添加角色
     int  addRoleX(Role r);

}
