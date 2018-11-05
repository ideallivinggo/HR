package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Rzmessage;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author XBJ
 * @date 2018-11-02 11:17
 */
@Mapper
public interface RzmessageMapper {
     int addRzmessageX(Rzmessage rzmessage);
     List<Rzmessage> queryRzmessageX(@Param("nowate") String nowate,@Param("mestate") String mestate);

}
