package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Kecheng;
import com.aaa.rzhr.pojo.Keteacher;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface PeixunService {
    int addkecheng(Kecheng kecheng);
    List<Emp> queryEmpByEmp(Map emp);
    int  addKeTeacher(List<String> empid,Integer keid);
    List<Kecheng> getKechengByEmpid(Integer empid);
}
