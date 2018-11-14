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
    public List<Map> QueryContractYqx(@Param("contypeid") String contypeid,@Param("empname") String empname,@Param("conexpire") String conexpire,@Param("conover") String conover);
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
     * 查询面试成功(简历)
     * */
    public List<Map> QueryResumeYqx(@Param("actname") String actname);
    /**
     * 职位查询
     * */
    public List<Map> QueryPosition();
    /**
     * 添加员工
     * */
    public int AddEmpYqx(Emp emp);
    /**
     * 钉钉
     * */
    public int AddEmpdingdYqx(Empdingd empdingd);
    public void AddEmp_EmpdingdYqx(Emp_Empdingd emp_empdingd);
    /**
     * 修改面试状态（默认1为已入职）
     * */
    public void UpdateActivationYqx(@Param("actnumber") String actnumber);
    /**
     * 分组查询部门
     * */
    public List<Map> QueryGroupYqx(Dept dept);
    /**
     * 查询员工
     * */
    public List<Map> QueryEmpSelectYqx();
    /**
     * 添加部门
     * */
    public int AddDeptManageYqx(Dept dept);
    /**
     * 修改员工经理
     * */
    public void UpdateEmpManageYqx(Emp emp);
    /**
     * 修改部门
     * */
    public void UpdateDeptYqx(Dept dept);


    /**
     * 转正管理 查询 详情 已转正 已通过
     * */
    public List<Map> QueryZhuanzhengYqx(Emp emp);
    public List<Map> QueryEmpAllYqx(Emp emp);
    public void UpdateEmpStateTurn(Emp emp);
    public void UpdateZhuanzhengYqx(Zhuanzheng zhuanzheng);
    /**
     * 离职管理 查询 详情 已离职（已转正同上） 已通过
     * */
    public List<Map> QueryApplyDimissionYqx(Emp emp);
    public List<Map> QueryEmpAllApplyYqx(Emp emp);
    public void UpdateApplyDimissionYqx(Apply_Dimission apply_dimission);
    /**
     * 请假管理 查询 详情 修改
     * */
    public List<Map> QueryLeaveYqx(Emp emp);
    public void UpdateLeaveYqx(Apply_Leave apply_leave);
    /**
     * 加班管理 查询 详情 修改
     * */
    public List<Map> QueryOvertimeYqx(Emp emp);
    public void UpdateOvertimeYqx(Apply_Overtime apply_overtime);
    /**
     * 出差管理 查询 详情 修改
     * */
    public List<Map> QueryTravelYqx(Emp emp);
    public void UpdateTravelYqx(Apply_Office apply_office);

}
