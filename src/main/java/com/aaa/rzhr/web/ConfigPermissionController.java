package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.*;
import com.aaa.rzhr.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * @author XBJ
 * @date 2018-10-18 0:33
 */
@Controller
@RequestMapping("/config")
public class ConfigPermissionController {

    @Autowired
    EmpService empService;
    @Autowired
    RoleService roleService;
    @Autowired
    EmpRoleService empRoleService;
    @Autowired
    PermissionService permissionService;
    @Autowired
    RolePermissionService  rolePermissionService;



    @RequestMapping("/permissionconfig")
    public String aaa(Model m){
        //查询所有用户
        List<Emp> emps = empService.queryallempX();
        m.addAttribute("list",emps);

        Map<Emp,List<Role>> emp_role=new HashMap<>();
        for (Emp emp:emps){
            List<Role> roles=roleService.listRoles(emp);
            emp_role.put(emp,roles);
        }
        m.addAttribute("emp_role",emp_role);

        return "Test/showEmp";
    }




  //编辑角色信息
    @RequestMapping("/showRole")
    public String showEmp(Model m){
        List<Role> listrolex = roleService.listrolex();
         m.addAttribute("role",listrolex);
        Map<Role, List<Permission>> role_permissions = new HashMap<>();
        for (Role role : listrolex) {
            List<Permission> ps = permissionService.queryPermissionByRoleX(role);
            role_permissions.put(role, ps);
        }
        m.addAttribute("rm",role_permissions);

        return "Test/showRole";
    }
    //修改用户角色查询全部角色
    @RequestMapping("/queryRoleX")
    public  @ResponseBody List<Role> queryRoleX(){
        System.out.println("调用了查询全部role");
        List<Role> listrolex = roleService.listrolex();
        for (Role r:listrolex
             ) {
            System.out.println(r.getRoname());

        }
        return listrolex;

    }
    //根据用户查询角色
  @RequestMapping("queryEmpRoleByEmpX")
    public @ResponseBody List<Emp_Role> queryEmpRoleByEmpX(Integer empid){
      System.out.println(empid);
        Emp e=new Emp();
        e.setEmpid(empid);
      List<Emp_Role> emp_roles = empRoleService.SelectByEmp(e);
      return emp_roles;
    }

   //保存用户信息
    @RequestMapping("SaveEmpRoleX")
    public @ResponseBody String SaveEmpRoleX(String endroidstr,Integer empid){

         String[] endroidstrsplit = endroidstr.split(",");
             List<String> nowroid= Arrays.asList(endroidstrsplit);

          empRoleService.delEmpRoleByempid(empid);
           if(!endroidstr.equals("")){
               empRoleService.saveEmpRole(nowroid,empid);
           }

        return "ok";
    }
   //查询全部权限
    @RequestMapping("queryallPermissionX")
    public @ResponseBody List<Permission>  queryallPermissionX(){
        List<Permission> permissions = permissionService.QueryAll();
        return permissions;
    }
  //根据角色ID查询 角色权限呢中间表
    @RequestMapping("queryRolePermissionByRoleIdX")
    public @ResponseBody  List<Role_Permission> queryRolePermissionByRoleIdX(Integer roid){
        System.out.println(roid);
        List<Role_Permission> allRPByRid = rolePermissionService.getAllRPByRid(roid);
        return allRPByRid;
    }
   @RequestMapping("saveRolePermissionX")
    public @ResponseBody String saveRolePermissionX(String endpidstr,Integer roid){
       System.out.println(endpidstr);
       System.out.println(roid);
       String[] endpidstrsplit = endpidstr.split(",");
       List<String> nowroid= Arrays.asList(endpidstrsplit);
       rolePermissionService.delRolePermissionX(roid);
       rolePermissionService.saveRolePermissionX(nowroid,roid);


        return "ok";
    }

    @RequestMapping("addRoleX")
public  @ResponseBody String addRoleX(String pidstr,String roname){
        System.out.println(pidstr);
        System.out.println(roname);
        String[] pst=   pidstr.split(",");
        List<String> list= Arrays.asList(pst);
        rolePermissionService.saveRolePermissionX(list,roname);


        return "okokoko";
}

  @RequestMapping("queryMenuX")
  public  String  queryMenuX(){
      System.out.println("查询菜单");



    return "";
  }





}
