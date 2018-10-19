package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Role_Permission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

@SuppressWarnings("ALL")
@Mapper
public interface RolePermissionMapper {

 List<Role_Permission> getAllRPByRid(Integer rid);
 List<Role_Permission> getAllRPByAllRid(@Param("rid") Set<Integer> rid);
  //根据角色id删除角色全陷
 int delRolePermissionX(Integer roid);
 int addRolePermisssionX(List<Role_Permission> list);


}
