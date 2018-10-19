package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * @author XBJ
 * @date 2018-10-16 16:16
 */
@Mapper
public interface MenuMapper {
    List<Menu> getallMenu();
    List<Menu> getAllMenuByAllMid(@Param("mid") Set<Integer> mid);
}
