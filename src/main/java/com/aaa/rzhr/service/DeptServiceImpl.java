package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author YQL
 * @date 2018/10/22 15:00
 */
@SuppressWarnings("ALL")
@Service
public class DeptServiceImpl implements DeptService {
    /**
    *
    * */
    @Autowired
    private DeptMapper mapper;
    @Override
    public List<Map> QueryDeptYqx() {
        return mapper.QueryDeptYqx();
    }

    @Override
    public void addDept(String deptName,Integer deptnum) {
        mapper.addDept(deptName,deptnum);
    }

    @Override
    public void delDept(Integer deptId) {
        mapper.delDept(deptId);
    }
    /**
     * 分组查询emp中的deptid
     * */
    @Override
    public List<Map> QueryByEmpDeptid() {

        return mapper.QueryByEmpDeptid();
    }
}
