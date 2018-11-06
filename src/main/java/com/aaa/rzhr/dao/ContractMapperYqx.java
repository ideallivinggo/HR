package com.aaa.rzhr.dao;

import com.aaa.rzhr.pojo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author YQL
 * @date 2018/10/23 15:45
 */
@Mapper
public interface ContractMapperYqx {

    /**
     * 修改员工（入职添加）
     * */
    public void UpdateEmpYu(Emp emp);
    /**
     * 查询合同
     * */
    public List<Map> QueryContractYqx(@Param("contypeid") String contypeid);
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
     * 入职，转正，离职查询
     * */
    public List<Map> QueryEmpState(@Param("empname") String empname, @Param("empstateid") String empstateid);
    public List<Map> QueryStateName();
     /**
     * 员工入职
     * */
    public void UpdateEmpState(Emp emp);
    /**
     * 员工转正
     * */
    public void UpdateEmpStateTurn(Emp emp);
    /**
     * 查询面试成功(简历)
     * */
    public List<Map> QueryResumeYqx();
    /**
     * 职位查询
     * */
    public List<Map> QueryPosition();
    /**
     * 添加员工
     * */
    public void AddEmpYqx(Emp emp);
    /**
     * 修改面试状态（默认1为已入职）
     * */
    public void UpdateActivationYqx(@Param("actnumber") String actnumber);
}
