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
     * 修改招聘申请信息
     * */
    void updateRec(Recruitment recruitment);

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












}
