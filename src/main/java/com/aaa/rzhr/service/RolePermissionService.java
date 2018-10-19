package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.Role_Permission;

import java.util.List;

@SuppressWarnings("ALL")
public interface RolePermissionService {
    List<Role_Permission> getAllRPByRid(Integer rid);
    //根据角色id删除角色全陷
    int delRolePermissionX(Integer roid);
    //保存角色权限表
    int saveRolePermissionX(List<String> liststr,Integer roid);
}
