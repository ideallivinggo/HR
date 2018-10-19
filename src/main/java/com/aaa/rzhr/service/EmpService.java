package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.Emp;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author XBJ
 * @date 2018-10-16 22:34
 */
public interface EmpService {
     Emp getByName(String name);
     int addEmp(Emp emp);
     List<Emp> queryallempX();

     //-----------------------------------------------///
     /** 查询员工 */
     public PageInfo<Map> QqueryEmp(Integer pageNum, @Param("deptid")Integer deptid, @Param("empname")String empname);
     /**
      * 条件查询
      * */
     public List<Map> QqueryEmpIf(@Param("empid")Integer empid);
     /**
      * 批量删除
      * */
     public void DelEmpYqx(String  str);

}
