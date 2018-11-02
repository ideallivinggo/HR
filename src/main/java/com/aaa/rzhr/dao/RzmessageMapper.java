package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.Rzmessage;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author XBJ
 * @date 2018-11-02 11:17
 */
@Mapper
public interface RzmessageMapper {
     int addRzmessageX(Rzmessage rzmessage);

}
