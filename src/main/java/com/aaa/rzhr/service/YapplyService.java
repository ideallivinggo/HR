package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.*;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

/**
 * @author YLP
 * @date 2018-10-14 19:47
 */
@SuppressWarnings("ALL")
public interface YapplyService {

    /**
     * 查看要招聘的职位
     */
    List<Position> queryAllPos();
    /**
     * 查看要招聘的部门
     */
    List<Dept> queryAllDept();
    /**
     * 查看汇报人
     */
    List<Emp> queryAllEmp();
    /**
     * 添加招聘申请信息
     */
    void addRec(Recruitment recruitment);
    /**
     * 查看招聘申请信息
     */
    PageInfo<Map> queryAllRec(Recruitment recruitment, Integer pageNum);
    /**
     * 修改申请信息
     * */
    void updateRec(Recruitment recruitment);
    /**
     * 简历录入entering
     * */
    void addResEntering(Resume resume);
    /**
     * 查看简历信息
     */
    PageInfo<Map> queryAllRes(Resume resume, Integer pageNum);
    /**
     * 晒选简历信息
     */
    void updateResOne(Integer resstate, String s);
    /**
     * 简历符合要求后添加第一次面试
     * 修改简历状态（待面试）
     * 发送邮件
     * */
    void addIntone(Interviewone interviewone, Integer resstate, String s);
    /**
     * 查看第一次面试
     * */
    PageInfo<Map> queryAllInte(Interviewone interviewone, Integer pageNum);

    /**
     * 清除过期和不过的面试,修改简历成状态（简历回收站）
     * */
    void updateInte(Interviewone interviewone, Integer resstate, String s);

    /**
     * 通过后添加第二次面试
     * 删除第一次面试状态（第一次面试回收站）
     * 发送邮件通知
     * */
    void addIntTwo(Interviewtwo Interviewtwo, Interviewone interviewone);
    /**
     * 查看第二次 面试
     * */
    PageInfo<Map> queryAllInteTwo(Interviewtwo interviewtwo, Integer pageNum);
    /**
     * 修改第二次面试
     * */
    void updateInteTwo(Interviewtwo interviewtwo);

    /**
     * 面试完成推送
     * */
    void inteTwoPash(Integer intstate, String s);

    /**
     * 获取最大的员工编号
     * */
    Map queryActID (Integer actid);
    /**
     * 判断是否激活
     * */
    String judge (Activation activation);
    /**
     * 录取后添加到员工激活表
     * */
    void addAct (Activation activation,Interviewtwo interviewtwo);
    /**
     * 员工激活并且添加员工到待入职状态
     * */
    void updateAct (Activation activation);
    /**
     * 激活详情
     * */
    PageInfo<Map> queryAllAct(Activation activation, Integer pageNum);
    /**
     * 过期撤出
     * */
    void ccAct (Activation activation);








    //////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     * 待入职统计
     * */
    Map countAct();
    /**
     * 员工类型统计
     * */
    List<Map> countEmpState();
    /**
     * 合同到期提醒
     * */
    Map countContract();
    /**
     * 加班审批
     * */
    Map countOvertime();
    /**
     * 离职审批
     * */
    Map countDimission();
    /**
     * 休假审批
     * */
    Map countLeave();




    ////////////////////////////////////////////////////////////////
    /**
     * 查看培训课程
     * */
    PageInfo<Map> queryAllkec(Kecheng kecheng, Integer pageNum);
    /**
     * 查看培训老师
     * */
    List<Map> queryAllket(Keteacher keteacher);
    /**
     * 课程审批
     * */
    void updatekec(Kecheng kecheng);
    /**
     * 员工培训记录
     * */
    PageInfo<Map> queryAllkee(Integer empid, Integer kestate, Integer pageNum);
    /**
     * 查询培训课程员工
     * */
    List<Map> queryAllkeemp(Integer keempid, Integer keid, Integer keokstate, String empnumber);
    /**
     * 员工培训打分
     * */
    void dafen(Keemp keemp);
    /**
     * 剩余打分人数
     * */
    Map shengyu(Integer keid);
    /**
     * 培训打分完成
     * */
    void wancheng(Kecheng kecheng);




}
