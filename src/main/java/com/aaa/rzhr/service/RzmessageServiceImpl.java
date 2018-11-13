package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.RzmessageMapper;
import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Rzmessage;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author XBJ
 * @date 2018-11-02 11:32
 */
@SuppressWarnings("ALL")
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
        Subject subject= SecurityUtils.getSubject();
        Session s=  subject.getSession();
        Emp emp= (Emp) s.getAttribute("emp");
         if (mestate=="1"){
             return rzmessageMapper.queryRzmessageX(nowate,mestate,null);
         }
        return rzmessageMapper.queryRzmessageX(nowate,mestate,emp.getDeptid().toString());
    }
}
