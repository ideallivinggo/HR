package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.SpaydataMapper;
import com.aaa.rzhr.pojo.Latedata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aaa.rzhr.pojo.Payrolldata;
import java.util.List;
import java.util.Map;

/**
 * @author SJP
 * @date 2018/10/15 0015 9:59
 */
@Service
@SuppressWarnings("All")
public class SpaydataServiceImpl implements  SpaydataService {
    @Autowired
    SpaydataMapper mapper;

    @Override
    public List<Payrolldata> Sgetpaydata() {

        return mapper.Sgetpaydata();
    }

    @Override
    public List<Latedata> Sgetlate() {
        return mapper.Sgetlate();
    }

    @Override
    public boolean Sdelpaydata() {
        return mapper.Sdelpaydata();
    }

    @Override
    public boolean Saddpaydata(Map m) {
        return mapper.Saddpaydata(m);
    }

    @Override
    public boolean Supdpdata1(Map m) {
        return mapper.Supdpdata1(m);
    }

    @Override
    public boolean Supdpdata2(Map m) {
        return mapper.Supdpdata2(m);
    }

    @Override
    public boolean Supdpdata3(Map m) {
        return mapper.Supdpdata3(m);
    }

    @Override
    public boolean Supdpdata4(Map m) {
        return mapper.Supdpdata4(m);
    }

    @Override
    public boolean Supdpdata5(Map m) {
        return mapper.Supdpdata5(m);
    }


}
