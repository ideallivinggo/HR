package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.ContractMapperYqx;
import com.aaa.rzhr.pojo.Contract;
import com.aaa.rzhr.pojo.Education_Experience;
import com.aaa.rzhr.pojo.Social_Benefits;
import com.aaa.rzhr.pojo.Work_Experience;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
