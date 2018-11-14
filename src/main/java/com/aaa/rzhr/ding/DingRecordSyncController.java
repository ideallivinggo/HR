package com.aaa.rzhr.ding;

/**
 * @author XBJ
 * @date 2018-10-29 20:44
 */

import com.aaa.rzhr.service.SpaydataService;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.crypto.Data;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class DingRecordSyncController {
@Autowired
SpaydataService service;

    private static String accessTokenUrl = "https://oapi.dingtalk.com/gettoken";//通用
    private static String corpId = "ding93bd824d055b34cf35c2f4657eb6378f";
    private static String corpSecret = "sJb2ciPYtHXMmAJC1wY5hji2FsKIXlC7-DGtA74fqVzCEzo9IH4gkD4HWrQTRUon";

    public static String getAccessToken() {
        Map<String,Object> map = new HashMap<>();
        map.put("corpid",corpId);
        map.put("corpsecret",corpSecret);
        return httpGetStringResult(accessTokenUrl, map);//获取access_token
    }

    public static String httpGetStringResult(String url,Map<String,Object> param){
        String content = null;
        CloseableHttpClient httpClient = HttpClients.createDefault();
        if(param != null && !param.isEmpty()){
            StringBuffer strparams = new StringBuffer();
            for (Map.Entry<String, Object> map : param.entrySet()) {
                strparams.append(map.getKey()).append("=").append(map.getValue().toString()).append("&");
            }
            strparams = strparams.deleteCharAt(strparams.length()-1);
            url = url + "?" + strparams;
        }
        HttpGet httpGet = new HttpGet(url);
        CloseableHttpResponse response = null;

        try {
            response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();
            content = EntityUtils.toString(entity,"UTF-8");
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();

        }finally {
            try {
                if(null!=response){
                    response.close();
                }
            } catch (IOException e) {

                e.printStackTrace();
            }
        }

        return content;
    }

    public static String doPost(String requestUrl,JSONObject json){
        HttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(requestUrl);
        post.setHeader("Content-Type", "application/json");
        post.addHeader("Authorization", "Basic YWRtaW46");
        String result = "";
        try {
            StringEntity s = new StringEntity(json.toString(), "utf-8");
            s.setContentEncoding(new BasicHeader("contentType",
                    "application/json"));
            post.setEntity(s);
            // 发送请求
            HttpResponse httpResponse = client.execute(post);
            // 获取响应输入流
            InputStream inStream = httpResponse.getEntity().getContent();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inStream, "utf-8"));
            StringBuilder strber = new StringBuilder();
            String line = null;
            while ((line = reader.readLine()) != null){
                strber.append(line + "\n");
            }

            inStream.close();
            result = strber.toString();
            System.out.println(result);
            if (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                System.out.println("请求服务器成功，做相应处理");
            } else {
                System.out.println("请求服务端失败");
            }
        } catch (Exception e) {
            System.out.println("请求异常");
            throw new RuntimeException(e);
        }
        return result;
    }

    public static List<AttendanceQvo> getAttendances(List<AttendanceQvo> users, String workDateFrom, String workDateTo,String access_Token) {
        List list = Arrays.asList("113168612523661213","142301623523718761");
 /*        List list=new ArrayList();
         list.add("113168612523661213");
         list.add("142301623523718761");*/
        

        int listSize=list.size();
        int toIndex = 50;
        for(int i = 0;i < list.size();i += 50){
            if(i+50 > listSize){        //作用为toIndex最后没有50条数据则剩余几条newList中就装几条
                toIndex = listSize-i;
            }
            List newList = list.subList(i,i + toIndex);
            Boolean hasMore = true;
            int offset = 0;//为了分页
            do{
                Map<String,Object> mapParam = new HashMap<>();
                mapParam.put("workDateFrom", workDateFrom);
                mapParam.put("workDateTo", workDateTo);
                mapParam.put("userIdList", newList);
                mapParam.put("offset", offset * 50);
                mapParam.put("limit", 50);
                String attendanceStr = getAttendance(mapParam, access_Token);
                JSONObject firstJson = JSONObject.parseObject(attendanceStr);

                hasMore = firstJson.getBoolean("hasMore");
                JSONArray recordFirst = firstJson.getJSONArray("recordresult");//当前部门下的userList
                for(int j = 0;j < recordFirst.size(); j++) {
                    JSONObject record = recordFirst.getJSONObject(j);
                    AttendanceQvo attendanceQvo = new AttendanceQvo();
                    attendanceQvo.setCheckType(record.getString("checkType"));
                    attendanceQvo.setUserId(record.getString("userId"));
                    attendanceQvo.setWorkDate(record.getLong("workDate"));
                    attendanceQvo.setUserCheckTime(record.getLong("userCheckTime"));
                   attendanceQvo.setBaseCheckTime(record.getLong("baseCheckTime"));
                    attendanceQvo.setTimeResult(record.getString("timeResult"));
                    users.add(attendanceQvo);
                }
                if(hasMore) {//有下一页偏移量加一
                    offset++;
                }
            } while (hasMore);
        }
        return users;
    }
    public static String getAttendance(Map<String, Object> map ,String access_token_str) {
        String dingDingAttendance = "https://oapi.dingtalk.com/attendance/list?access_token="+access_token_str;
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("workDateFrom",map.get("workDateFrom"));
        jsonObject.put("workDateTo",map.get("workDateTo"));
        jsonObject.put("limit",map.get("limit"));
        jsonObject.put("offset",map.get("offset"));
        jsonObject.put("userIdList",map.get("userIdList"));
        return doPost(dingDingAttendance,jsonObject);//获取考勤记录

    }

    /* * @Description: -1是前一天， +1是后一天
    * @Date: 17:28 2018/5/29
    */
    public static String getPreDayOrAfterDay(String current, int flag) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();//获取日历实例
        try {
            calendar.setTime(sdf.parse(current));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        calendar.add(Calendar.DAY_OF_MONTH, flag);  //设置为前一天 flag 负数代表前几天
        String yesterday = sdf.format(calendar.getTime());//获得前一天
        return yesterday;
    }

   /* public static void main(String[] args) {
        List<AttendanceQvo> users = new ArrayList<>();
        Date date = new Date();
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
        System.out.println("当前时间"+currentDate);
        String yesterday = getPreDayOrAfterDay(currentDate, -1);//数据开始时间
        String workDateFrom = yesterday + " " + "06:00:00";
        String workDateTo = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//当前时间（数据截止时间）
        String access_token_str = getAccessToken();//获取access_token
        JSONObject jsonStr = JSONObject.parseObject(access_token_str); //转json结构
        String access_Token = jsonStr.getString("access_token");//获取access_Token
        //  getAttendances(users, "2018-11-02 06:00:00","2018-11-05 23:01:01", access_Token);//凌晨的
       getAttendances(users, workDateFrom,workDateTo, access_Token);//凌晨的
       System.out.println("+++"+Arrays.asList(users));
        System.out.println(users.size());
        System.out.println(Arrays.asList(users).size());
       System.out.println("时间段是"+workDateFrom);
        //System.out.println("获取从昨天六点到当前时间的打卡记录"+Arrays.asList(users).get(0).get(0).getUserCheckTime());
        //获取第一个userid的对象
       // AttendanceQvo attendanceQvo = Arrays.asList(users).get(0).get(5);
        String dates =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
             .format(new Date(Arrays.asList(users).get(0).get(0).getUserCheckTime()));
     System.out.println("用户id "+Arrays.asList(users).get(0).get(0).getUserId());
       System.out.println("员工打卡时间"+dates);

        System.out.println("打卡类型"+Arrays.asList(users).get(0).get(0).getCheckType());
     //   System.out.println(Arrays.asList(users).get(0).size());
       System.out.println("打卡结果"+Arrays.asList(users).get(0).get(0).getTimeResult());

    }*/
    @RequestMapping("saddyuekaoqin")
    public @ResponseBody int saddyuekaoqin(String workDateFrom, String workDateTo,String access_Token) throws Exception {

        int sy,sm,sd;
        Calendar scal=Calendar.getInstance();
        sy=scal.get(Calendar.YEAR);
        sm=scal.get(Calendar.MONTH);
        String snow=sy+"-"+sm;
        System.out.println(snow+"now");
       List<Map> lis= service.sgetAll();
        System.out.println(lis.size()+"aaaaaaaaaaaaaaaaa");
       for(int si=0;si<lis.size();si++){
           System.out.println(lis.get(si).get("statjmonth"));
           if(lis.get(si).get("statjmonth").equals(snow)){
               System.out.println("bbbbbbbbbbbbv");
               Map mm=new HashMap();
               mm.put("staid",lis.get(si).get("staid"));
                 List<Map> listyf=service.sgetbyyf(mm);
               System.out.println(listyf.size()+"ffffffffffffffffffffffffffffff");
                 if(listyf.size()==0){
               List<AttendanceQvo> users = new ArrayList<>();
               Date date = new Date();
               String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
               System.out.println("当前时间"+currentDate);
               String yesterday = getPreDayOrAfterDay(currentDate, -7);//数据开始时间
              workDateFrom = yesterday + " " + "06:00:00";
               workDateTo = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//当前时间（数据截止时间）
               String access_token_str = getAccessToken();//获取access_token
               JSONObject jsonStr = JSONObject.parseObject(access_token_str); //转json结构
               access_Token = jsonStr.getString("access_token");//获取access_Token
               //  getAttendances(users, "2018-11-02 06:00:00","2018-11-05 23:01:01", access_Token);//凌晨的
              /* getAttendances(users, workDateFrom,workDateTo, access_Token);//凌晨的
                     */
                                  List<Map> elist=service.sgetalled();
                     List lists =new ArrayList();//需要查询员工的数组
                      for(int e=0;e<elist.size();e++){
                          lists.add(elist.get(e).get("eddnumber"));
                 }
 /*        List lists=new ArrayList();
         lists.add("113168612523661213");
         lists.add("142301623523718761");*/
                     int listSize=lists.size();
                     int toIndex = 50;
                     for(int i = 0;i < lists.size();i += 50){
                         if(i+50 > listSize){        //作用为toIndex最后没有50条数据则剩余几条newList中就装几条
                             toIndex = listSize-i;
                         }
                         List newList = lists.subList(i,i + toIndex);
                         Boolean hasMore = true;
                         int offset = 0;//为了分页
                         do{
                             Map<String,Object> mapParam = new HashMap<>();
                             mapParam.put("workDateFrom", workDateFrom);
                             mapParam.put("workDateTo", workDateTo);
                             mapParam.put("userIdList", newList);
                             mapParam.put("offset", offset * 50);
                             mapParam.put("limit", 50);
                             String attendanceStr = getAttendance(mapParam, access_Token);
                             JSONObject firstJson = JSONObject.parseObject(attendanceStr);

                             hasMore = firstJson.getBoolean("hasMore");
                             JSONArray recordFirst = firstJson.getJSONArray("recordresult");//当前部门下的userList
                             for(int j = 0;j < recordFirst.size(); j++) {
                                 JSONObject record = recordFirst.getJSONObject(j);
                                 AttendanceQvo attendanceQvo = new AttendanceQvo();
                                 attendanceQvo.setCheckType(record.getString("checkType"));
                                 attendanceQvo.setUserId(record.getString("userId"));
                                 attendanceQvo.setWorkDate(record.getLong("workDate"));
                                 attendanceQvo.setUserCheckTime(record.getLong("userCheckTime"));
                                 attendanceQvo.setBaseCheckTime(record.getLong("baseCheckTime"));
                                 attendanceQvo.setTimeResult(record.getString("timeResult"));
                                 users.add(attendanceQvo);
                             }
                             if(hasMore) {//有下一页偏移量加一
                                 offset++;
                             }
                         } while (hasMore);
                     }

               List<AttendanceQvo> list=new ArrayList<>();
                     System.out.println("dfffffffor"+users.size());
               int s=0;
               sok:
               for(int i=0;i<users.size();i=i+2){
                   if(users.size()%2!=0){
                       System.out.println();
                       if(i+1==users.size()){
                           break sok;
                       }
                       System.out.println(s);
                   AttendanceQvo at =users.get(i);
                   AttendanceQvo a=users.get(i+1);
                   list.add(at);
                   list.get(s).setAtts(a);
                   s++;

                   }else{
                       AttendanceQvo at =users.get(i);
                       AttendanceQvo a=users.get(i+1);
                       list.add(at);
                       list.get(s).setAtts(a);
                       s++;
                   }
               }
                     System.out.println("sucececesss"+list.size());
               int k=0;
               List<Map> kqlist=new ArrayList<>();
               for (int i=0;i<list.size();i++){
                   System.out.println(list.get(i).getUserId()+"ddddddddddddd");
                   Map kqmap=new HashMap();
                   if(list.get(i).getTimeResult().equals("NotSigned")){//如果未打卡
                       System.out.println(list.get(i).getUserId()+"ussser");
                       List<Map> li=service.sgetsfqj(String.valueOf(list.get(i).getUserId()));//获取员工未打卡是否请假
                       System.out.println("yououououuoo"+li.size());
                       if(li.size()!=0){//如果有请假
                           for(int a=0;a<li.size();a++){
                               String date1 =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                                       .format(new Date(list.get(i).getUserCheckTime()));//上午
                               String date2 =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                                       .format(new Date(list.get(i).getAtts().getUserCheckTime()));//(下午)转换接口获取的时间
                               String ldate=String.valueOf(li.get(a).get("leaenterdate"));
                               int index=ldate.indexOf("到");
                               String lateq=ldate.substring(0,index);
                               String lateh=ldate.substring(index+1);
                               SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                               long cong= format.parse(lateq).getTime();
                               long cong2= format.parse(lateh).getTime();
                               long getsw=format.parse(date1).getTime();
                               long getxw=format.parse(date2).getTime();
                               if(cong<getsw && getsw<cong2 && cong<getxw && getxw<cong2){
                                   System.out.println(222222222);
                                   kqmap.put("chidao",0);//传参为0时，意为没有迟到
                                   kqmap.put("queqin",1); //传参为1时，意为缺勤
                                   kqmap.put("empid",list.get(i).getUserId());
                                   kqmap.put("zaotui",0);//传参为0时，意为没有缺勤
                                   kqmap.put("yzchidao",0);//传参为0时，意为没有严重
                                   kqlist.add(kqmap);
                               }else if(cong<getsw && getsw<cong2){
                                   System.out.println(33333);
                                   kqmap.put("chidao",0);
                                   kqmap.put("queqin",3);//传参数为3时，意为缺勤半天
                                   kqmap.put("empid",list.get(i).getUserId());
                                   kqmap.put("zaotui",0);
                                   kqmap.put("yzchidao",0);
                                   kqlist.add(kqmap);
                               }else if(cong<getxw && getxw<cong2){
                                   System.out.println(44444444);
                                   kqmap.put("chidao",0);
                                   kqmap.put("queqin",3);
                                   kqmap.put("empid",list.get(i).getUserId());
                                   kqmap.put("zaotui",0);
                                   kqmap.put("yzchidao",0);
                                   kqlist.add(kqmap);
                               }else{
                                   System.out.println("ttttttttttttttttt");
                                   kqmap.put("chidao",0);
                                   kqmap.put("queqin",1);
                                   kqmap.put("empid",list.get(i).getUserId());
                                   kqmap.put("zaotui",0);
                                   kqmap.put("yzchidao",0);
                                   kqlist.add(kqmap);
                               }
                           }
                       }else{
                           System.out.println("dudiudidudiudid");
                           kqmap.put("chidao",0);
                           kqmap.put("queqin",0);
                           kqmap.put("empid",list.get(i).getUserId());
                           kqmap.put("zaotui",0);
                           kqmap.put("yzchidao",0);
                           kqlist.add(kqmap);
                       }
                   }else if (list.get(i).getTimeResult().equals("Late")){///如果迟到
                       String dates =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                               .format(new Date(list.get(0).getUserCheckTime()));
                       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                       Date datess= format.parse(dates);
                       int y,m,d;
                       Calendar cal=Calendar.getInstance();
                       y=cal.get(Calendar.YEAR);
                       m=cal.get(Calendar.MONTH);
                       d=cal.get(Calendar.DATE);
                       String now=y+"-"+m+"-"+d+" "+"09"+":00"+":00";
                       Date mydate= format.parse(now);
                       int fenzhong= (int) ((datess.getTime()-mydate.getTime()) /(1000 * 60));//获取到迟到的时间(分)
                       kqmap.put("chidao",1);
                       kqmap.put("chidaofz",fenzhong);
                       kqmap.put("empid",list.get(i).getUserId());
                       kqmap.put("queqin",0);
                       kqmap.put("zaotui",0);
                       kqmap.put("yzchidao",0);
                       kqlist.add(kqmap);
                   }else if (list.get(i).getTimeResult().equals("Normal")){//如果正常
                       kqmap.put("queqin",0);
                       kqmap.put("empid",list.get(i).getUserId());
                       kqmap.put("chidao",0);
                       kqmap.put("zaotui",0);
                       kqmap.put("yzchidao",0);
                       kqlist.add(kqmap);
                   }else if (list.get(i).getTimeResult().equals("Early")){//如果早退
                       kqmap.put("zaotui",1);
                       kqmap.put("queqin",0);
                       kqmap.put("empid",list.get(i).getUserId());
                       kqmap.put("chidao",0);
                       kqmap.put("yzchidao",0);
                       kqlist.add(kqmap);
                   }else if (list.get(i).getTimeResult().equals("SeriousLate")){//如果严重迟到
                       kqmap.put("zaotui",1);
                       kqmap.put("queqin",0);
                       kqmap.put("empid",list.get(i).getUserId());
                       kqmap.put("chidao",0);
                       kqmap.put("yzchidao",1);
                       kqlist.add(kqmap);
                   }
                   k++;
               }
               System.out.println(kqlist.size()+"kkkkkkkkkkkkkkkkkkkkkkkk");
               List<Map> quelist=new ArrayList<>();
               List<Map>  emplist= service.sgetempdingAll();
               int q=0;
               int z=0;
               int y=0;
               int c=0;
               List<Map> ykqlist=new ArrayList<>();
               List<Map> latelist=new ArrayList<>();
               for(int e=0;e<emplist.size();e++){
               for (int p=0;p<kqlist.size();p++){
                   if(kqlist.get(p).get("queqin").equals("1") && kqlist.get(p).get("empid").equals(emplist.get(e).get("eddnumber"))){
                       Map m=new HashMap();
                       m.put("qempid", kqlist.get(p).get("empid"));
                       q++;
                   }else if(kqlist.get(p).get("zaotui").equals("1") && kqlist.get(p).get("empid").equals(emplist.get(e).get("eddnumber"))){
                       Map m=new HashMap();
                       m.put("zempid", kqlist.get(p).get("empid"));
                       z++;
                   }else if(kqlist.get(p).get("yzchidao").equals("1") && kqlist.get(p).get("empid").equals(emplist.get(e).get("eddnumber"))){
                       Map m=new HashMap();
                       m.put("yempid", kqlist.get(p).get("empid"));
                       y++;
                   }else if(kqlist.get(p).get("chidao").equals("1") && kqlist.get(p).get("empid").equals(emplist.get(e).get("eddnumber"))){
                       Map m=new HashMap();
                       //迟到的员工id
                       m.put("yempid", kqlist.get(p).get("empid"));
                       c++;
                   }
                   /*kqmap.put("chidao",1);
                   kqmap.put("chidaofz",fenzhong);*/
               }
                   emplist.get(e).put("queqincs",q);
                   emplist.get(e).put("zaotuics",z);
                   emplist.get(e).put("yzchidao",y);
                   emplist.get(e).put("chidaocs",c);
                   emplist.get(e).put("staid", lis.get(si).get("staid"));

               }
                     System.out.println(emplist.size()+"empppppp"+emplist);
            for (int g=0;g<kqlist.size();g++){
                System.out.println("hhhhhhhhhhh");
                if(kqlist.get(g).get("chidao").equals("1")){
                    System.out.println("true");
                   Map m= kqlist.get(g);
                     Map mp=service.sgetallby(m);
                     m.put("staid", lis.get(si).get("staid"));
                     m.put("empids",mp.get("empid"));
                   latelist.add(m);
                }
            }
                     System.out.println("sssssss"+latelist.size());
                    if(latelist.size()!=0){
                        /*Map map=new HashMap();
                        Map maps=new HashMap();
                        map.put("staid",1);
                        map.put("empid",1);
                        map.put("chidao",1);
                        map.put("chidaofz",1);
                        maps.put("staid",1);
                        maps.put("empid",1);
                        maps.put("chidao",1);
                        maps.put("chidaofz",1);
                        latelist.add(map);
                        latelist.add(maps);*/
                     int a=service.saddycdj(latelist);
                        System.out.println(a);
                    }
                     System.out.println(latelist.size()+"fffffffffffffffffffff");
                   int a= service.saddykq(emplist);
               sy=scal.get(Calendar.YEAR);
               sm=scal.get(Calendar.MONTH)+2;
               String ssnow=sy+"-"+sm;
                  int b=service.saddyqkhdate(ssnow);
                     System.out.println(b+"sssssssssss");
                   return b;
           }else{
               return 7;
           }

       }
       }

        return 0;
    }
}
/*
if(users.get(i).getTimeResult().equals("NotSigned")){
        List<Map> li=service.sgetsfqj(String.valueOf(users.get(i).getUserId()));//获取员工未打卡是否请假
        if(li.size()!=0){
        for(int a=0;a<li.size();a++){
        String ldate=String.valueOf(li.get(a).get("leaenterdate"));
        int index=ldate.indexOf("到");
        String lateq=ldate.substring(0,index);
        String lateh=ldate.substring(index+1);
        System.out.println(lateq+"qian");
        System.out.println(lateq+"hou");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        long cong= format.parse(lateq).getTime();
        long cong2= format.parse(lateh).getTime();
        System.out.println(cong>cong2);
        }
        }else{
        list.get(s).put("queqin",0);
        }
        }else if(users.get(i).getTimeResult().equals("Normal")){

        };*/
