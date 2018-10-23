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
    List<Map> queryAllRec(Integer recid);
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
    List<Map> queryOneRes(Resume resume);
    /**
     * 晒选简历信息
     */
    void updateResOne(Integer resstate, String s);
    /**
     * 添加第一次面试
     * */
    void addIntone(Interviewone interviewone);
    /**
     * 查看第一次面试
     * */
    PageInfo<Map> queryAllInte(Interviewone interviewone, Integer pageNum);
    List<Map> queryOneInte(Interviewone interviewone);

    /**
     * 清除过期和不过的面试,修改简历成状态3（简历回收站）
     * */
    void updateInte(Interviewone interviewone, Integer resstate, String s);

    /**
     * 通过后添加第二次面试和删除第一次面试状态4（第一次面试回收站）
     * */
    void addIntTwo(Interviewtwo Interviewtwo, Interviewone interviewone);
    /**
     * 查看第二次面试
     * */
    PageInfo<Map> queryAllInteTwo(Interviewtwo interviewtwo, Integer pageNum);
    List<Map> queryOneInteTwo(Interviewtwo interviewtwo);
    /**
     * 修改第二次面试
     * */
    void updateInteTwo(Interviewtwo interviewtwo);


}
