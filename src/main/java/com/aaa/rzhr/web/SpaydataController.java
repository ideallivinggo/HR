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
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        if(flag==true) {
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
    public void exportExcel(String id, HttpServletRequest request, HttpServletResponse response) throws ParseException {

                  Integer is=Integer.valueOf(id);
          List<Map> list=service.SgetAll(is);
        System.out.println(list.size()+"ooooooooooooooooooooooooooo");
        if(list.size()!=0) {
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
            String[] tableHead = {"姓名", "身份证号", "工资卡开户银行", "银行账号", "缺勤天数", "病假(时)"
                    , "事假(时)", "平时加班(时)", "周末加班(时)", "法定加班(时)", "月度工资", "迟到扣款", "缺勤扣款"
                    , "事假扣款", "病假扣款", "病假(时)", "加班工资", "绩效工资", "个人所得税", "实发工资"
            };
            for (int iHead = 0; iHead < tableHead.length; iHead++) {
                cell = row.createCell(iHead);
                cell.setCellValue(tableHead[iHead]);
                cell.setCellStyle(style);
                ;
            }

            for (int i = 0; i < list.size(); i++) {
                String[] str = new String[20];
                row = sheet.createRow(i + 1);
                Map map = list.get(i);
                str[0] = "" + map.get("empname");
                str[1] = "" + map.get("idnumber");
                str[2] = "" + map.get("socbank");
                str[3] = "" + map.get("soccardno");
                str[4] = "" + map.get("worday");
                str[5] = "" + map.get("worbelate");
                str[6] = "" + map.get("worpaffairs");
                str[7] = "" + map.get("worpswork");
                str[8] = "" + map.get("worweekwork");
                str[9] = "" + map.get("worhdaywork");
                str[10] = "" + map.get("paynumber");
                str[11] = "" + map.get("chidaok");
                str[12] = "" + map.get("queqink");
                str[13] = "" + map.get("shijiak");
                str[14] = "" + map.get("bingjiak");
                str[15] = "" + map.get("worbelate");
                str[16] = "" + map.get("jiaban");
                str[17] = "" + map.get("jixiao");
                str[18] = "" + map.get("gerenshui");
                str[19] = "" + map.get("shifa");
                for (int s = 0; s < str.length; s++) {
                    row.createCell(s).setCellValue(str[s]);
                }
            }
            for (int h = 0; h <= list.size(); h++) {
                row = sheet.getRow(h);
                row.setHeightInPoints(20);
            }
            for (int w = 0; w < tableHead.length; w++) {
                sheet.setColumnWidth(w, 4000);
            }
            // 设置文件名
            String name = "";
            String month = "" + list.get(0).get("statjmonth");
            String fileName = "" + name + month + "员工工资详细";
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
        }else{
            System.out.println("cccccccc");
        }
    }
    @RequestMapping("ssubsjp")
    public @ResponseBody  int ssub(String id) throws ParseException{
        Integer is=Integer.valueOf(id);
        List<Map> list=service.SgetAll(is);

        for(int i=0;i<list.size();i++){
            Map map=new HashMap();
                Map m=list.get(i);
                map.put("shifaa",m.get("shifa"));
            map.put("empidd",m.get("empid"));
            int a=service.Saddpayroll(map);
        }
        return 0;
    }
    @RequestMapping("sgetygxz")
 public @ResponseBody  String sgetygxz(int page, int limit,String id){
        List<Map> list=new ArrayList<>();
        String cs="";
     if(id==null){
         list = service.Sgetygxz("");
     }else if(id.equals("")){
         System.out.println("treueeeee");
         list = service.Sgetygxz("");
     }else if(id!=null) {
            String s = "";
            int a = 0;
            for (int i = 0; i < id.length(); i++) {
                if (i > 0) {
                    s += "" + id.substring(a, i + 1) + "%";
                } else {
                    s += "%" + id.substring(a, i + 1) + "%";
                }
                a++;
            }
             cs="'"+s+"'";
         list = service.Sgetygxz(cs);
        }


        PageHelper.startPage(page,limit);
        PageInfo<Map> info=new PageInfo<Map>(list);
        int count = (int) info.getTotal();
        String json=JSONObject.toJSONString(list);
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";

        return jso;
 }
 @RequestMapping("supdatexz")
 public @ResponseBody int supdatexz(String ssr){
     String[] str = ssr.split(",");
     Map m = new HashMap();
         m.put("ssy", str[0]);
         m.put("szz", str[1]);
         m.put("sdq", str[2]);
         m.put("sid",str[3]);
         int a=service.supdatexz(m);
     return a;
 }
    @RequestMapping("sgetmb")
    public @ResponseBody String sgetjxkh(int page, int limit){
         List<Map> list=service.sgetmb();
        PageHelper.startPage(page,limit);
        PageInfo<Map> info=new PageInfo<Map>(list);
        int count = (int) info.getTotal();
        String json=JSONObject.toJSONString(list);
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
        return jso;
    }
    @RequestMapping("sgetmbs")
    public @ResponseBody List<Map> sgetmb2(){
        List<Map> list=service.sgetmb();

        return list;
    }

    @RequestMapping("sgetjxkh")
    public @ResponseBody String sgejxkh(int page, int limit){
        List<Map> list= service.getjxkh();
        for (int i=0;i<list.size();i++){
            if(list.get(i).get("perstate").equals("0")){
                list.get(i).put("zhouqi","周");
            }else if(list.get(i).get("perstate").equals("1")){
                list.get(i).put("zhouqi","月");
            }else if(list.get(i).get("perstate").equals("2")){
                list.get(i).put("zhouqi","季");
            }else if(list.get(i).get("perstate").equals("3")){
                list.get(i).put("zhouqi","年");
            }
        }
        PageHelper.startPage(page,limit);
        PageInfo<Map> info=new PageInfo<Map>(list);
        int count = (int) info.getTotal();
        String json=JSONObject.toJSONString(list);
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
        return jso;
    }

    @RequestMapping("sgetmbmx")
    public @ResponseBody List<Map> Sgetmbmx(String smbid){
        int id=Integer.parseInt(smbid);
        List<Map> list=service.Sgetmbmx(id);
        return list;
    }
    @RequestMapping("supdkhmxid")
    public @ResponseBody List<Map> Supdkhmxid(String smbid,String jxmxone,String jxmxtwo,String jxmxthree,String jxmxfour,String jxmxfive){
       int ssid=Integer.parseInt(smbid);
        List<Map> li=service.Sgetmbmx(ssid);
       List<Map> lit=new ArrayList();
        List<Map> litt=new ArrayList();
        for(int t=0;t<li.size();t++){
            Map mp=new HashMap();
         mp.put("temid",li.get(t).get("temid"));
         lit.add(mp);
        }
        if(jxmxone.length()!=0){
            String[] jxmxid=jxmxone.split(",");
            for(int j=0;j<lit.size();j++){
               Set<String> sets=new HashSet<String>(Arrays.asList(jxmxid));
                boolean sss=sets.contains(String.valueOf(lit.get(j).get("temid")));
                if(sss==false){
                    Map mmp=new HashMap();
                    mmp.put("sdel",lit.get(j).get("temid"));
                    litt.add(mmp);
                }
            }
            if (litt.size()!=0) {
         int sde=service.sdeljxmx(litt);
            }
        }
       String[] jxmx1=jxmxone.split(",");
        String[] jxmx2=jxmxtwo.split(",");
        String[] jxmx3=jxmxthree.split(",");
        String[] jxmx4=jxmxfour.split(",");
        String[] jxmx5=jxmxfive.split(",");
        List<Map> list=new ArrayList();
        List<Map> list1=new ArrayList();
       for(int i=0;i<jxmx2.length;i++){
           if(jxmx1.length!=0) {
               if (i + 1 > jxmx1.length) {
                   Map m = new HashMap();
                   m.put("khxm", jxmx2[i]);
                   m.put("khfz1", jxmx3[i]);
                   m.put("khfz2", jxmx4[i]);
                   m.put("khfzsm", jxmx5[i]);
                   list.add(m);
               } else if (i < jxmx1.length) {
                   Map m1 = new HashMap();
                   m1.put("khid", jxmx1[i]);
                   m1.put("khxm", jxmx2[i]);
                   m1.put("khfz1", jxmx3[i]);
                   m1.put("khfz2", jxmx4[i]);
                   m1.put("khfzsm", jxmx5[i]);
                   list1.add(m1);
               }
           }else {
                   Map m = new HashMap();
                   m.put("khxm", jxmx2[i]);
                   m.put("khfz1", jxmx3[i]);
                   m.put("khfz2", jxmx4[i]);
                   m.put("khfzsm", jxmx5[i]);
                   list.add(m);
           }
       }
       int succ=0;
        if(list1.size()!=0){
             succ=service.Supdjxmx(list1);
        }
        if(list.size()!=0){
                for (int i = 0; i < list.size(); i++) {
                    if(list1.size()!=0) {
                        Map ma = list.get(i);
                        Map map = list1.get(i);
                        ma.put("khid", map.get("khid"));
                        String sa = (String) list.get(0).get("khid");
                        int idd = Integer.parseInt(sa);
                        Map mm = service.Sgetjxmbwj(idd);
                    }else{
                        Map ma = list.get(i);
                        ma.put("tnaid",ssid);
                    }
                }
             int a= service.Saddjxmx(list);
    }




        return null;
    }
   @RequestMapping("sgetcxcd")
  public @ResponseBody String Sgetcxcd(){
       List<Map<String,Object>> list=service.getdept();
       List li=new ArrayList();
       for (int i=0;i<list.size();i++){
           Map m=list.get(i);
           Map map=new HashMap();
           map.put("id",m.get("deptid"));
           map.put("pId",0);
           map.put("name",m.get("deptname"));
           map.put("checked","true");
           map.put("open","true");
           li.add(map);
       }
       for (int i=0;i<list.size();i++){
               List<Map<String, Object>> llit = service.getyuang(Integer.parseInt(list.get(i).get("deptid").toString()));
               for (int a = 0; a < llit.size(); a++) {
                   Map mm = llit.get(a);
                   Map map = new HashMap();
                   map.put("id", mm.get("empnumber"));//empid
                   map.put("pId", list.get(i).get("deptid"));
                   map.put("name", mm.get("empname"));
                   li.add(map);
               }
       }
       String json=JSONObject.toJSONString(li);
        return json;
  }
  @RequestMapping("sddjxkh")
  public @ResponseBody int sddjxkh(String spids,String sids,String sxmms,String skhmx){
       String[] pids=spids.split(",");
      String[] sid=sids.split(",");
       String ygids="";
      for(int i=0;i<pids.length;i++){
          if(!pids[i].equals("null")){
              ygids+=sid[i]+",";
          }
      }
      int flag=0;
      if(ygids!="") {
          Map ma=new HashMap();
          String khyg = ygids.substring(0, ygids.length() - 1);
          ma.put("khyg",khyg);
          ma.put("sxmms",sxmms);
          ma.put("skhmx",skhmx);
     flag= service.Saddjxmb(ma);
      }
      return flag;
  }
  @RequestMapping("sdeljxmb")
public @ResponseBody int sdeljxmb(String stnaid){
     int tnaid=Integer.parseInt(stnaid);
          int a= service.Sdeljxmb(tnaid);
    List<Map>  list=service.sgetmbmx(tnaid);
    if(list.size()!=0){
        int  flag =service.Sdeljxmbmx(tnaid);
        }
      return  a;
}
@RequestMapping("saddjxfq")
public @ResponseBody int saddjxfq(String jxmc,String skhsjone,String skhsjtwo,String khzq,String tnaid){
    Map m=new HashMap();
    m.put("jxmc",jxmc);
    m.put("jxsj1",skhsjone);
    m.put("jxsj2",skhsjtwo);
    m.put("khzq",khzq);
    m.put("tnaid",tnaid);
    System.out.println(tnaid);
List<Map> list=service.sgetmbyid(Integer.parseInt(tnaid));

    int  a=service.saddjxfq(m);
    if(list.size()==0){
        return 0;
    }
    return a;
}
@RequestMapping("sdeljxkh")
public @ResponseBody int sdeljxkh(String perid){
          int id=Integer.parseInt(perid);
          int a=service.sdeljxkh(id);
    return a;
}
@RequestMapping("sgetjxpg")
public @ResponseBody String sgetjxpg(String id,int page, int limit){
       int sid=Integer.parseInt(id);
      Map m= service.sgetbumen(sid);
       String deptid=String.valueOf(m.get("deptid"));
       int did=  Integer.parseInt(deptid);
    List<Map> list=service.sgetyg(did);//获取指定部门到所有员工
    List<Map> lis = service.sgetjxkhmb(1);//获取到模板要考核的员工工号
    List<Map> li=new ArrayList<>();
    for(int i=0;i<lis.size();i++){
        String[]  str= String.valueOf(lis.get(i).get("empnumber")).split(",");
        Set<String> sets=new HashSet<String>(Arrays.asList(str));
        ok:
        for(int j=0;j<list.size();j++){
            boolean sss=sets.contains(String.valueOf(list.get(j).get("empnumber")));
        List<Map> liss=service.sbyempidbymb(String.valueOf(list.get(j).get("empnumber")),String.valueOf(lis.get(i).get("perid")));
           if(sss==true && liss.size()!=0){
                Map mm=lis.get(i);
                li.add(mm);
                break ok;
            }
        }
    }
    for (int i=0;i<li.size();i++){
        if(li.get(i).get("perstate").equals("0")){
            li.get(i).put("zhouqi","周");
        }else if(li.get(i).get("perstate").equals("1")){
            li.get(i).put("zhouqi","月");
        }else if(li.get(i).get("perstate").equals("2")){
            li.get(i).put("zhouqi","季");
        }else if(li.get(i).get("perstate").equals("3")){
            li.get(i).put("zhouqi","年");
        }
    }
    PageHelper.startPage(page,limit);
    PageInfo<Map> info=new PageInfo<Map>(li);
    int count = (int) info.getTotal();
    String json=JSONObject.toJSONString(li);
    String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
    return  jso;
}
@RequestMapping("sgetjxpgmx")
public @ResponseBody String sgetjxpgmx(String id,String eid,int page, int limit){
int sid=Integer.parseInt(id);
List<Map> list=service.sgetjxkhygmx(sid);
    int ssid=Integer.parseInt(eid);
    Map m= service.sgetbumen(ssid);
    String deptid=String.valueOf(m.get("deptid"));
    int did=  Integer.parseInt(deptid);
    List<Map> list2=service.sgetyg(did);//获取指定部门到所有员工
    List<Map> lima=new ArrayList<>();
    for(int i=0;i<list.size();i++){
        for(int a=0;a<list2.size();a++){
            if(list.get(i).get("empid").equals(list2.get(a).get("empid"))){
                Map map=list.get(i);
                lima.add(map);
            }
        }
    }
    PageHelper.startPage(page,limit);
    PageInfo<Map> info=new PageInfo<Map>(lima);
    int count = (int) info.getTotal();
    String json=JSONObject.toJSONString(lima);
    String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
return  jso;
}
@RequestMapping("sgetygjxmx")
public @ResponseBody String sgetygjxmx(String id,String perid,int page, int limit){
    int sid=Integer.parseInt(id);
    int pid=Integer.parseInt(perid);
List<Map> list=service.sgetygkhmx(sid,pid);
    PageHelper.startPage(page,limit);
    PageInfo<Map> info=new PageInfo<Map>(list);
    int count = (int) info.getTotal();
    String json=JSONObject.toJSONString(list);
    String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
    return  jso;
}
@RequestMapping("sgetnojxpg")
public @ResponseBody String sgetnojxpg(String id,int page, int limit){
    int sid=Integer.parseInt(id);
    Map m= service.sgetbumen(sid);
    String deptid=String.valueOf(m.get("deptid"));
    int did=  Integer.parseInt(deptid);
    List<Map> list=service.sgetyg(did);//获取指定部门到所有员工
    List<Map> lis = service.sgetjxkhmb(0);//获取到模板要考核的员工工号
    List<Map> li=new ArrayList<>();
    for(int i=0;i<lis.size();i++){
        String[]  str= String.valueOf(lis.get(i).get("empnumber")).split(",");
        Set<String> sets=new HashSet<String>(Arrays.asList(str));
        ok:
        for(int j=0;j<list.size();j++){
            boolean sss=sets.contains(String.valueOf(list.get(j).get("empnumber")));
            List<Map> liss=service.sbyempidbymb(String.valueOf(list.get(j).get("empnumber")),String.valueOf(lis.get(i).get("perid")));
            if(sss==true && liss.size()==0){
                Map mm=lis.get(i);
                li.add(mm);
                break ok;
            }
        }
    }
    for (int i=0;i<li.size();i++){
        if(li.get(i).get("perstate").equals("0")){
            li.get(i).put("zhouqi","周");
        }else if(li.get(i).get("perstate").equals("1")){
            li.get(i).put("zhouqi","月");
        }else if(li.get(i).get("perstate").equals("2")){
            li.get(i).put("zhouqi","季");
        }else if(li.get(i).get("perstate").equals("3")){
            li.get(i).put("zhouqi","年");
        }
    }
    PageHelper.startPage(page,limit);
    PageInfo<Map> info=new PageInfo<Map>(li);
    int count = (int) info.getTotal();
    String json=JSONObject.toJSONString(li);
    String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
    return  jso;
}
@RequestMapping("sgetnpjxpgyg")
public @ResponseBody String sgetnojxpgyg(String id,String eid,int page, int limit){
    int sid=Integer.parseInt(id);
    Map mm=service.sgetkhbymbyg(sid);
        String[] str=String.valueOf(mm.get("empnumber")).split(",");
    List<Map> lii=new ArrayList<>();
  if(str.length!=0){
      int ssid=Integer.parseInt(eid);
      Map m= service.sgetbumen(ssid);
      String deptid=String.valueOf(m.get("deptid"));
    for(int i=0;i<str.length;i++){
        List<Map> list= service.sgetygbygh(str[i],deptid);
    if(list.size()!=0){
        Map map=list.get(0);
       lii.add(map);
    }
    }
}
   for(int f=0;f<lii.size();f++){
       List<Map> lit=service.sgetygsfpg(id,String.valueOf(lii.get(f).get("empid")));
       if(lit.size()==0){
           Map m=lii.get(f);
           m.put("state",0);
       }else{
           Map m=lii.get(f);
           m.put("state",1);
       }
   }
    PageHelper.startPage(page,limit);
    PageInfo<Map> info=new PageInfo<Map>(lii);
    int count = (int) info.getTotal();
    String json=JSONObject.toJSONString(lii);
    String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+json+"}";
    return  jso;
}
@RequestMapping("sgetygkhmxzj")
public @ResponseBody List<Map> sgetygkhmxzj(String perid,String empid){
    int sperid=Integer.parseInt(perid);
    int sempid=Integer.parseInt(empid);
   List<Map> list=service.sgetmbmxbyygkh(sperid);
    Map m=service.sgetygbyid(sempid);
        list.get(0).put("empname",m.get("empname"));
    return list;
}
@RequestMapping("saddygjxdf")
public @ResponseBody int saddygjxdf(String ygdf,String zgpj,String perid,String empid){
    List<Map> liss=new ArrayList<>();
   String[] ygdfs=ygdf.split(",");
   Double[] jg=new Double[ygdfs.length];
   int sperid= Integer.parseInt(perid);
   List<Map> list=service.sgetmbmxbyygkh(sperid);
    for (int i=0;i<list.size();i++){
       int fz1= Integer.parseInt(String.valueOf(list.get(i).get("temscoreone")));
        int fz2= Integer.parseInt(String.valueOf(list.get(i).get("temscoretwo")));
        int a=0;
        int fz=0;
                 if(fz1<fz2){
                    a=fz2-fz1;
                    fz=fz1;
                 }else if(fz1>fz2){
                     a=fz1-fz2;
                     fz=fz2;
                 }else if(fz1==fz2){
                     a=fz1;
                     fz=fz1;
                 }
                 if(ygdfs[i]!=null){
            int ygdfss=Integer.parseInt(ygdfs[i]);
             Double tttt=Double.valueOf(ygdfss-fz);
            Double aa=Double.valueOf(a);
              jg[i]= tttt/aa;
                 } }
    Double ygjg=0.0;
    for(int k=0;k<jg.length;k++) {
        ygjg=jg[k]+ygjg;
    }
    Double sdf=ygjg/Double.valueOf(jg.length);
    BigDecimal bg=new BigDecimal(sdf);
    double ph=bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
   for (int t=0;t<list.size();t++){
       SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
       Map mp=new HashMap();
       mp.put("perid",perid);
       mp.put("empid",empid);
       mp.put("temcontent",list.get(t).get("temcontent"));
       mp.put("pxqdefen",ygdfs[t]);
       mp.put("pxqdate",df.format(new Date()));
       mp.put("peizgpj",zgpj);
       if(ph>=0.85){
           mp.put("perjieguo","A");
       }else if(ph<0.85 && ph>=0.6){
           mp.put("perjieguo","B");
       }else if(ph<0.6){
           mp.put("perjieguo","C");
       }
       liss.add(mp);
   }
   int a= service.saddjxkhpg(liss);
    return a;
}
@RequestMapping("sgetypgyg")
public @ResponseBody List<Map> sgetypgyg(String perid,String empid){
    List<Map> list=service.sgetyikhyg(perid,empid);
    return list;
}


}
