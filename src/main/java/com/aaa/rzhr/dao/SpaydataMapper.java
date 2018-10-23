package com.aaa.rzhr.dao;


import com.aaa.rzhr.pojo.Att_Statistics;
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
    //获取台账表数据
    public List<Att_Statistics> Sgetatt();
    //删除台账表数据
    public int SdelattById(int id);
    //获取月考勤记录，员工薪资，员工信息，银行卡信息
 public List<Map> SgetAll(Integer id);
 //添加薪资表实发薪资
 public int Saddpayroll(Map m);

}
