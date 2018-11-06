package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.*;
import com.aaa.rzhr.util.LayuiFy;
import com.aaa.rzhr.util.layuiPage;

import java.util.List;
import java.util.Map;

/**
 * @author YQL
 * @date 2018/10/24 23:02
 */
public interface ContractService {
    /**
     * 查询合同
     * */
    public LayuiFy QueryContractYqx(String contypeid, Integer limit, Integer page);
    /**
     * 添加合同
     */
    public void AddContractYqx(Contract contract);
    /**
     * 修改合同
     * */
    public  void UpdateContractYqx(Contract contract);
    /**
     * 添加教育经历
     * */
    public void AddEducationYqx(Education_Experience education);
    /**
     * 修改教育经历
     * */
    public void UpdateEducationYqx(Education_Experience education);
    /**
     * 添加工作经历
     * */
    public void AddWorkYqx(Work_Experience work);
    /**
     * 修改工作经历
     * */
    public void UpdateWorkYqx(Work_Experience work);
    /**
     * 添加社保福利
     * */
    public void AddSocialYqx(Social_Benefits social);
    /**
     * 修改社保福利
     * */
    public void UpdateSociaYqx(Social_Benefits social);
    /**
     *入职，转正，离职
     * */
    public LayuiFy QueryEmpState(String empname, Integer limit, Integer page);
    /**
     * 转正查询
     * */
    public LayuiFy QueryEmpStateTurn(String empname, Integer limit, Integer page);
    /**
     * 离职查询
     * */
/*    public LayuiFy QueryEmpStateDimission(String empname,Integer limit,Integer page);*/

    public List<Map> QueryEmpStateName();
    /**
     * 员工驳回，离职
     * */
    public void UpdateEmpState(Emp emp);
    /**
     * 员工转正
     * */
    public void UpdateEmpStateTurn(Emp emp);
    /**
     * 查询面试成功(简历)
     * */
    public LayuiFy QueryResumeYqx(Integer limit, Integer page);
    /**
     * 修改员工（入职添加）
     * */
    public void UpdateEmpYu(Emp emp);
    /**
     * 职位查询
     * */
    public List<Map> QueryPosition();
    /**
     * 添加员工
     * */
    public void AddEmpYqx(Emp emp);
    /**
     * 修改面试状态（默认2为已入职）
     * */
    public void UpdateActivationYqx(String actnumber);
}
