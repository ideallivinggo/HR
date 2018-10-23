package com.aaa.rzhr.web;


import com.aaa.rzhr.pojo.Att_Statistics;
import com.aaa.rzhr.pojo.Latedata;
import com.aaa.rzhr.service.SpaydataService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.aaa.rzhr.pojo.Payrolldata;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * @author SJP
 * @date 2018/10/15 0015 10:02
 */
@Controller
public class SpaydataController {
    @Autowired
    SpaydataService service;
    @RequestMapping("/getpaysjp")
    public @ResponseBody List<Payrolldata> getpaydata() {
        List<Payrolldata> list = service.Sgetpaydata();
        return list;
    }
    @RequestMapping("/getlatesjp")
    public @ResponseBody List<Latedata> getlatedata() {
        List<Latedata> list = service.Sgetlate();
        return list;
    }
    @RequestMapping("/updlatesjp")
    public @ResponseBody boolean updlatedata(String lat1,String lat2,String latp) {
        boolean flag=service.Sdelpaydata();
        System.out.println("sjp====");
        System.out.println(flag);
        if(flag==true) {
            System.out.println("success");
            String[] latone = lat1.split(",");
            String[] lattwo = lat2.split(",");
            String[] latpunish = latp.split(",");
            Map m = new HashMap();
            for (int i = 0; i < latone.length; i++) {
                m.put("latone", latone[i]);
                m.put("lattwo", lattwo[i]);
                m.put("latpunish", latpunish[i]);
                 boolean sss=service.Saddpaydata(m);
                if (i+1==latone.length) {
                    System.out.println(sss);
                    return sss;
                }
            }
        }
        return false;
    }
    @RequestMapping("/addlatesjp")
    public @ResponseBody boolean addpaydata(String shangone,String shangtwo,String shangthree,String shangfour,String shangfive) {
       String[] pay1 = shangone.split(",");
        String[] pay2 = shangtwo.split(",");
        String[] pay3 = shangthree.split(",");
        String[] pay4 = shangfour.split(",");
        String[] pay5 = shangfive.split(",");
        Map m = new HashMap();
        System.out.println(m+"ssss");
        m.put("payrbase",pay1[0]);
        m.put("payrdays",pay1[1]);
       service.Supdpdata1(m);
        Map m1 = new HashMap();
        m1.put("payrbase",pay2[0]);
        m1.put("payrdays",pay2[1]);
        m1.put("payrhour",pay2[2]);
      service.Supdpdata2(m1);
        Map m2 = new HashMap();
        m2.put("payrbase",pay3[0]);
        m2.put("payrdays",pay3[1]);
        m2.put("payrhour",pay3[2]);
        service.Supdpdata3(m2);
        Map m3 = new HashMap();
        m3.put("payrbase",pay4[0]);
        m3.put("payrdays",pay4[1]);
        m3.put("payrhour",pay4[2]);
        m3.put("payrpacific",pay4[3]);
        m3.put("payrweekend",pay4[4]);
        m3.put("payrlegal",pay4[5]);
       service.Supdpdata4(m3);
        Map m4 = new HashMap();
        m4.put("payrbase",pay5[0]);
        m4.put("payjixiao",pay5[1]);
       boolean flag=service.Supdpdata5(m4);
        return flag;
    }
    @RequestMapping("/sgetattsjp")
    public @ResponseBody String addpaydata(int page, int limit){
        PageHelper.startPage(page,limit);
        List<Att_Statistics> list = service.Sgetatt();
        PageInfo<Att_Statistics> info=new PageInfo<Att_Statistics>(list);
       int count = (int) info.getTotal();
            String json=JSONObject.toJSONString(list);
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";

        return jso;
    }
    @RequestMapping("sdelattsjp")
 public @ResponseBody  int sdelattbyid(String id){
        int sid= Integer.parseInt(id);
int ss=service.SdelattById(sid);
        return ss;
 }

