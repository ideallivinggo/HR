package com.aaa.rzhr.web;
import java.util.ArrayList;

import com.aaa.rzhr.pojo.*;
import com.aaa.rzhr.service.MailService;
import com.aaa.rzhr.service.YapplyService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/**
 * @author YLP
 * @date 2018-10-14 22:41
 */
@RestController
public class YapplyController {

    @Autowired
    private YapplyService service;
    @Autowired
    MailService mailService;


    /**
     * 查看招聘申请的外键链接表
     */
    @RequestMapping("queryAllPosYLP")
    public List<Position> listAllPos(){
		return service.queryAllPos();
    }
    @RequestMapping("queryAllDeptYLP")
    public List<Dept> listAllDept(){
        return service.queryAllDept();
    }
    @RequestMapping("queryAllEmpYLP")
    public List<Emp> listAllEmp(){
        return service.queryAllEmp();
    }
    /**
     * 添加招聘申请3
     */
    @RequestMapping("addRecYLP")
    public String addRec(Recruitment recruitment) {
        service.addRec(recruitment);
        return "true";
    }
    /**
     * 查看招聘申请
     */
    @RequestMapping("queryAllRecYLP")
    public List<Map> queryAllRec(Integer recid) {
        return service.queryAllRec(recid);
    }
    /**
     * 修改招聘申请
     */
    @RequestMapping("updateRecYLP")
    public String updateRec(Recruitment recruitment) {
        service.updateRec(recruitment);
        return "true";
    }
    /**
     * 添加简历
     */
    @RequestMapping("addResEnteringYlP")
    public String addResEntering(Resume resume) {
        service.addResEntering(resume);
        return "true";
    }
    /**
     * 分页查看简历
     */
    @RequestMapping("queryAllResYLP")
    public PageInfo<Map> queryAllRes(Resume resume,Integer pageNum) {
        PageInfo<Map> info = service.queryAllRes(resume, pageNum);
        return info;
    }

    /**
     * 查看单个简历
     */
    @RequestMapping("queryOneRes")
    public List<Map> queryOneRes(Resume resume) {
        return service.queryOneRes(resume);
    }

    /**
     * 筛选简历
     */
    @RequestMapping("updateResOneYLP")
    public String updateRes(Integer resstate, String s) {
        //多个筛选
        String ss = s.substring(0,s.length() - 1);
        service.updateResOne(resstate,ss);
        return "true";
    }

    @RequestMapping("updateResOne")
    public String updateResOne(Integer resstate, String s,String emali, String notice) {
        //单个筛选
        service.updateResOne(resstate,s);
        //mailService.sendSimpleMail(emali,"面试通知",notice);
        return "true";
    }
    /**
     * 添加面试
     */
    @RequestMapping("addIntoneYLP")
    public String addIntone(Interviewone interviewone) {
        service.addIntone(interviewone);
        return "true";
    }
    /**
     * 分页查询面试
     * */
    @RequestMapping("queryAllInteYLP")
    public  PageInfo<Map> queryAllInte(Interviewone interviewone, Integer pageNum) {
        return service.queryAllInte(interviewone, pageNum);
    }
    /**
     * 查看单个面试
     */
    @RequestMapping("queryOneInteYLP")
    public List<Map> queryOneInte(Interviewone interviewone) {
        return service.queryOneInte(interviewone);
    }

    /**
     * 清除过期和不过面试,或添加通过面试
     * */
    @RequestMapping("updateInteYLP")
    public String updateInte(Interviewone interviewone,Integer resstate, String s){
        service.updateInte(interviewone, resstate, s);
        return "true";
    }


    /**
     * 通过后添加第二次面试
     * 修改第一次面试状态2（放入第一次面试回收站）
     * 发送邮件
     */
    @RequestMapping("addIntTwoYLP")
    public String addIntTwo(Interviewtwo interviewtwo, Interviewone interviewone, String emali, String notice) {
        service.addIntTwo(interviewtwo, interviewone);
        //mailService.sendSimpleMail(emali,"面试通知",notice);
        return "true";
    }

    /**
     * 分页查询第二次面试
     * */
    @RequestMapping("queryAllInteTwoYLP")
    public  PageInfo<Map> queryAllInteTwo(Interviewtwo interviewtwo, Integer pageNum) {
        return service.queryAllInteTwo(interviewtwo, pageNum);
    }
    /**
     * 查看单个第二次面试
     */
    @RequestMapping("queryOneInteTwoYLP")
    public List<Map> queryOneInteTwo(Interviewtwo interviewtwo) {
        return service.queryOneInteTwo(interviewtwo);
    }
    /**
     * 修改第二次面试
     * */
    @RequestMapping("updateInteTwoYLP")
    public String updateInteTwo(Interviewtwo interviewtwo){
        System.out.println(interviewtwo.getIntid());
        System.out.println(interviewtwo.getIntstate());
        System.out.println(interviewtwo.getIntnotes());
        service.updateInteTwo(interviewtwo);
        return "true";
    }


}
