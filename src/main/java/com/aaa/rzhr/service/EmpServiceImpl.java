package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.EmpMapper;
import com.aaa.rzhr.pojo.Emp;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.apache.ibatis.annotations.Param;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author XBJ
 * @date 2018-10-16 22:36
 */
@SuppressWarnings("ALL")
@Service
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpMapper empMapper;

    @Override
    public Emp getByName(String name) {
        return empMapper.getByName(name);
    }

    @Override
    public int addEmp(Emp emp) {
        return empMapper.addEmp(emp);
    }

    @Override
    public List<Emp> queryallempX() {
        System.out.println("进入到了++++666666666666666666666666666666666666666666");
        return empMapper.queryallempX();
    }

    @Override
    public Emp queryEmpById(Integer empid) {
        return empMapper.queryEmpById(empid);
    }

    @Override
    public PageInfo<Map> QqueryEmp(Integer pageNum,Integer deptid,String empname,Integer poid,Integer emptypeid) {
        PageHelper.startPage(pageNum,10);
        List<Map> list = empMapper.QqueryEmp(deptid,empname,poid,emptypeid);
        PageInfo<Map> info = new PageInfo<Map>(list);
        return info;
    }
    /**
     * 条件查询1
     * */
    @Override
    public List<Map> QqueryEmpIf(Integer empid) {
        return empMapper.QqueryEmpIf(empid);
    }

    @Override
    public void DelEmpYqx(String  str) {
        empMapper.DelEmpYqx(str);

    }

    @Override
    public void UpdateEmpYqx(Emp emp) {
        System.out.println(emp.getEmpname()+"ddddddddddddddddddddddddddddddddddd");
        empMapper.UpdateEmpYqx(emp);
    }
}
