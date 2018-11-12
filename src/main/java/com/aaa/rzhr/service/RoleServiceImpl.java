package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.EmpRoleMapper;
import com.aaa.rzhr.dao.RoleMapper;
import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Role;
import com.aaa.rzhr.pojo.Emp_Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("ALL")
@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    EmpService empService;

    @Autowired
    EmpRoleMapper empRoleMapper;

    @Autowired
    RoleMapper roleMapper;

    @Override
    public List<Role> listRoles(String empName) {

           List<Role> roles=new ArrayList<>();
        Emp emp=empService.getByName(empName);
         if(null==emp) {
             return roles;
         }else {
        roles=listRoles(emp);
        return roles;}
    }

    @Override
    public List<Role> listRoles(Emp emp) {
           List<Role> roles=new ArrayList<>();
           List<Emp_Role> userRoles=empRoleMapper.SelectByEmp(emp);
        for (Emp_Role empRole: userRoles
             ) {
              Role r=roleMapper.getRole(empRole.getRoid());
               roles.add(r);
            
        }

        return roles;
    }

    @Override
    public List<Role> listrolex() {
        return roleMapper.listrolex();
    }

    @Override
    public int addRoleX(Role r) {
         Integer i=roleMapper.addRoleX(r);

        return i;
    }
}
