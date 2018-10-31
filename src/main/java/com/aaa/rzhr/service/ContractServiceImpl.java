package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.ContractMapperYqx;
import com.aaa.rzhr.pojo.Contract;
import com.aaa.rzhr.pojo.Education_Experience;
import com.aaa.rzhr.pojo.Social_Benefits;
import com.aaa.rzhr.pojo.Work_Experience;
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
    public LayuiFy QueryContractYqx(Integer limit,Integer page) {
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryContractYqx(),limit,page);
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
    public LayuiFy QueryEmpState(Integer empstateid,Integer limit, Integer page) {
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryEmpState(empstateid),limit,page);
        return layui;
    }
    @Override
    public List<Map> QueryEmpStateName() {
        return mapperYqx.QueryStateName();
    }
}
