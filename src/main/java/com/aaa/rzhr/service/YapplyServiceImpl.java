package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.YapplyMapper;
import com.aaa.rzhr.pojo.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author YLP
 * @date 2018-10-14 19:48
 */
@Service
@SuppressWarnings("ALL")
public class YapplyServiceImpl implements YapplyService {
    @Autowired
    private YapplyMapper yapplyMapper;


    @Override
    public List<Position> queryAllPos() {
        return yapplyMapper.queryAllPos();
    }

    @Override
    public List<Dept> queryAllDept() {
        return yapplyMapper.queryAllDept();
    }

    @Override
    public List<Emp> queryAllEmp() {
        return yapplyMapper.queryAllEmp();
    }

    @Override
    public void addRec(Recruitment recruitment) {
        yapplyMapper.addRec(recruitment);
    }

    @Override
    public List<Map> queryAllRec(Integer recid) {
        return yapplyMapper.queryAllRec(recid);
    }

    @Override
    public void updateRec(Recruitment recruitment) {
        yapplyMapper.updateRec(recruitment);
    }

    @Override
    public void addResEntering(Resume resume) {
        yapplyMapper.addResEntering(resume);
    }

    @Override
    public PageInfo<Map> queryAllRes(Resume resume,Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Map> list=yapplyMapper.queryAllRes(resume);
        PageInfo<Map> info = new PageInfo<Map>(list);
        return info;
    }

    //查看单个
    @Override
    public List<Map> queryOneRes(Resume resume) {
        return yapplyMapper.queryAllRes(resume);
    }


    @Override
    public void updateResOne(Integer resstate, String s) {
        yapplyMapper.updateResOne(resstate, s);
    }

    @Override
    public void addIntone(Interviewone interviewone) {
        yapplyMapper.addIntone(interviewone);
    }

    @Override
    public  PageInfo<Map> queryAllInte(Interviewone interviewone, Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Map> list=yapplyMapper.queryAllInte(interviewone);
        PageInfo<Map> info = new PageInfo<Map>(list);
        return info;
    }
    //查看单个
    @Override
    public List<Map> queryOneInte(Interviewone interviewone) {
        return yapplyMapper.queryAllInte(interviewone);
    }

    @Override
    public void updateInte(Interviewone interviewone,Integer resstate, String s) {
        yapplyMapper.updateInte(interviewone);
        yapplyMapper.updateResOne(resstate,s);
    }

}
