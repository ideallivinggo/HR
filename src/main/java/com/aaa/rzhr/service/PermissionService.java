package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.Permission;
import com.aaa.rzhr.pojo.Role;

import java.util.List;
import java.util.Set;

@SuppressWarnings("ALL")
public interface PermissionService {
    boolean needInterceptor(String requestUrl);
    Set<String> listPermissionURLs(String userName);
    Permission getPermissionByid(Integer pid);

    List<Permission> queryPermissionByRoleX(Role role);
    //查询全部权限信息
    List<Permission> QueryAll();
}
