package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.RolePermissionMapper;
import com.aaa.rzhr.pojo.Role_Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("ALL")
@Service
public class RolePermissionServiceImpl implements  RolePermissionService {

    @Autowired
    RolePermissionMapper rolePermissionMapper;

    @Override
    public List<Role_Permission> getAllRPByRid(Integer rid) {
        return rolePermissionMapper.getAllRPByRid(rid);
    }

    @Override
    public int delRolePermissionX(Integer roid) {
        return rolePermissionMapper.delRolePermissionX(roid);
    }

    @Override
    public int saveRolePermissionX(List<String> liststr, Integer roid) {
         List<Role_Permission> lista=new ArrayList<>();

        for (String s:liststr){
            Role_Permission r=new Role_Permission();
             r.setRoid(roid);
             r.setPid(Integer.parseInt(s));
           lista.add(r);
        }
    rolePermissionMapper.addRolePermisssionX(lista);

        return 0;
    }
}
