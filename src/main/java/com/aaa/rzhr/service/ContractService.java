package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.Contract;
import com.aaa.rzhr.pojo.Education_Experience;
import com.aaa.rzhr.pojo.Social_Benefits;
import com.aaa.rzhr.pojo.Work_Experience;
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
    public LayuiFy QueryContractYqx(Integer limit,Integer page);
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
    public LayuiFy QueryEmpState(Integer empstateid,Integer limit,Integer page);
    public List<Map> QueryEmpStateName();
}
