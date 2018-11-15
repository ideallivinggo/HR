package com.aaa.rzhr.web;
import java.io.File;
import java.io.IOException;

import com.aaa.rzhr.pojo.*;
import com.aaa.rzhr.service.MailService;
import com.aaa.rzhr.service.YapplyService;
import com.github.pagehelper.PageInfo;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

////////////////////////////////////招聘申请///////////////////////////////////////////////////
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
     * 分页查看招聘申请
     */
    @RequestMapping("queryAllRecYLP")
    public PageInfo<Map> queryAllRec(Recruitment recruitment,Integer pageNum) {
        PageInfo<Map> info = service.queryAllRec(recruitment, pageNum);
        return info;
    }
    /**
     * 修改招聘申请
     */
    @RequestMapping("updateRecYLP")
    public String updateRec(Recruitment recruitment) {
        service.updateRec(recruitment);
        return "true";
    }
    ////////////////////////////////////简历///////////////////////////////////////////////////
    /**
     * 添加简历
     */
    @RequestMapping("addResEnteringYlP")
    public String addResEntering(Resume resume) {
        service.addResEntering(resume);
        return "true";
    }
    /**
     * 添加简历
     */
    //批量添加
    @RequestMapping("uploadYlp")
    public String addAll(Resume resume, @RequestParam("file") MultipartFile file, HttpServletRequest req) throws IOException {
        String oldname=file.getOriginalFilename();
        String newName= UUID.randomUUID()+oldname.substring(oldname.lastIndexOf("."));
        //upload文件路径,获取upload文件夹的路径
        String realPath=req.getSession().getServletContext().getRealPath("/upload");
        //上传
        File files=new File(realPath+"/"+newName);
        file.transferTo(files);
        System.out.println(files);

        Workbook bWorkbook=null;
        try {
            //获取文件.xls文件
            bWorkbook=Workbook.getWorkbook(new File(String.valueOf(files)));
            //获得第一个工作表对象
            Sheet sheet=bWorkbook.getSheet(0);
            //把值遍历取出，sheet.getRows()获取行，sheet.getColumns();获取列数
            for (int i = 1; i < sheet.getRows(); i++) {
                resume.setResumename(sheet.getCell(0,i).getContents());
                resume.setSex(sheet.getCell(1,i).getContents());
                resume.setEducation(sheet.getCell(2,i).getContents());
                resume.setAge(Integer.parseInt(sheet.getCell(3,i).getContents()));
                resume.setPhone(sheet.getCell(4,i).getContents());
                resume.setResmajor(sheet.getCell(5,i).getContents());
                resume.setResposition(sheet.getCell(6,i).getContents());
                resume.setEmali(sheet.getCell(7,i).getContents());
                resume.setResdate(sheet.getCell(8,i).getContents());
                resume.setDizhi(sheet.getCell(9,i).getContents());
                resume.setJieshao(sheet.getCell(10,i).getContents());
                resume.setResstate(0);
                service.addResEntering(resume);
            }
        } catch (BiffException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            bWorkbook.close();
        }
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
     * 筛选简历
     */
    @RequestMapping("updateResOneYLP")
    public String updateRes(Integer resstate, String s) {
        //多个筛选
        String ss = s.substring(0,s.length() - 1);
        service.updateResOne(resstate,ss);
        return "true";
    }
////////////////////////////////////第一次面试///////////////////////////////////////////////////
    /**
     * 添加面试
     */
    @RequestMapping("addIntoneYLP")
    public String addIntone(Interviewone interviewone, Integer resstate, String s,String emali, String notice) {
        service.addIntone(interviewone, resstate, s);
        String shijian = interviewone.getInodate();
        mailService.sendSimpleMail(emali,"面试通知",notice+"面试时间"+shijian);
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
     * 清除过期和不过面试
     * 添加通过面试
     * */
    @RequestMapping("updateInteYLP")
    public String updateInte(Interviewone interviewone,Integer resstate, String s){
        service.updateInte(interviewone, resstate, s);
        return "true";
    }

////////////////////////////////////第二次面试///////////////////////////////////////////////////
    /**
     * 通过后添加第二次面试
     * 修改第一次面试状态2（放入第一次面试回收站）
     * 发送邮件
     */
    @RequestMapping("addIntTwoYLP")
    public String addIntTwo(Interviewtwo interviewtwo, Interviewone interviewone, String emali, String notice) {
        service.addIntTwo(interviewtwo, interviewone);
        String shijian = interviewtwo.getIntdate();
        mailService.sendSimpleMail(emali,"面试通知",notice+"面试时间"+shijian);
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
     * 清除过期和不过面试
     * 添加通过二次面试
     * */
    @RequestMapping("updateInteTwoYLP")
    public String updateInteTwo(Interviewtwo interviewtwo){
        service.updateInteTwo(interviewtwo);
        return "true";
    }

   ////////////////////////////////////面试完成推送到人事部选择录取///////////////////////////
    /**
     * 推送筛选
     */
    @RequestMapping("inteTwoPashYLP")
    public String inteTwoPash(Integer intstate, String s) {
        //多个筛选
        String ss = s.substring(0,s.length() - 1);
        service.inteTwoPash(intstate,ss);
        return "true";
    }
    /**
     * 查看最大员工id
     * 生成员工编号
     */
    @RequestMapping("queryActIDYLP")
    public Map queryActID (Integer actid) {
        return service.queryActID(actid);
    }
    /**
     * 添加员工激活表
     * 修改面试到回收
     */
    @RequestMapping("addActYLP")
    public String addAct(Activation activation, Interviewtwo interviewtwo,String emali, String notice) {
        service.addAct(activation, interviewtwo);
        String shijian = activation.getActdate();
        mailService.sendSimpleMail(emali,"面试通知",notice+"。报道时间"+shijian);
        return "true";
    }

    /**
     * 员工激活
     */
    @RequestMapping("updateActYLP")
    public  String updateAct (Activation activation) {
        service.updateAct(activation);
        return "true";
    }
    /**
     * 激活详情
     */
    @RequestMapping("queryAllActYLP")
    public  PageInfo<Map> queryAllAct(Activation activation, Integer pageNum) {
        return service.queryAllAct(activation, pageNum);
    }
    /**
     * 不入职撤除
     */
    @RequestMapping("ccActYLP")
    public  String ccAct (Activation activation) {
        service.ccAct(activation);
        return "true";
    }



////////////////////////////////////////////////////////////////////////////////////////
    /**
     * 分页查询课程审批
     * */
    @RequestMapping("queryAllkecJSR")
    public  PageInfo<Map> queryAllkec(Kecheng kecheng, Integer pageNum) {
        return service.queryAllkec(kecheng, pageNum);
    }
    /**
     * 查看上课老师
     * */
    @RequestMapping("queryAllketJSR")
    public  List<Map> queryAllket(Keteacher keteacher) {
        return service.queryAllket(keteacher);
    }
    /**
     * 审批
     */
    @RequestMapping("updatekecYLP")
    public  String updatekec (Kecheng kecheng) {
        service.updatekec(kecheng);
        return "true";
    }

    /**
     * 员工培训记录
     * */
    @RequestMapping("queryAllkeeJSR")
    public  PageInfo<Map> queryAllkee(Integer empid, Integer kestate, Integer pageNum) {
        return service.queryAllkee(empid, kestate, pageNum);
    }
    /**
     * 查询培训课程员工
     * */
    @RequestMapping("queryAllkeempJSR")
    public  List<Map> queryAllkeemp(Integer keempid,Integer keid, Integer keokstate, String empnumber) {
        return service.queryAllkeemp(keempid,keid, keokstate, empnumber);
    }
    /**
     * 打分
     */
    @RequestMapping("dafenYLP")
    public  String dafen (Keemp keemp) {
        service.dafen(keemp);
        return "true";
    }
    /**
     * 剩余打分人数
     */
    @RequestMapping("shengyuYLP")
    public Map shengyu(Integer keid) {
        return service.shengyu(keid);
    }
    /**
     * 培训课程完成
     */
    @RequestMapping("wanchengYLP")
    public String wancheng (Kecheng kecheng) {
        service.wancheng(kecheng);
        return "true";
    }




////////////////////////////////////////////首页  待办事项///////////////////////////////////////////////
    /**
     * 待入职统计
     */
    @RequestMapping("countActYLP")
    public Map countAct() {
        return service.countAct();
    }

    /**
     * 统计不同状态员工
     */
    @RequestMapping("countEmpStateYLP")
    public List<Map> countEmpState() {
        return service.countEmpState();
    }
    /**
     * 合同到期提醒
     */
    @RequestMapping("countContractYLP")
    public Map countContract() {
        return service.countContract();
    }
    /**
     * 加班审批
     */
    @RequestMapping("countOvertimeYLP")
    public Map countOvertime() {
        return service.countOvertime();
    }
    /**
     * 离职审批
     */
    @RequestMapping("countDimissionYLP")
    public Map countDimission() {
        return service.countDimission();
    }
    /**
     * 休假审批
     */
    @RequestMapping("countLeaveYLP")
    public Map countLeave() {
        return service.countLeave();
    }
    /**
     * 培训课程审批
     */
    @RequestMapping("countKecYLP")
    public Map countKec() {
        return service.countKec();
    }
    /**
     * 待录取员工
     */
    @RequestMapping("countInttwoYLP")
    public Map countInttwo() {
        return service.countInttwo();
    }



}
