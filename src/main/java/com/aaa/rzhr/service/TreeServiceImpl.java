package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.*;
import com.aaa.rzhr.pojo.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@SuppressWarnings("ALL")
@Service
public class TreeServiceImpl implements TreeService {

    @Autowired
    EmpService empService;
    @Autowired
    MenuMapper menuMapper;
    @Autowired
    EmpRoleMapper empRoleMapper;
    @Autowired
    RolePermissionMapper rolePermissionMapper;
    @Autowired
    PermissionMenuMapper permissionMenuMapper;
    @Autowired
    PermissionMapper permissionMapper;


    @Override
    public List<TreeVO>
    queryall() {
      /*  Session s= SecurityUtils.getSubject().getSession();
       Subject subject= (Subject) s.getAttribute("subject");*/
      //获取当前登录对象
        Subject subject= SecurityUtils.getSubject();
        //根据员工姓名查询员工信息
      Emp emp= empService.getByName(subject.getPrincipal().toString());
        //根据用户查询用户角色集合
        Set<Integer> ridset = empRoleMapper.selectByEmprid(emp);
        //根据角色id查询角色权限中间表
        List<Role_Permission> allRPByAllRid = rolePermissionMapper.getAllRPByAllRid(ridset);

        //当前用户的所有权限pid集合
        Set<Integer> permissionset=new HashSet<Integer>();

        //遍历中间表 获取该用户的所有权限信息
        for (Role_Permission rolePermission:allRPByAllRid
             ) {

            permissionset.add(rolePermission.getPid());
        }
      // System.out.println(permissionset);
         Set<Integer> permissinMenuSet=new HashSet<Integer>();
        //根据权限id查询
        List<Permission_Menu> allMenuByPid = permissionMenuMapper.getAllMenuByPid(permissionset);
        for (Permission_Menu pm:allMenuByPid
             ) {
            permissinMenuSet.add(pm.getMid());
        }
        //System.out.println(permissinMenuSet);
        //查询出全部权限 菜单中间表
        List<Permission_Menu> allPermission = permissionMenuMapper.getAllPermission();

        List<TreeVO> list=new ArrayList<TreeVO>();

        //查询全部菜单
        List<Menu> allMenuByAllMid = menuMapper.getAllMenuByAllMid(permissinMenuSet);
        for (Menu m:allMenuByAllMid
                ) {
            TreeVO t=new TreeVO();
            t.setName(m.getMname());
            List<Permission> permissions=new ArrayList<Permission>();

            for (Permission_Menu permissionMenu:allPermission
                 ) {

                if (m.getMid().equals(permissionMenu.getMid()) && permissionset.contains(permissionMenu.getPid())){
                    Permission p=permissionMapper.getPermissionByid(permissionMenu.getPid());
                  permissions.add(p);

                }
            }
            t.setPermissionList(permissions);
            list.add(t);
            //t.setPermissionList();
            //System.out.println(m.getMname());


        }



        return list;
    }
}
