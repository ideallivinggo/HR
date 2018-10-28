package com.aaa.rzhr.service;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author YQL
 * @date 2018/10/22 15:00
 */
public interface DeptService {
    /**
    * 查询部门1
    * */
    public List<Map> QueryDeptYqx();
    /**
     * 添加部门
     * */
    public void addDept(@Param("deptName") String deptName,@Param("deptnum") Integer deptnum);
    /**
     * 删除部门
     * */
    public void delDept(@Param("deptId") Integer deptId);
    /**
     * 分组查询emp中的deptid
     * */
    public List<Map> QueryByEmpDeptid();
}
