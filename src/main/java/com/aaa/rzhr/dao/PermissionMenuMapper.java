package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Permission_Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * @author XBJ
 * @date 2018-10-14 22:15
 */
@Mapper
public interface PermissionMenuMapper {
    List<Permission_Menu> getAllMenuByPid(@Param("pid") Set<Integer> pid);
    List<Permission_Menu> getAllPermission();
}
