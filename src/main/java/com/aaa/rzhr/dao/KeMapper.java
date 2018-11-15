package com.aaa.rzhr.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
@Mapper
public interface KeMapper {
   List<Map> p_query_ke(@Param("empid") Integer empid);
}
