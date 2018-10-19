package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Permission;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@SuppressWarnings("ALL")
@Mapper
public interface PermissionMapper {
          //查询全部权限信息
           List<Permission> QueryAll();
           Permission getPermissionByid(Integer pid);

}
