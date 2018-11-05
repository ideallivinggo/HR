package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.Rzmessage;

import java.util.List;

/**
 * @author XBJ
 * @date 2018-11-02 11:31
 */
public interface RzmessageService {
    int addRzmessageX(Rzmessage rzmessage);
    List<Rzmessage> queryRzmessageX(String nowate,String mestate);
}
