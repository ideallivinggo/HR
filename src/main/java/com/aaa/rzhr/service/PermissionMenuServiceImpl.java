package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.PermissionMapper;
import com.aaa.rzhr.dao.PermissionMenuMapper;
import com.aaa.rzhr.pojo.Menu;
import com.aaa.rzhr.pojo.Permission;
import com.aaa.rzhr.pojo.Permission_Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author XBJ
 * @date 2018-10-20 18:23
 */
@SuppressWarnings("ALL")
@Service
public class PermissionMenuServiceImpl implements  PermissionMenuService {

    @Autowired
    PermissionMenuMapper permissionMenuMapper;
    @Autowired
    PermissionMapper permissionMapper;

    @Override
    public List<Permission> getAllMenuByMenu(Menu menu) {
        List<Permission_Menu> permission_menus= permissionMenuMapper.getAllMenuByMenu(menu);
        List<Permission> permissions=new ArrayList<>();
    for (Permission_Menu p:permission_menus){
        Permission permissionByid = permissionMapper.getPermissionByid(p.getPid());
        permissions.add(permissionByid);
    }
        return permissions;
    }
}
