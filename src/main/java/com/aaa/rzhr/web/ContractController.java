package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.*;
import com.aaa.rzhr.service.ContractService;
import com.aaa.rzhr.util.LayuiFy;
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
import java.util.*;

/**
 * @author YQL
 * @date 2018/10/24 23:13
 */
@Controller
public class ContractController {
    @Autowired
    ContractService contractService;

    /**
     * 添加员工
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
    public LayuiFy QueryResumeYqx(Integer limit, Integer page){
        return contractService.QueryResumeYqx(limit,page);
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
     * 员工转正
     * */
    @RequestMapping("UpdateEmpStateTurn")
    @ResponseBody
    public String UpdateEmpStateTurn(Emp emp){
        contractService.UpdateEmpStateTurn(emp);
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
        System.out.println("离职查询======"+limit+"bbbbbb"+page+"================================");
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
    public LayuiFy QueryContractYqx(String contypeid,Integer limit,Integer page){
        System.out.println(limit+"dddddddddddddddddddddd"+contypeid);
        return contractService.QueryContractYqx(contypeid,limit,page);
    }
    /**
     *  添加合同
     *  */
    @RequestMapping("AddContractYqx")
    @ResponseBody
    public String AddContractYqx(Contract contract,String qsrc){
        System.out.println(contract.getEmpid()+"==============================================");
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
}
