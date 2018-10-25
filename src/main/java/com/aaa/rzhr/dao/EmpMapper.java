package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Emp;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author XBJ
 * @date 2018-10-16 21:45
 */
@Mapper
public interface EmpMapper {
   Emp getByName(@Param("name") String name);
    int addEmp (Emp emp);
    List<Emp> queryallempX();




    //------------------------------------------------------------------////
    /** 查询员工 */
    public List<Map> QqueryEmp(@Param("deptid")Integer deptid, @Param("empname")String empname,@Param("poid") Integer poid,@Param("emptypeid") Integer emptypeid);
    /**
     * 条件查询
     * */
    public List<Map> QqueryEmpIf(@Param("empid")Integer empid);
    /**
     * 批量删除1
     * */
    public void DelEmpYqx(@Param("str") String  str);
    /**
     * 更新
     * */
    public void UpdateEmpYqx(Emp emp);

}
