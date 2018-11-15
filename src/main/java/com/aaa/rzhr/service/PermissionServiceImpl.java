package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.PermissionMapper;
import com.aaa.rzhr.pojo.Permission;
import com.aaa.rzhr.pojo.Role;
import com.aaa.rzhr.pojo.Role_Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@SuppressWarnings("ALL")
@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    PermissionMapper permissionMapper;

    @Autowired
    RoleService roleService;

    @Autowired
    RolePermissionService rolePermissionService;

@Override
@Cacheable(value = "permission",keyGenerator = "wiselyKeyGenerator")
    public boolean needInterceptor(String requestUrl) {
        List<Permission> permissions = permissionMapper.QueryAll();
        for (Permission p: permissions
             ) {
               if (p.getUrl().equals(requestUrl)){
                   return  true;
               }
        }

        return false;
    }

    @Override
    public Set<String> listPermissionURLs(String empName) {
        Set<String> result=new HashSet<>();
      List<Role> roles=roleService.listRoles(empName);
      List<Role_Permission> rolePermissions=new ArrayList<>();
        for (Role role: roles
             ) {
          List<Role_Permission> rps=rolePermissionService.getAllRPByRid(role.getRoid());
            rolePermissions.addAll(rps);
        }
        for (Role_Permission rp:rolePermissions
             ) {
               Permission p=getPermissionByid(rp.getPid());
              result.add(p.getUrl());
        }


        return result;
    }

    @Override
    @Cacheable(value = "permission",keyGenerator = "wiselyKeyGenerator")
    public Permission getPermissionByid(Integer pid) {
        return permissionMapper.getPermissionByid(pid);
    }

    @Override
    public List<Permission> queryPermissionByRoleX(Role role) {
        List<Permission> result = new ArrayList<>();
        List<Role_Permission> allRPByRid = rolePermissionService.getAllRPByRid(role.getRoid());
        for (Role_Permission rolePermission : allRPByRid) {
            Permission permissionByid = permissionMapper.getPermissionByid(rolePermission.getPid());
            result.add(permissionByid);
        }
        return result;
    }

    @Override
    public List<Permission> QueryAll() {
        return permissionMapper.QueryAll();
    }
}
