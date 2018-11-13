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
    public PageInfo<Map> queryAllRec(Recruitment recruitment,Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Map> list=yapplyMapper.queryAllRec(recruitment);
        PageInfo<Map> info = new PageInfo<Map>(list);
        return info;
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


    @Override
    public void updateResOne(Integer resstate, String s) {
        yapplyMapper.updateResOne(resstate, s);
    }

    //添加第一次面试
    @Override
    public void addIntone(Interviewone interviewone, Integer resstate, String s) {
        yapplyMapper.addIntone(interviewone);
        yapplyMapper.updateResOne(resstate, s);
    }

    //分页查看第一次面试表
    @Override
    public  PageInfo<Map> queryAllInte(Interviewone interviewone, Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Map> list=yapplyMapper.queryAllInte(interviewone);
        PageInfo<Map> info = new PageInfo<Map>(list);
        return info;
    }


    //清除过期和不过的面试,修改简历成状态3（回收站）
    @Override
    public void updateInte(Interviewone interviewone,Integer resstate, String s) {
        yapplyMapper.updateInte(interviewone);
        yapplyMapper.updateResOne(resstate,s);
    }

    //通过后添加第二次面试和删除第一次面试状态4（第一次面试回收站）
    @Override
    public void addIntTwo(Interviewtwo Interviewtwo, Interviewone interviewone) {
        yapplyMapper.addIntTwo(Interviewtwo);
        yapplyMapper.updateInte(interviewone);
    }
    //分页查看第二次面试表
    @Override
    public PageInfo<Map> queryAllInteTwo(Interviewtwo interviewtwo, Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Map> list = yapplyMapper.queryAllInteTwo(interviewtwo);
        PageInfo<Map> info = new PageInfo<Map>(list);
        return info;
    }

    @Override
    public void updateInteTwo(Interviewtwo interviewtwo) {
        yapplyMapper.updateInteTwo(interviewtwo);
    }

    @Override
    public void inteTwoPash(Integer intstate, String s) {
        yapplyMapper.inteTwoPash(intstate, s);
    }


    @Override
    public Map queryActID (Integer actid) {
        return yapplyMapper.queryActID(actid);
    }

    @Override
    public String judge(Activation activation) {
        Activation aa=yapplyMapper.judge(activation);
        String pwd="";
        try {
             pwd=aa.getActpwd();
        }catch (java.lang.NullPointerException e){
             pwd ="";

        }


        return pwd;
    }


    @Override
    public void addAct(Activation activation,Interviewtwo interviewtwo) {
        yapplyMapper.addAct(activation);
        yapplyMapper.updateInteTwo(interviewtwo);
    }

    @Override
    public void updateAct(Activation activation) {
        yapplyMapper.updateAct(activation);

    }

    @Override
    public PageInfo<Map> queryAllAct(Activation activation, Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Map> list = yapplyMapper.queryAllAct(activation);
        PageInfo<Map> info = new PageInfo<Map>(list);
        return info;
    }

    @Override
    public void ccAct(Activation activation) {
        yapplyMapper.ccAct(activation);
    }


    @Override
    public Map countAct() {
        return yapplyMapper.countAct();
    }

    @Override
    public List<Map> countEmpState() {
        return yapplyMapper.countEmpState();
    }

    @Override
    public Map countContract() {
        return yapplyMapper.countContract();
    }

    @Override
    public Map countOvertime() {
        return yapplyMapper.countOvertime();
    }

    @Override
    public Map countDimission() {
        return yapplyMapper.countDimission();
    }

    @Override
    public Map countLeave() {
        return yapplyMapper.countLeave();
    }

    @Override
    public Map countKec() {
        return yapplyMapper.countKec();
    }


    @Override
    public PageInfo<Map> queryAllkec(Kecheng kecheng, Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Map> list = yapplyMapper.queryAllkec(kecheng);
        PageInfo<Map> pageInfo = new PageInfo<Map>(list);
        return pageInfo;
    }

    @Override
    public List<Map> queryAllket(Keteacher keteacher) {
        return yapplyMapper.queryAllket(keteacher);
    }


    @Override
    public void updatekec(Kecheng kecheng) {
        yapplyMapper.updatekec(kecheng);
    }

    @Override
    public PageInfo<Map> queryAllkee(Integer empid, Integer kestate, Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Map> list = yapplyMapper.queryAllkee(empid, kestate);
        PageInfo<Map> pageInfo = new PageInfo<Map>(list);
        return pageInfo;
    }

    @Override
    public List<Map> queryAllkeemp(Integer keempid, Integer keid, Integer keokstate, String empnumber) {
        return yapplyMapper.queryAllkeemp(keempid, keid, keokstate,empnumber);
    }

    @Override
    public void dafen(Keemp keemp) {
        yapplyMapper.dafen(keemp);
    }

    @Override
    public Map shengyu(Integer keid) {
        return yapplyMapper.shengyu(keid);
    }

    @Override
    public void wancheng(Kecheng kecheng) {
        yapplyMapper.wancheng(kecheng);
    }


}
