package com.aaa.rzhr.dao;


import com.aaa.rzhr.pojo.Latedata;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
import com.aaa.rzhr.pojo.Payrolldata;
/**
 *@author SJP
 *@date  2018-10-15
 */
@Mapper
public interface SpaydataMapper {
    //获取薪资表的基本数据
    public List<Payrolldata> Sgetpaydata();
    //获取迟到罚款的基本数据
    public List<Latedata> Sgetlate();
    //添加罚款规则
    public boolean Sdelpaydata();
    public boolean Saddpaydata(Map m);
    //更新薪资数据
    public boolean Supdpdata1(Map m);
    public boolean Supdpdata2(Map m);
    public boolean Supdpdata3(Map m);
    public boolean Supdpdata4(Map m);
    public boolean Supdpdata5(Map m);
}
