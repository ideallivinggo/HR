package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.util.LayuiFy;
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
     Emp queryEmpById(Integer empid);

     //-----------------------------------------------///
     /** 查询员工 1*/
     public PageInfo<Map> QqueryEmp(Integer pageNum, Integer deptid, String empname, Integer poid, Integer emptypeid);
     public LayuiFy QueryEmpYqx(Emp emp, Integer limit, Integer page);
     /**
      * 条件查询
      * */
     public List<Map> QqueryEmpIf(@Param("empid") Integer empid);
     /**
      * 批量删除
      * */
     public void DelEmpYqx(String str);
     /**
      * 更新
      * */
     public void UpdateEmpYqx(Emp emp);

}
