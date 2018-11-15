package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.KeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
@SuppressWarnings("ALL")
public class KeServiceImpl implements  KeService {
    @Autowired
   private KeMapper keMapper;
    @Override
    public List<Map> p_query_ke(Integer empid) {
        return keMapper.p_query_ke(empid);
    }
}
