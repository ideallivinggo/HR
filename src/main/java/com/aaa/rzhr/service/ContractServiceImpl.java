package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.ContractMapperYqx;
import com.aaa.rzhr.dao.DeptMapper;
import com.aaa.rzhr.pojo.*;
import com.aaa.rzhr.util.LayuiFy;
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
    @Autowired
    private DeptMapper deptMapper;
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
    public LayuiFy QueryResumeYqx(String actname,Integer limit, Integer page) {
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryResumeYqx(actname),limit,page);
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
    public int AddEmpYqx(Emp emp) {
        return mapperYqx.AddEmpYqx(emp);
    }
    /**
     * 钉钉
     * */
    @Override
    public int AddEmpdingdYqx(Empdingd empdingd) {
        return mapperYqx.AddEmpdingdYqx(empdingd);
    }
    @Override
    public void AddEmp_EmpdingdYqx(Emp_Empdingd emp_empdingd) {
        mapperYqx.AddEmp_EmpdingdYqx(emp_empdingd);
    }

    /**
     * 修改面试状态（默认2为已入职）
     * */
    @Override
    public void UpdateActivationYqx(String actnumber) {
        System.out.println(actnumber+"kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
        mapperYqx.UpdateActivationYqx(actnumber);
    }
    /**
     * 分组查询部门
     * */
    @Override
    public List<Map> QueryGroupYqx(Dept dept) {
        List<Map> list1 = mapperYqx.QueryGroupYqx(dept);
        List<Map> list = deptMapper.QueryDeptSelectYqx();
        for(int i = 0; i < list1.size(); i++) {
            list1.get(i).put("roid", list.get(i).get("num"));
        }
        return list1;
    }
    /**
     * 查询员工
     * */
    @Override
    public List<Map> QueryEmpSelectYqx() {
        return mapperYqx.QueryEmpSelectYqx();
    }
/**
 * 添加部门
 * */
    @Override
    public int AddDeptManageYqx(Dept dept) {
        return mapperYqx.AddDeptManageYqx(dept);
    }
    /**
     * 修改员工经理
     * */
    @Override
    public void UpdateEmpManageYqx(Emp emp) {
        mapperYqx.UpdateEmpManageYqx(emp);
    }
    /**
     * 修改部门
     * */
    @Override
    public void UpdateDeptYqx(Dept dept) {
        mapperYqx.UpdateDeptYqx(dept);
    }
    /**
     * 转正管理 查询 详情 已转正 已通过
     * */
    @Override
    public LayuiFy QueryZhuanzhengYqx(Emp emp,Integer limit, Integer page){
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryZhuanzhengYqx(emp),limit,page);
        return layui;
    }
    /**
     * 转正管理 详情
     * */
    @Override
    public List<Map> QueryEmpAllYqx(Emp emp) {
        return mapperYqx.QueryEmpAllYqx(emp);
    }
    /**
     * 转正管理 已通过
     * */
    @Override
    public void UpdateZhuanzhengYqx(Zhuanzheng zhuanzheng) {
        mapperYqx.UpdateZhuanzhengYqx(zhuanzheng);
    }
    /**
     * 离职管理 查询 详情 已离职（已转正同上） 已通过
     * */
    @Override
    public LayuiFy QueryApplyDimissionYqx(Emp emp,Integer limit, Integer page) {
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryApplyDimissionYqx(emp),limit,page);
        return layui;
    }
    /**
     * 离职管理 详情
     * */
    @Override
    public List<Map> QueryEmpAllApplyYqx(Emp emp) {
        return mapperYqx.QueryEmpAllApplyYqx(emp);
    }

    /**
     * 离职管理 已通过
     * */
    @Override
    public void UpdateApplyDimissionYqx(Apply_Dimission apply_dimission) {
        mapperYqx.UpdateApplyDimissionYqx(apply_dimission);
    }
    /**
     * 请假管理 查询 详情 修改
     * */
    @Override
    public LayuiFy QueryLeaveYqx(Emp emp,Integer limit, Integer page){
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryLeaveYqx(emp),limit,page);
        return layui;
    }
    @Override
    public List<Map> QueryLeaveDYqx(Emp emp) {
        return mapperYqx.QueryLeaveYqx(emp);
    }
    @Override
    public void UpdateLeaveYqx(Apply_Leave apply_leave) {
        mapperYqx.UpdateLeaveYqx(apply_leave);
    }
    /**
     *加班管理 查询 详情 修改
     * */
    @Override
    public LayuiFy QueryOvertimeYqx(Emp emp, Integer limit, Integer page) {
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryOvertimeYqx(emp),limit,page);
        return layui;
    }
    /** 详情* */
    @Override
    public List<Map> QueryOvertimeDYqx(Emp emp) {
        return mapperYqx.QueryOvertimeYqx(emp);
    }
    /**修改* */
    @Override
    public void UpdateOvertimeYqx(Apply_Overtime apply_overtime) {
        mapperYqx.UpdateOvertimeYqx(apply_overtime);
    }
    /**
     * 出差管理 查询 详情 修改
     * */
    @Override
    public LayuiFy QueryTravelYqx(Emp emp, Integer limit, Integer page) {
        LayuiFy layui = layuiUtil.getData(mapperYqx.QueryTravelYqx(emp),limit,page);
        return layui;
    }
    @Override
    public List<Map> QueryTravelDYqx(Emp emp) {
        return mapperYqx.QueryTravelYqx(emp);
    }
    @Override
    public void UpdateTravelYqx(Apply_Office apply_Office) {
        mapperYqx.UpdateTravelYqx(apply_Office);
    }
}