    @RequestMapping("sexportExcelsjp")
    public void exportExcel(String id, HttpServletRequest request, HttpServletResponse response){

                  Integer is=Integer.valueOf(id);
          List<Map> list=service.SgetAll(is);
// 创建HSSFWorkbook 对象，用于将excel输出到输出流
        HSSFWorkbook excel = new HSSFWorkbook();
        // 创建table工作薄
        HSSFSheet sheet = excel.createSheet("员工月工资详情表");
        // 创建表格行
        HSSFRow row = sheet.createRow(0);
        // 单元格样式
        HSSFCellStyle style = excel.createCellStyle();
        style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//垂直
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        HSSFCell cell;
        // 设置表头内容
        String[] tableHead = {"姓名","身份证号","工资卡开户银行","银行账号","缺勤天数","病假(时)"
                ,"事假(时)","平时加班(时)","周末加班(时)","法定加班(时)","月度工资","迟到扣款","缺勤扣款"
        ,"事假扣款","病假扣款","病假(时)","加班工资","绩效工资","个人所得税","实发工资"
        };
        for(int iHead=0; iHead<tableHead.length; iHead++) {
            cell =row.createCell(iHead);
            cell.setCellValue(tableHead[iHead]);
            cell.setCellStyle(style);;
        }
        for(int i=0;i<list.size();i++) {
            String[] str = new String[20];
            row = sheet.createRow(i+1);
            Map map = list.get(i);
            str[0]=""+map.get("empname");str[1]=""+map.get("idnumber");str[2]=""+map.get("socbank");str[3]=""+map.get("soccardno");
            str[4]=""+map.get("worday");str[5]=""+map.get("worbelate");str[6]=""+map.get("worpaffairs");str[7]=""+map.get("worpswork");
            str[8]=""+map.get("worweekwork");str[9]=""+map.get("worhdaywork");str[10]=""+map.get("paynumber");str[11]=""+map.get("chidaok");
            str[12]=""+map.get("queqink");str[13]=""+map.get("shijiak");str[14]=""+map.get("bingjiak");str[15]=""+map.get("worbelate");
            str[16]=""+map.get("jiaban");
            str[17]=null;
            str[18]=""+map.get("gerenshui");
            str[19]=""+map.get("shifa");
            for(int s=0; s<str.length; s++) {
                row.createCell(s).setCellValue(str[s]);
            }
        }
        for(int h=0; h<=list.size(); h++) {
            row = sheet.getRow(h);
            row.setHeightInPoints(20);
        }
        for(int w=0; w<tableHead.length; w++) {
            sheet.setColumnWidth(w, 4000);
        }
        // 设置文件名
       String name=""+list.get(0).get("stagsname");
        String month=""+list.get(0).get("statjmonth");
        String fileName =""+name+month+"员工工资详细";
        try {
            // 捕获内存缓冲区的数据，转换成字节数组
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            excel.write(out);
            // 获取内存缓冲中的数据
            byte[] content = out.toByteArray();
            // 将字节数组转化为输入流
            InputStream in = new ByteArrayInputStream(content);
            //通过调用reset（）方法可以重新定位。
            response.reset();
            // 如果文件名是英文名不需要加编码格式，如果是中文名需要添加"iso-8859-1"防止乱码
            response.setHeader("Content-Disposition", "attachment; filename=" + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
            response.addHeader("Content-Length", "" + content.length);
            response.setContentType("application/vnd.ms-excel;charset=UTF-8");
            ServletOutputStream outputStream = response.getOutputStream();
            BufferedInputStream bis = new BufferedInputStream(in);
            BufferedOutputStream bos = new BufferedOutputStream(outputStream);
            byte[] buff = new byte[8192];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
            bis.close();
            bos.close();
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    @RequestMapping("ssubsjp")
    public @ResponseBody  int ssub(String id){
        Integer is=Integer.valueOf(id);
        List<Map> list=service.SgetAll(is);

        for(int i=0;i<list.size();i++){
            Map map=new HashMap();
                Map m=list.get(i);
                map.put("shifaa",m.get("shifa"));
            map.put("empidd",m.get("empid"));
            int a=service.Saddpayroll(map);
            System.out.println(a);
        }
        return 0;
    }

    }
