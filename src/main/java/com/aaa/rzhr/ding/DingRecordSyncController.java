package com.aaa.rzhr.ding;

/**
 * @author XBJ
 * @date 2018-10-29 20:44
 */

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
import org.springframework.stereotype.Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class DingRecordSyncController {





    private static String accessTokenUrl = "https://oapi.dingtalk.com/gettoken";//通用
    private static String corpId = "ding93bd824d055b34cf35c2f4657eb6378f";
    private static String corpSecret = "6iYix8o8cHXjCJKz4BYmTiy2bG_0x7BAEWlXWztO1SLjgPG2wbPm26MOrFMi4dBN";

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

    public static void main(String[] args) {
        List<AttendanceQvo> users = new ArrayList<>();
        Date date = new Date();
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
        System.out.println("当前时间"+currentDate);
        String yesterday = getPreDayOrAfterDay(currentDate, -1);
        String workDateFrom = yesterday + " " + "06:00:00";
        String workDateTo = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);//当前时间
        String access_token_str = getAccessToken();//获取access_token
        JSONObject jsonStr = JSONObject.parseObject(access_token_str); //转json结构
        String access_Token = jsonStr.getString("access_token");//获取access_Token
        //  getAttendances(users, "2018-11-02 06:00:00","2018-11-05 23:01:01", access_Token);//凌晨的
       getAttendances(users, workDateFrom,workDateTo, access_Token);//凌晨的
       System.out.println("+++"+Arrays.asList(users));
       System.out.println("时间段是"+workDateFrom);
        //System.out.println("获取从昨天六点到当前时间的打卡记录"+Arrays.asList(users).get(0).get(0).getUserCheckTime());
        //获取第一个userid的对象
       // AttendanceQvo attendanceQvo = Arrays.asList(users).get(0).get(5);
        String dates =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
             .format(new Date(Arrays.asList(users).get(0).get(0).getUserCheckTime()));
     System.out.println("用户id "+Arrays.asList(users).get(0).get(2).getUserId());
       System.out.println("员工打卡时间"+dates);

        System.out.println("打卡类型"+Arrays.asList(users).get(0).get(0).getCheckType());
     //   System.out.println(Arrays.asList(users).get(0).size());
       System.out.println("打卡结果"+Arrays.asList(users).get(0).get(0).getTimeResult());

    }
}
