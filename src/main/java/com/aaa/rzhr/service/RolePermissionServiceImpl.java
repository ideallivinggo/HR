package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.RolePermissionMapper;
import com.aaa.rzhr.pojo.Role;
import com.aaa.rzhr.pojo.Role_Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("ALL")
@Service
@Transactional()
public class RolePermissionServiceImpl implements  RolePermissionService {

    @Autowired
    RolePermissionMapper rolePermissionMapper;
    @Autowired
    RoleService roleService;

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
        if(!liststr.get(0).equals("")){
            for (String s:liststr){
                Role_Permission r=new Role_Permission();
                r.setRoid(roid);
                r.setPid(Integer.parseInt(s));
                lista.add(r);
            }
            rolePermissionMapper.addRolePermisssionX(lista);
        }


        return 0;
    }

    @Override
    public int saveRolePermissionX(List<String> liststr, String roname) {
         Role role=new Role();
         role.setRoname(roname);
         roleService.addRoleX(role);
         Integer rid=role.getRoid();
         if(!liststr.get(0).equals("")){
             List<Role_Permission> lista=new ArrayList<>();
             for (String s:liststr){
                 Role_Permission r=new Role_Permission();
                 r.setRoid(rid);
                 r.setPid(Integer.parseInt(s));
                 lista.add(r);
             }
             rolePermissionMapper.addRolePermisssionX(lista);

         }


        return 0;
    }
}
