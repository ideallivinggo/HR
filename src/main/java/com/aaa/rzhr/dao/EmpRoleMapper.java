package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Emp_Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Set;

@SuppressWarnings("ALL")
@Mapper
public interface EmpRoleMapper {

     //根据用户 查询用户-角色中间表
    List<Emp_Role>  SelectByEmp(Emp emp);
    //根据用户id查询用户 角色
    Set<Integer> selectByEmprid(Emp emp);
 //根据用户信息删除中间表
   int  delEmpRoleByempid(Integer empid);
    //为用户设置新的角色
     int saveEmpRole(List<Emp_Role> emp_roles);
}
