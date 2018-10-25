package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.Contract;
import com.aaa.rzhr.pojo.Education_Experience;
import com.aaa.rzhr.pojo.Social_Benefits;
import com.aaa.rzhr.pojo.Work_Experience;
import com.aaa.rzhr.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author YQL
 * @date 2018/10/24 23:13
 */
@Controller
public class ContractController {
    @Autowired
    ContractService contractService;
    /**
     *  添加合同
     *  */
    @RequestMapping("AddContractYqx")
    public String AddContractYqx(Contract contract){
        contractService.AddContractYqx(contract);
        return "true";
    }
    /**
     * 修改合同
     * */
    @RequestMapping("UpdateContractYqx")
    @ResponseBody
    public String UpdateContractYqx(Contract contract){
        System.out.println("修改合同");
        contractService.UpdateContractYqx(contract);
        return "true";
    }
    /**
     * 添加教育经历
     * */
    @RequestMapping("AddEducationYqx")
    @ResponseBody
    public String AddEducationYqx(Education_Experience education){
        contractService.AddEducationYqx(education);
        return "true";
    }
    /**
     * 修改教育经历
     * */
    @RequestMapping("UpdateEducationYqx")
    @ResponseBody
    public String UpdateEducationYqx(Education_Experience education){
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