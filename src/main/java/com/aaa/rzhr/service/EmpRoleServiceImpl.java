package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.EmpRoleMapper;
import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Emp_Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author XBJ
 * @date 2018-10-19 0:02
 */
@Service
@SuppressWarnings("ALL")
@Transactional()
public class EmpRoleServiceImpl implements EmpRoleService{
    @Autowired
    EmpRoleMapper empRoleMapper;
    @Override
    public List<Emp_Role> SelectByEmp(Emp emp) {
        return empRoleMapper.SelectByEmp(emp);
    }

    @Override
    public int delEmpRoleByempid(Integer empid) {
        int s=empRoleMapper.delEmpRoleByempid(empid);

        return s;
    }

    @Override
    public int saveEmpRole(List<String> liststr,Integer empid) {

        List<Emp_Role> list=new ArrayList<Emp_Role>();

          for (String s:liststr){
              Emp_Role emp_role=new Emp_Role();
              emp_role.setEmpid(empid);
              emp_role.setRoid(Integer.parseInt(s));
              list.add(emp_role);
          }

        return empRoleMapper.saveEmpRole(list);
    }
}
