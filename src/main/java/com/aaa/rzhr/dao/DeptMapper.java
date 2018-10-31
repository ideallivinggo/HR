package com.aaa.rzhr.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author YQL
 * @date 2018/10/22 14:54
 */
@Mapper
public interface DeptMapper {
    /**
     * 查询部门
     * */
    public List<Map> QueryDeptYqx();
    /**
     * 添加部门1
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
