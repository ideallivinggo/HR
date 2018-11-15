package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.*;
import com.aaa.rzhr.service.ContractService;
import com.aaa.rzhr.service.DeptService;
import com.aaa.rzhr.service.EmpRoleService;
import com.aaa.rzhr.util.LayuiFy;
import com.aaa.rzhr.util.layuiUtil;
import com.alibaba.fastjson.JSONArray;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author YQL
 * @date 2018/10/24 23:13
 */
@Controller
public class ContractController {
    @Autowired
    ContractService contractService;
    @Autowired
    DeptService deptService;
    @Autowired
    EmpRoleService empRoleService;
    /**
     * 添加员工(入职)
     * */
    @RequestMapping("AddEmpYqx")
    @ResponseBody
    public String AddEmpYqx(Emp emp){
        String salt = new SecureRandomNumberGenerator().nextBytes().toString();
        int times = 2;
        String algorithmName = "md5";
        String encodedPassword = new SimpleHash(algorithmName, emp.getPassword(), salt, times).toString();
        emp.setPassword(encodedPassword);
        emp.setSalt(salt);
        contractService.AddEmpYqx(emp);
        /*修改面试状态（默认2为已入职）*/
        contractService.UpdateActivationYqx(emp.getEmpnumber());
        /*钉钉*/
        Empdingd empdingd = new Empdingd();
        empdingd.setEddnumber(emp.getEmpnumber());
        contractService.AddEmpdingdYqx(empdingd);
        /*中间表*/
        Emp_Empdingd emp_empdingd = new Emp_Empdingd();
        emp_empdingd.setEmpid(emp.getEmpid());
        emp_empdingd.setEddid(empdingd.getEddid());
        contractService.AddEmp_EmpdingdYqx(emp_empdingd);
        String endroidstr="4,";
        String[] endroidstrsplit = endroidstr.split(",");
        List<String> nowroid= Arrays.asList(endroidstrsplit);
            empRoleService.saveEmpRole(nowroid,emp.getEmpid());


        return "true";
    }
    /**
     * 职位查询
     * */
    @RequestMapping("QueryPosition")
    @ResponseBody
    public List<Map> QueryPosition(HttpServletRequest request){
        List<Map> list = contractService.QueryPosition();
        HttpSession session = request.getSession();
        session.setAttribute("list",list.get(0));
        return list;
    }
    /**
     * 修改员工（入职添加）
     * */
    @RequestMapping("UpdateEmpYu")
    @ResponseBody
    public String UpdateEmpYu(Emp emp){
        contractService.UpdateEmpYu(emp);
        return "true";
    }
    /**
     * QaddEmpYqx
     * */
    @RequestMapping("QaddEmpYqx")
    @ResponseBody
    public List<Map> QaddEmpYqx(String actname,String actnumber,String sex,String phone,String emali,String actpwd,HttpServletRequest request){
        List<Map> listMap = new ArrayList<Map>();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("actname", actname);
        map.put("actnumber", actnumber);
        map.put("sex",sex);
        map.put("phone",phone);
        map.put("emali",emali);
        map.put("actpwd",actpwd);
        listMap .add(map);
        HttpSession session = request.getSession();
        session.setAttribute("list",listMap.get(0));
        return listMap;
    }
    /**
     * 查询面试成功(简历)
     * */
    @RequestMapping("QueryResumeYqx")
    @ResponseBody
    public LayuiFy QueryResumeYqx(String actname,Integer limit, Integer page){

        return contractService.QueryResumeYqx(actname,limit,page);
    }
    /**
     * 员工员工驳回，离职
     * */
    @RequestMapping("UpdateEmpState")
    @ResponseBody
    public String UpdateEmpState(Emp emp){
        contractService.UpdateEmpState(emp);
        return "true";
    }

