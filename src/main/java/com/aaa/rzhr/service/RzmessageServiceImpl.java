package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.RzmessageMapper;
import com.aaa.rzhr.pojo.Rzmessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author XBJ
 * @date 2018-11-02 11:32
 */
@Service
public class RzmessageServiceImpl implements  RzmessageService {

    @Autowired
    RzmessageMapper rzmessageMapper;

    @Override
    public int addRzmessageX(Rzmessage rzmessage) {
        return rzmessageMapper.addRzmessageX(rzmessage);
    }

    @Override
    public List<Rzmessage> queryRzmessageX(String nowate,String mestate) {

        return rzmessageMapper.queryRzmessageX(nowate,mestate);
    }
}
