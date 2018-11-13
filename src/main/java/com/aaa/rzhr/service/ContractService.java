package com.aaa.rzhr.service;

import com.aaa.rzhr.pojo.*;
import com.aaa.rzhr.util.LayuiFy;

import javax.servlet.http.HttpServletRequest;
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
    public LayuiFy QueryResumeYqx(String actname,Integer limit, Integer page);
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
    public int AddEmpYqx(Emp emp);
    /**
     * 钉钉
     * */
    public int AddEmpdingdYqx(Empdingd empdingd);
    public void AddEmp_EmpdingdYqx(Emp_Empdingd emp_empdingd);
    /**
     * 修改面试状态（默认2为已入职）
     * */
    public void UpdateActivationYqx(String actnumber);
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
    public LayuiFy QueryZhuanzhengYqx(Emp emp,Integer limit, Integer page);
    /**
     * 转正管理 详情
     * */
    public List<Map> QueryEmpAllYqx(Emp emp);
    /**
     * 转正管理 已通过
     * */
    public void UpdateZhuanzhengYqx(Zhuanzheng zhuanzheng);
    /**
     * 离职管理 查询 详情 已离职（已转正同上） 已通过
     * */
    public LayuiFy QueryApplyDimissionYqx(Emp emp,Integer limit, Integer page);
    /**
     * 离职管理 详情
     * */
    public List<Map> QueryEmpAllApplyYqx(Emp emp);
    /**
     * 离职管理 已通过
     * */
    public void UpdateApplyDimissionYqx(Apply_Dimission apply_dimission);
    /**
     * 请假管理 查询 详情 修改
     * */
    public LayuiFy QueryLeaveYqx(Emp emp,Integer limit, Integer page);
    public List<Map> QueryLeaveDYqx(Emp emp);
    public void UpdateLeaveYqx(Apply_Leave apply_leave);
    /**
     * 加班管理 查询 详情 修改
     * */
    public LayuiFy QueryOvertimeYqx(Emp emp,Integer limit, Integer page);
    public List<Map> QueryOvertimeDYqx(Emp emp);
    public void UpdateOvertimeYqx(Apply_Overtime apply_overtime);
    /**
     * 出差管理 查询 详情 修改
     * */
    public LayuiFy QueryTravelYqx(Emp emp,Integer limit, Integer page);
    public List<Map> QueryTravelDYqx(Emp emp);
    public void UpdateTravelYqx(Apply_Office apply_Office);
}
