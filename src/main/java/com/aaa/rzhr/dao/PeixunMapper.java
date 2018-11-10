package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Kecheng;
import com.aaa.rzhr.pojo.Keteacher;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Mapper
public interface PeixunMapper {
      int addkecheng(Kecheng kecheng);
      List<Emp> queryEmpByEmp(Map emp);
       int addKeTeacher(List<Keteacher> keteacher);
        List<Kecheng> getKechengByEmpid(Integer empid);
}
