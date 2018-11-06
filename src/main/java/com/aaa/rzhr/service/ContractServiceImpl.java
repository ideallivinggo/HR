package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.ContractMapperYqx;
import com.aaa.rzhr.pojo.*;
import com.aaa.rzhr.util.LayuiFy;
import com.aaa.rzhr.util.layuiPage;
import com.aaa.rzhr.util.layuiUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author YQL
 * @date 2018/10/24 23:03
 */
@SuppressWarnings("ALL")
@Service
public class ContractServiceImpl implements ContractService {
    @Autowired
    private ContractMapperYqx mapperYqx;

    /**
     * 查询合同
     * */
    @Override
    public LayuiFy QueryContractYqx(String contypeid,Integer limit,Integer page) {
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryContractYqx(contypeid),limit,page);
        return layui;
    }
    /**
     * 添加合同
     * */
    @Override
    public void AddContractYqx(Contract contract) {
        mapperYqx.AddContractYqx(contract);
    }
    /**
     * 修改合同
     * */
    @Override
    public void UpdateContractYqx(Contract contract) {
        mapperYqx.UpdateContractYqx(contract);
    }
    /**
     * 添加教育经历
     * */
    @Override
    public void AddEducationYqx(Education_Experience education) {
        mapperYqx.AddEducationYqx(education);
    }
    /**
     * 修改教育经历
     * */
    @Override
    public void UpdateEducationYqx(Education_Experience education) {
        mapperYqx.UpdateEducationYqx(education);
    }
    /**
     * 添加工作经历
     * */
    @Override
    public void AddWorkYqx(Work_Experience work) {
        mapperYqx.AddWorkYqx(work);
    }
    /**
     * 修改工作经历
     * */
    @Override
    public void UpdateWorkYqx(Work_Experience work) {
        mapperYqx.UpdateWorkYqx(work);
    }
    /**
     * 添加社保福利
     * */
    @Override
    public void AddSocialYqx(Social_Benefits social) {
        mapperYqx.AddSocialYqx(social);
    }
    /**
     * 修改社保福利
     * */
    @Override
    public void UpdateSociaYqx(Social_Benefits social) {
        mapperYqx.UpdateSociaYqx(social);
    }
    /**
     *入职，转正，离职
     * */
    @Override
    public LayuiFy QueryEmpState(String empname,Integer limit, Integer page) {
        System.out.println(empname+"=================================");
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryEmpState(empname,"3"),limit,page);
        return layui;
    }
/**
 * 转正查询
 * */
    @Override
    public LayuiFy QueryEmpStateTurn(String empname, Integer limit, Integer page) {
        System.out.println(empname+"-----------------------------------------");
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryEmpState(empname,"1"),limit,page);
        return layui;
    }
    /**
     * 离职查询
     * */
/*    @Override
    public LayuiFy QueryEmpStateDimission(String empname, Integer limit, Integer page) {
        System.out.println("===================----------------------==================-000000000000000000");
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryEmpState(empname,"4"),limit,page);
        return layui;
    }*/



    @Override
    public List<Map> QueryEmpStateName() {
        return mapperYqx.QueryStateName();
    }
    /**
     * 员工驳回，离职
     * */
    @Override
    public void UpdateEmpState(Emp emp) {
        mapperYqx.UpdateEmpState(emp);
    }
    /**
     * 员工转正
     * */
    @Override
    public void UpdateEmpStateTurn(Emp emp) {
        mapperYqx.UpdateEmpStateTurn(emp);
    }
    /**
     * 查询面试成功(简历)
     * */
    @Override
    public LayuiFy QueryResumeYqx(Integer limit, Integer page) {
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryResumeYqx(),limit,page);
        return layui;
    }
    /**
     * 修改员工（入职添加）
     * */
    @Override
    public void UpdateEmpYu(Emp emp) {
        mapperYqx.UpdateEmpYu(emp);
    }
    /**
     * 职位查询
     * */
    @Override
    public List<Map> QueryPosition() {
        return mapperYqx.QueryPosition();
    }
    /**
     * 添加员工
     * */
    @Override
    public void AddEmpYqx(Emp emp) {
        mapperYqx.AddEmpYqx(emp);
    }
    /**
     * 修改面试状态（默认2为已入职）
     * */
    @Override
    public void UpdateActivationYqx(String actnumber) {
        System.out.println(actnumber+"kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
        mapperYqx.UpdateActivationYqx(actnumber);
    }
}
