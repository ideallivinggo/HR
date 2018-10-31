package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.PermissionMapper;
import com.aaa.rzhr.dao.PermissionMenuMapper;
import com.aaa.rzhr.pojo.Menu;
import com.aaa.rzhr.pojo.Permission;
import com.aaa.rzhr.pojo.Permission_Menu;
import com.alibaba.fastjson.JSONArray;
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

    @Override
    public int savePermissionMenuX(List<String> list, Integer mid) {
        delPermissionMenuX(mid);
        if (!list.get(0).equals("")){
            List<Permission_Menu> listpm=new ArrayList<>();
            for (String str:list){
                Permission_Menu p=new Permission_Menu();
                p.setMid(mid);
                p.setPid(Integer.parseInt(str));
                listpm.add(p);
            }
            permissionMenuMapper.savePermissionMenuX(listpm);
        }

        return 0;
    }

    @Override
    public int delPermissionMenuX(Integer mid) {
        return permissionMenuMapper.delPermissionMenuX(mid);
    }
}
