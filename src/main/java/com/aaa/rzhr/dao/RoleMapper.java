package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@SuppressWarnings("ALL")
@Mapper
public interface RoleMapper {
     Role getRole(int roid);
     List<Role>  listrolex();
}
