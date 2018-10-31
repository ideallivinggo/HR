package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author YLP
 * @date 2018-10-14 19:45
 */
@Mapper
public interface YapplyMapper {

    /////////////////////////招聘申请//////////////////////////
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
    List<Map> queryAllRec(Recruitment recruitment);
    /**
     * 修改招聘申请信息
     * */
    void updateRec(Recruitment recruitment);
    /**
     * 修改招聘申请信息
     * */

    ///////////////////////////简历///////////////////////////////////
    /**
     * 简历录入entering
     * */
    void addResEntering(Resume resume);
    /**
     * 查看简历信息
     */
    List<Map> queryAllRes(Resume resume);
    /**
     * 晒选简历信息
     */
    void  updateResOne(@Param("resstate") Integer resstate, @Param("s") String s);

    /////////////////////////////第一次面试操作////////////////////////////////
    /**
     * 添加第一次面试
     * */
    void addIntone(Interviewone interviewone);
    /**
     * 查看第一次面试
     * */
    List<Map> queryAllInte(Interviewone interviewone);
    /**
     * 修改第一次面试
     * */
    void updateInte(Interviewone interviewone);

    /////////////////////////////第二次面试操作////////////////////////////////
    /**
     * 通过后添加第二次面试
     * */
    void addIntTwo(Interviewtwo Interviewtwo);
    /**
     * 查看第二次面试
     * */
    List<Map> queryAllInteTwo(Interviewtwo interviewtwo);
    /**
     * 修改第二次面试
     * */
    void updateInteTwo(Interviewtwo interviewtwo);

    //////////////////////////////面试完成推送到人事部选择录取///////////////////////////////
    /**
     * 面试完成推送
     * 接收回复发送邮件录取
     * */
    void inteTwoPash(@Param("intstate") Integer intstate, @Param("s") String s);
    /**
     *添加员工到待入职状态
     * */
    void addEmp (Emp emp);
    /**
     * 获取最大的员工编号
     * */
    Map queryActID (Integer actid);
    /**
     * 录取后添加到员工激活表
     * */
    void addAct (Activation activation);

    //////////////////////////////////////////首页////////////////////////////////////////////////////////

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















}
