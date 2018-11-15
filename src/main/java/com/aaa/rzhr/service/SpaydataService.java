package com.aaa.rzhr.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;


import com.aaa.rzhr.pojo.Att_Statistics;
import com.aaa.rzhr.pojo.Latedata;
import com.aaa.rzhr.pojo.Payrolldata;
import org.apache.ibatis.annotations.Param;

/**
 * @author SJP
 * @date 2018/10/15 0015 9:58
 */
public interface SpaydataService {
    //获取薪资表的基本数据
    public List<Payrolldata> Sgetpaydata();
    //获取迟到罚款的基本数据
    public List<Latedata> Sgetlate();
    //添加罚款规则
    public boolean Sdelpaydata();
    public boolean Saddpaydata(Map m);

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
    public List<Map> SgetAll(Integer id) throws ParseException;
    //查询员工指定月份的绩效
    public List<Map> sgetjixiao(String id);
    //添加薪资表实发薪资
    public int Saddpayroll(Map m);
    //获取员工薪资
    public List<Map> Sgetygxz(String cs);
    //修改员工薪资
    public int supdatexz(Map m);
    //获取考核模板
    public List<Map> sgetmb();
    //获取绩效模板明细
    public List<Map> Sgetmbmx(int id);
    //获取绩效模板明细外键
    public Map Sgetjxmbwj(int id);
    //修改绩效末班明细
    public int Supdjxmx(List<Map> list);
    //添加绩效考核明细
    public int Saddjxmx(List<Map> list);
    //删除绩效考核明细
    public int sdeljxmx(List<Map> list);
    //查询部门表
    public List<Map<String,Object>> getdept();
    //根据部门ID查询员工
    public List<Map<String,Object>> getyuang(Integer id);
    //添加绩效模板
    public int Saddjxmb(Map m);

    //删除绩效模板
    public int Sdeljxmb(int tnaid);
    //删除绩效模板明细
    public int Sdeljxmbmx(int tnaid);
    //查询绩效模板是否有明细
    public List<Map> sgetmbmx(int tnaid);

    //发起绩效 添加绩效考核
    public int saddjxfq(Map m);

    //获取绩效考核
    public List<Map> getjxkh();
    //删除绩效考核
    public int sdeljxkh(int id);
    //获取员工部门
    public Map sgetbumen(int id);
    //获取指定部门中的员工
    public List<Map> sgetyg(int id);
    //获取缩小绩效考核
    public List<Map> sgetjxkhmb(int id);
    //指定员工中指定模板查看是否考核
    public List<Map> sbyempidbymb(String empnumber, String perid);
    //获取指定绩效考试员工信息
    public List<Map> sgetjxkhygmx(int id);
    //获取员工的绩效考核详情
    public List<Map> sgetygkhmx(int id,int pid);
    //获取指定考核模板中的员工
    public Map sgetkhbymbyg(int id);
    //通过工号查询员工是否存在指定的部门
    public List<Map> sgetygbygh(String gh, String did);
    //查询员工是否有评过的绩效
    public List<Map> sgetygsfpg(@Param("perid") String perid, @Param("empid") String empid);
    //查询指定模板的考核
    public List<Map> sgetmbmxbyygkh(int perid);
    //查询指定员工的姓名
    public Map sgetygbyid(int empid);
    //添加绩效绩效考核
    public int saddjxkhpg(List<Map> list);
    //获取指定员工指定考核的已考核员工
    public List<Map> sgetyikhyg(String perid, String empid);
    //查询员工未打卡是否有请假
    public List<Map> sgetsfqj(@Param("empnumber") String empnum);
    //查询模板是否存在考核明细
    public List<Map> sgetmbyid(int id);
    //查询月考勤表
    public List<Map> sgetAll();
    //查询员工钉钉表
    public List<Map> sgetempdingAll();
    //添加员工的月考勤数据
    public int saddykq(List<Map> list);
    //添加下个月的月考核
    public int saddyqkhdate(String date);
    //查询指定月份的考核是否添加
    public List<Map> sgetbyyf(Map m);
    //查询指定
    public List<Map> sgetsumyfkh(int a);
    //查询员工钉钉表的所有员工;
    public List<Map> sgetalled();
    //
    public Map sgetallby(Map m);
    //添加员工月迟到记录
    public int saddycdj(List<Map> list);
    //查询已申请的月请假
    public List<Map> sgetyueqj();
    //查询已申请的病假
    public List<Map> sgetbingjia();
    //查询所有的加班
    public List<Map> sgetjball();
}
