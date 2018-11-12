package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.PeixunMapper;
import com.aaa.rzhr.pojo.Emp;
import com.aaa.rzhr.pojo.Kecheng;
import com.aaa.rzhr.pojo.Keteacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class PeixunServiceImpl implements  PeixunService {

    @Autowired
    PeixunMapper peixunMapper;
    @Override
    public int addkecheng(Kecheng kecheng) {
        return peixunMapper.addkecheng(kecheng);
    }

    @Override
    public List<Emp> queryEmpByEmp(Map emp) {
        return peixunMapper.queryEmpByEmp(emp);
    }

    @Override
    public int addKeTeacher(List<String> empid, Integer keid) {
           List<Keteacher> list=new ArrayList<Keteacher>();
        for (String eid:empid
             ) {
            Keteacher k=new Keteacher();
            k.setEmpid(Integer.parseInt(eid));
             k.setKeid(keid);
            list.add(k);

          }


        return peixunMapper.addKeTeacher(list);
    }

    @Override
    public List<Kecheng> getKechengByEmpid(Integer empid) {
        return peixunMapper.getKechengByEmpid(empid);
    }
}