    /**
     *入职查询
     * */
    @RequestMapping("QueryEmpState")
    @ResponseBody
    public LayuiFy QueryEmpState(String empname,Integer limit, Integer page){
        return contractService.QueryEmpState(empname,limit,page);
    }
    /**
     * 转正查询
     * */
    @RequestMapping("QueryEmpStateTurn")
    @ResponseBody
    public LayuiFy QueryEmpStateTurn(String empname,Integer limit, Integer page){
        return contractService.QueryEmpStateTurn(empname,limit,page);
    }
    /**
     * 离职查询
     * */
    @RequestMapping("QueryEmpStateDimission")
    @ResponseBody
    public LayuiFy QueryEmpStateDimission(String empname,Integer limit, Integer page){
        return contractService.QueryEmpStateTurn(empname,limit,page);
    }



    @RequestMapping("QueryEmpStateName")
    @ResponseBody
    public List<Map> QueryEmpStateName(HttpServletRequest request){
        List<Map> list = contractService.QueryEmpStateName();
        HttpSession session = request.getSession();
        session.setAttribute("list",list);
        return list;
    }
    /**
     * 查询合同
     * */
    @RequestMapping("QueryContractYqx")
    @ResponseBody
    public LayuiFy QueryContractYqx(String contypeid,String empname,String conexpire,String conover,Integer limit,Integer page){
        return contractService.QueryContractYqx(contypeid,empname,conexpire,conover,limit,page);
    }
    /**实习合同*/
    @RequestMapping("QueryConPracticeDataYqx")
    @ResponseBody
    public LayuiFy QueryConPracticeDataYqx(String contypeid,String empname,String conover,Integer limit,Integer page){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, -7);
        date = calendar.getTime();
        String conexpire = sdf.format(date);
        return contractService.QueryContractYqx(contypeid,empname,conexpire,conover,limit,page);
    }
    /**劳动合同*/
    @RequestMapping("QueryContractDataYqx")
    @ResponseBody
    public LayuiFy QueryContractDataYqx(String contypeid,String empname,String conexpire,Integer limit,Integer page){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, -7);
        date = calendar.getTime();
        String conover = sdf.format(date);
        return contractService.QueryContractYqx(contypeid,empname,conexpire,conover,limit,page);
    }
    /**
     *  添加合同
     *  */
    @RequestMapping("AddContractYqx")
    @ResponseBody
    public String AddContractYqx(Contract contract,String qsrc){
        System.out.println(qsrc);
        contract.setConcontent(qsrc);
        contractService.AddContractYqx(contract);
        return "true";
    }
    /**
     * 上传合同图片
     * */
    /**申请请假添加*/
    @RequestMapping(value = "/uploadContractYqx", method = RequestMethod.POST)
    @ResponseBody
    public String upload(HttpServletRequest req, @RequestParam("file") MultipartFile file, Model m) throws IOException {
            String fileName = System.currentTimeMillis()+file.getOriginalFilename();
            String destFileName=req.getServletContext().getRealPath("")+"upload"+ File.separator+fileName;
            File destFile = new File(destFileName);
            destFile.getParentFile().mkdirs();
            file.transferTo(destFile);
            System.out.println(fileName);
            m.addAttribute("fileName",fileName);
            String aa="upload/"+fileName;
            String str = "{\"code\": 0,\"msg\": \"\",\"data\": {\"src\":\"" + aa + "\"}}";
        System.out.println(aa);
        System.out.println(str);
            return str;
    }
    /**
     * 修改合同
     * */
    @RequestMapping("UpdateContractYqx")
    @ResponseBody
    public String UpdateContractYqx(Contract contract,String qsrc){
        System.out.println("修改合同");
        System.out.println(qsrc);
        contract.setConcontent(qsrc);
        contractService.UpdateContractYqx(contract);
        return "true";
    }
    /**
     * 添加教育经历
     * */
    @RequestMapping("AddEducationYqx")
    @ResponseBody
    public String AddEducationYqx(Education_Experience education,String Uedu){
        education.setCertificate(Uedu);
        contractService.AddEducationYqx(education);
        return "true";
    }
    /**
     * 修改教育经历
     * */
    @RequestMapping("UpdateEducationYqx")
    @ResponseBody
    public String UpdateEducationYqx(Education_Experience education,String Uedu){
        education.setCertificate(Uedu);
        contractService.UpdateEducationYqx(education);
        return "true";
    }
    /**
     * 添加工作经历
     * */
    @RequestMapping("AddWorkYqx")
    @ResponseBody
    public String AddWorkYqx(Work_Experience work){
        contractService.AddWorkYqx(work);
        return "true";
    }
    /**
     * 修改工作经历
     * */
    @RequestMapping("UpdateWorkYqx")
    @ResponseBody
    public String UpdateWorkYqx(Work_Experience work){
        contractService.UpdateWorkYqx(work);
        return "true";
    }
    /**
     * 添加社保福利
     * */
    @RequestMapping("AddSocialYqx")
    @ResponseBody
    public String AddSocialYqx(Social_Benefits social){
        contractService.AddSocialYqx(social);
        return "true";
    }
    /**
     * 修改社保福利
     * */
    @RequestMapping("UpdateSociaYqx")
    @ResponseBody
    public String UpdateSociaYqx(Social_Benefits social){
        contractService.UpdateSociaYqx(social);
        return "true";
    }
    /**
     * 分组查询部门
     * */

    @RequestMapping("QueryGroupYqx")
    @ResponseBody
    public List<Map> QueryGroupYqx(Integer deptid){
        Dept dept = new Dept();
        dept.setDeptid(deptid);
        List<Map> list = contractService.QueryGroupYqx(dept);
        return list;
    }
    /**
     * 查询员工
     * */
    @RequestMapping("QueryEmpSelectYqx")
    @ResponseBody
    public List<Map> QueryEmpSelectYqx() {
        return contractService.QueryEmpSelectYqx();
    }
    /**
     * 添加部门，部门经理
     * */
    @RequestMapping("AddDeptManageYqx")
    @ResponseBody
    public String AddDeptManageYqx(Integer empid,String deptName,Integer deptnum) {
        Dept dept = new Dept();
        dept.setDeptname(deptName);
        dept.setDeptnum(deptnum);
        contractService.AddDeptManageYqx(dept);
        Emp emp = new Emp();
        emp.setEmpid(empid);
        emp.setDeptid(dept.getDeptid());
        emp.setPoid(1);
        contractService.UpdateEmpManageYqx(emp);
        return "true";
    }
    /**
     * 修改部门
     * */
    @RequestMapping("UpdateDeptYqx")
    @ResponseBody
    public String UpdateDeptYqx(Integer deptid,Integer empid,String deptname,Integer deptnum,Integer id){
        Dept dept = new Dept();
        dept.setDeptid(deptid);
        dept.setDeptnum(deptnum);
        dept.setDeptname(deptname);
        contractService.UpdateDeptYqx(dept);
        Emp emp = new Emp();
        emp.setEmpid(id);
        emp.setDeptid(dept.getDeptid());
        emp.setPoid(1);
        contractService.UpdateEmpManageYqx(emp);
        emp.setEmpid(empid);
        emp.setPoid(2);
        contractService.UpdateEmpManageYqx(emp);
        return "true";
    }
    /**
     * 查询转正申请
     * */
    @RequestMapping("QueryZhuanzhengYqx")
    @ResponseBody
    public LayuiFy QueryZhuanzhengYqx(Emp emp,Integer limit, Integer page){
        return contractService.QueryZhuanzhengYqx(emp,limit,page);
    }
    /**
     * 查询员工所有
     * */
    @RequestMapping("QueryEmpAllYqx")
    @ResponseBody
    public List<Map> QueryEmpAllYqx(Integer empid,HttpServletRequest request) {
        Emp emp = new Emp();
        emp.setEmpid(empid);
        List<Map> list = contractService.QueryEmpAllYqx(emp);
        HttpSession session = request.getSession();
        session.setAttribute("list",list.get(0));
        return list;
    }
    /**
     * 转正管理 模糊查询
     * */
    @RequestMapping("QueryEmpAllIfYqx")
    @ResponseBody
    public LayuiFy QueryEmpAllIfYqx(String empname,Integer limit, Integer page) {
        Emp emp = new Emp();
        emp.setEmpname(empname);
        return contractService.QueryZhuanzhengYqx(emp,limit,page);
    }

    /**
     * 转正管理 修改员工入职状态 已转正
     * */
    @RequestMapping("UpdateTurnYqx")
    @ResponseBody
    public String UpdateTurnYqx(String name,String data,Integer empid,Integer shenid){
        Emp emp = new Emp();
        emp.setEmpid(empid);
        emp.setEmpstateid(2);
        contractService.UpdateEmpStateTurn(emp);
        Zhuanzheng zhuanzheng = new Zhuanzheng();
        zhuanzheng.setShenid(shenid);
        zhuanzheng.setShenqingstate(4);
        zhuanzheng.setRenshi(name);
        zhuanzheng.setRenshitiem(data);
        contractService.UpdateZhuanzhengYqx(zhuanzheng);
        return "true";
    }
    /**
     * 转正驳回
     * */
    @RequestMapping("UpdateTurnDownYqx")
    @ResponseBody
    public String UpdateTurnDownYqx(Integer shenid){
        Zhuanzheng zhuanzheng = new Zhuanzheng();
        zhuanzheng.setShenid(shenid);
        zhuanzheng.setShenqingstate(2);
        contractService.UpdateZhuanzhengYqx(zhuanzheng);
        return "true";
    }
    /**
     * 离职管理 查询离职申请
     * */
    @RequestMapping("QueryApplyDimissionYqx")
    @ResponseBody
    public LayuiFy QueryApplyDimissionYqx(Emp emp,Integer limit, Integer page){
        return contractService.QueryApplyDimissionYqx(emp,limit,page);
    }
    /**
     * 离职管理 模糊查询
     * */
    @RequestMapping("QueryApplyDimissionIfYqx")
    @ResponseBody
    public LayuiFy QueryApplyDimissionIfYqx(String empname,Integer limit, Integer page){
        Emp emp = new Emp();
        emp.setEmpname(empname);
        return contractService.QueryApplyDimissionYqx(emp,limit,page);
    }
    /**
     * 离职管理 查询详情
     * */
    @RequestMapping("QueryEmpAllApplyYqx")
    @ResponseBody
    public List<Map> QueryEmpAllApplyYqx(Integer empid,HttpServletRequest request) {
        Emp emp = new Emp();
        emp.setEmpid(empid);
        List<Map> list = contractService.QueryEmpAllApplyYqx(emp);
        HttpSession session = request.getSession();
        session.setAttribute("list",list.get(0));
        return list;
    }
    /**
     * 离职管理 修改员工入职状态 已离职
     * */
    @RequestMapping("UpdateApplyDimissionYqx")
    @ResponseBody
    public String UpdateApplyDimissionYqx(String name,String data,Integer empid,Integer dimid){
        Emp emp = new Emp();
        emp.setEmpid(empid);
        emp.setEmpstateid(4);
        contractService.UpdateEmpStateTurn(emp);
        Apply_Dimission apply_dimission = new Apply_Dimission();
        apply_dimission.setDimid(dimid);
        apply_dimission.setDimstate(4);
        apply_dimission.setRenshishen(name);
        apply_dimission.setRenshishendate(data);
        contractService.UpdateApplyDimissionYqx(apply_dimission);
        empRoleService.delEmpRoleByempid(empid);
        return "true";
    }
    /**
     * 离职驳回
     * */
    @RequestMapping("UpdateApplyYqx")
    @ResponseBody
    public String UpdateApplyYqx(Integer dimid){
        Apply_Dimission apply_dimission = new Apply_Dimission();
        apply_dimission.setDimid(dimid);
        apply_dimission.setDimstate(2);
        contractService.UpdateApplyDimissionYqx(apply_dimission);
        return "true";
    }
    /**
     * 请假管理 查询 详情 修改
     * */
    @RequestMapping("QueryLeaveYqx")
    @ResponseBody
    public LayuiFy QueryLeaveYqx(String empname,Integer limit, Integer page){
        Emp emp = new Emp();
        emp.setEmpname(empname);
        return contractService.QueryLeaveYqx(emp,limit,page);
    }
    /**
     * 请假管理 详情
     * */
    @RequestMapping("QueryLeaveDYqx")
    @ResponseBody
    public List<Map> QueryLeaveDYqx(Integer empid,HttpServletRequest request){
        Emp emp = new Emp();
        emp.setEmpid(empid);
        List<Map> list = contractService.QueryLeaveDYqx(emp);
        HttpSession session = request.getSession();
        session.setAttribute("list",list.get(0));
        return list;
    }
    /**
     * 请假管理 修改
     * */
    @RequestMapping("UpdateLeaveYqx")
    @ResponseBody
    public String UpdateLeaveYqx(String name,String data,Integer leaid) {
        Apply_Leave apply_leave= new Apply_Leave();
        apply_leave.setLeaid(leaid);
        apply_leave.setLeasate(4);
        apply_leave.setRenshishen(name);
        apply_leave.setRenshishendate(data);
        contractService.UpdateLeaveYqx(apply_leave);
        return "true";
    }
    /**
     *加班管理 查询 详情 修改
     * */
    @RequestMapping("QueryOvertimeYqx")
    @ResponseBody
    public LayuiFy QueryOvertimeYqx(String empname,Integer limit, Integer page){
        Emp emp = new Emp();
        emp.setEmpname(empname);
        return contractService.QueryOvertimeYqx(emp,limit,page);
    }
    /**
     * 请假管理 详情
     * */
    @RequestMapping("QueryOvertimeDYqx")
    @ResponseBody
    public List<Map> QueryOvertimeDYqx(Integer empid,HttpServletRequest request){
        Emp emp = new Emp();
        emp.setEmpid(empid);
        List<Map> list = contractService.QueryOvertimeDYqx(emp);
        HttpSession session = request.getSession();
        session.setAttribute("list",list.get(0));
        return list;
    }
    /**
     * 请假管理 修改
     * */
    @RequestMapping("UpdateOvertimeYqx")
    @ResponseBody
    public String UpdateOvertimeYqx(String name,String data,Integer apovid) {
        Apply_Overtime apply_overtime = new Apply_Overtime();
        apply_overtime.setApovid(apovid);
        apply_overtime.setApovstate(4);
        apply_overtime.setRenshishen(name);
        apply_overtime.setRenshishendate(data);
        contractService.UpdateOvertimeYqx(apply_overtime);
        return "true";
    }
    /**
     *出差管理 查询 详情 修改
     * */
    @RequestMapping("QueryTravelYqx")
    @ResponseBody
    public LayuiFy QueryTravelYqx(String empname,Integer limit, Integer page){
        Emp emp = new Emp();
        emp.setEmpname(empname);
        return contractService.QueryTravelYqx(emp,limit,page);
    }
    /**
     * 出差管理 详情
     * */
    @RequestMapping("QueryTravelDYqx")
    @ResponseBody
    public List<Map> QueryTravelDYqx(Integer empid,HttpServletRequest request){
        Emp emp = new Emp();
        emp.setEmpid(empid);
        List<Map> list = contractService.QueryTravelDYqx(emp);
        HttpSession session = request.getSession();
        session.setAttribute("list",list.get(0));
        return list;
    }
    /**
     * 出差管理 修改
     * */
    @RequestMapping("UpdateTravelYqx")
    @ResponseBody
    public String UpdateTravelYqx(String name,String data,Integer offid) {
        Apply_Office apply_Office = new Apply_Office();
        apply_Office.setOffid(offid);
        apply_Office.setOffstate(4);
        apply_Office.setRenshishen(name);
        apply_Office.setRenshishendate(data);
        contractService.UpdateTravelYqx(apply_Office);
        return "true";
    }
}
