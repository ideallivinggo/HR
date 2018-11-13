package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.SpaydataMapper;
import com.aaa.rzhr.pojo.Att_Statistics;
import com.aaa.rzhr.pojo.Latedata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aaa.rzhr.pojo.Payrolldata;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

/**
 * @author SJP
 * @date 2018/10/15 0015 9:59
 */
@Service
@SuppressWarnings("All")
public class SpaydataServiceImpl implements  SpaydataService {
    @Autowired
    SpaydataMapper mapper;

    @Override
    public List<Payrolldata> Sgetpaydata() {

        return mapper.Sgetpaydata();
    }

    @Override
    public List<Latedata> Sgetlate() {
        return mapper.Sgetlate();
    }

    @Override
    public boolean Sdelpaydata() {
        return mapper.Sdelpaydata();
    }

    @Override
    public boolean Saddpaydata(Map m) {
        return mapper.Saddpaydata(m);
    }

    @Override
    public boolean Supdpdata1(Map m) {
        return mapper.Supdpdata1(m);
    }

    @Override
    public boolean Supdpdata2(Map m) {
        return mapper.Supdpdata2(m);
    }

    @Override
    public boolean Supdpdata3(Map m) {
        return mapper.Supdpdata3(m);
    }

    @Override
    public boolean Supdpdata4(Map m) {
        return mapper.Supdpdata4(m);
    }

    @Override
    public boolean Supdpdata5(Map m) {
        return mapper.Supdpdata5(m);
    }

    @Override
    public List<Att_Statistics> Sgetatt() {
        return mapper.Sgetatt();
    }

    @Override
    public int SdelattById(int id) {
        return mapper.SdelattById(id);
    }

    @Override
    public List<Map> SgetAll(Integer id) throws ParseException {

        DecimalFormat format=new DecimalFormat("#.##");
        List<Map>  list=mapper.SgetAll(id);
       List<Payrolldata> pay= mapper.Sgetpaydata();
        List<Latedata> late=mapper.Sgetlate();
        Double shuilv=0.0;
        Double chidaok=0.0;
        Double pjiaban=0.0;
        Double zjiaban=0.0;
        Double jjiaban=0.0;
        Double queqink=0.0;
        Double shijiak=0.0;
        Double bingjiak=0.0;
        Double jixiao=0.0;
        Double gerenshui=0.0;
        Double shifa=0.0;
        Double jiaban=0.0;
        List<Map> sumlist = mapper.sgetsumyfkh(id);
        for(int i=0;i<list.size();i++) {
             jixiao=null;
            Map map = list.get(i);
            if(sumlist.size()!=0) {//2
     for(int sa=0;sa<sumlist.size();sa++) {

         List<Map> jxlist= mapper.sgetjixiao(String.valueOf(sumlist.get(sa).get("perid")));
         System.out.println(sumlist.get(sa).get("perid")+"pppppppppppp");
         System.out.println(jxlist.size()+"jixiaoxxxxxxxxxxxxxxxxxx");
         if (jxlist.size() != 0) {//判断绩效是否存在
             ok:
             for (int a = 0; a < jxlist.size(); a++) {
                 System.out.println(map.get("empid")+"emppppppppppppppp");
                 System.out.println(a+"acacacacaacacacacacaca");
                 Map m = jxlist.get(a);
                 if (m.get("empid").equals(map.get("empid"))) {
                     if (m.get("perjieguo").equals("A")) {
                          if (jixiao==null) {
                              jixiao = (Double) map.get("paynumber") * pay.get(4).getPayrbase() * 1 / pay.get(4).getPayjixiao();
                         break ok;
                          }else {
                              jixiao=jixiao+((Double) map.get("paynumber") * pay.get(4).getPayrbase() * 1 / pay.get(4).getPayjixiao());
                              break ok;
                          }
                     } else if (m.get("perjieguo").equals("B")) {
                         if (jixiao==null) {
                             jixiao = (Double) map.get("paynumber") * pay.get(4).getPayrbase() * 1 / pay.get(4).getPayjixiao();
                             break ok;
                         }else {
                             jixiao=jixiao+((Double) map.get("paynumber") * pay.get(4).getPayrbase() * 1 / pay.get(4).getPayjixiao());
                             break ok;
                         }
                     }else if (m.get("perjieguo").equals("C")) {
                         if (jixiao==null) {
                             jixiao = (Double) map.get("paynumber") * pay.get(4).getPayrbase() * 1 / pay.get(4).getPayjixiao();
                             break ok;
                         }else {
                             jixiao=jixiao+((Double) map.get("paynumber") * pay.get(4).getPayrbase() * 1 / pay.get(4).getPayjixiao());
                             break ok;
                         }
                     }
                 }else{
                     System.out.println("cccccccccccccccccc");
                     jixiao = null;
                     map.put("jixiao", "");
                 }
             }
         } else {
             jixiao = null;
             map.put("jixiao", "");
         }
     }
            }else{
                jixiao = null;
                map.put("jixiao", "");
            }
            map.put("jixiao", jixiao);
            System.out.println("aaaaaaaaaa");
            queqink = (Double) map.get("paynumber") * pay.get(0).getPayrbase() / pay.get(0).getPayrdays() * (Double) map.get("worday");
            map.put("queqink", format.format(queqink));//缺勤扣款费
            shijiak = (Double) map.get("paynumber") * pay.get(1).getPayrbase() / pay.get(1).getPayrdays() / pay.get(1).getPayrhour() * (Double) map.get("worpaffairs");
            map.put("shijiak", format.format(shijiak));//事假扣款费
            bingjiak = (Double) map.get("paynumber") * pay.get(2).getPayrbase() / pay.get(2).getPayrdays() / pay.get(2).getPayrhour() * (Double) map.get("worbelate");
            map.put("bingjiak", format.format(bingjiak));//病假费用
            pjiaban = (Double) map.get("paynumber") * pay.get(3).getPayrbase() / pay.get(3).getPayrdays() / pay.get(3).getPayrhour() * (Double) map.get("worpswork")*pay.get(3).getPayrpacific();
            map.put("pjiaban", format.format(pjiaban));//平时加班费用
            zjiaban = (Double) map.get("paynumber") * pay.get(3).getPayrbase() / pay.get(3).getPayrdays() / pay.get(3).getPayrhour() * (Double) map.get("worweekwork")*pay.get(3).getPayrweekend();
            map.put("zjiaban", format.format(zjiaban));//周末加班费用
            jjiaban = (Double) map.get("paynumber") * pay.get(3).getPayrbase() / pay.get(3).getPayrdays() / pay.get(3).getPayrhour() * (Double) map.get("worhdaywork")*pay.get(3).getPayrlegal();
            map.put("jjiaban", format.format(jjiaban));//节假日加班

            System.out.println("bbbbbbbbbbbbbbb");
            Double latesum=0.0;
                    latesum = (Double) map.get("worklatesum");
            jiaban=jjiaban+zjiaban+pjiaban;//加班费用
            map.put("jiaban", format.format(jiaban));
            if (latesum>0) {
                System.out.println("eeeeeeeeee"+late.size());
                for (int l = 0; l < late.size(); l++) {
                    Double late1 = Double.parseDouble(late.get(l).getLatone());
                    Double late2 = Double.parseDouble(late.get(l).getLattwo());
                    if (latesum >= late1 && latesum <= late2) {
                        Double latpun = Double.parseDouble(late.get(l).getLatpunish());
                        chidaok=latpun*latesum;
                        map.put("chidaok", format.format(chidaok));
                    }
                }
            }
            System.out.println("11111111");
            Double nashuie = (Double) map.get("paynumber")-5000;
            if(nashuie==0){
               shuilv=0.00;
            }else if(nashuie<=3000){
                 shuilv=0.03;
            }else if(nashuie>3000 && nashuie<=12000){
                 shuilv=0.1;
            }else if(nashuie>12000 && nashuie<=35000){
                shuilv=0.25;
            }else if(nashuie>35000 && nashuie<=55000){
                shuilv=0.30;
            }else if(nashuie>55000 && nashuie<=80000){
                shuilv=0.35;
            }else if(nashuie>80000){
                shuilv=0.45;
            }
            System.out.println("jjjjjjjjj");
            gerenshui=nashuie*shuilv;
            map.put("gerenshui",format.format(gerenshui));
            System.out.println("pppp"+map.get("paynumber"));
            System.out.println("chidaok"+chidaok);
            System.out.println("gerenshui"+gerenshui);
            System.out.println("shijiak"+shijiak);
            System.out.println("bingjiak"+bingjiak);
            System.out.println("queqink"+queqink);
            System.out.println("zjiaban"+zjiaban);
            System.out.println("jjiaban"+jjiaban);
           if(jixiao==null) {
               shifa = (Double) map.get("paynumber") - chidaok - gerenshui - shijiak - bingjiak - queqink + pjiaban + zjiaban + jjiaban;
           }else{
               shifa = (Double) map.get("paynumber") - chidaok - gerenshui - shijiak - bingjiak - queqink + pjiaban + zjiaban + jjiaban + jixiao;

           }
            map.put("shifa",format.format(shifa));
            System.out.println(map.get("jixiao")+"jjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
       }
        return list;
    }


    @Override
    public List<Map> sgetjixiao(String id) {
        return mapper.sgetjixiao(id);
    }

    @Override
    public int Saddpayroll(Map m) {
        return mapper.Saddpayroll(m);
    }

    @Override
    public List<Map> Sgetygxz(String cs) {
        return mapper.Sgetygxz(cs);
    }

    @Override
    public int supdatexz(Map m) {
        return mapper.supdatexz(m);
    }

    @Override
    public List<Map> sgetmb() {
        return mapper.sgetmb();
    }

    @Override
    public List<Map> Sgetmbmx(int id) {
        return mapper.Sgetmbmx(id);
    }

    @Override
    public Map Sgetjxmbwj(int id) {
        return mapper.Sgetjxmbwj(id);
    }

    @Override
    public int Supdjxmx(List<Map> list) {
        return mapper.Supdjxmx(list);
    }

    @Override
    public int Saddjxmx(List<Map> list) {
        return mapper.Saddjxmx(list);
    }

    @Override
    public int sdeljxmx(List<Map> list) {
        return mapper.sdeljxmx(list);
    }

    @Override
    public List<Map<String, Object>> getdept() {
        return mapper.getdept();
    }

    @Override
    public List<Map<String, Object>> getyuang(Integer id) {
        return mapper.getyuang(id);
    }

    @Override
    public int Saddjxmb(Map m) {
        return mapper.Saddjxmb(m);
    }

    @Override
    public int Sdeljxmb(int tnaid) {
        return mapper.Sdeljxmb(tnaid);
    }

    @Override
    public int Sdeljxmbmx(int tnaid) {
        return mapper.Sdeljxmbmx(tnaid);
    }

    @Override
    public List<Map> sgetmbmx(int tnaid) {
        return mapper.sgetmbmx(tnaid);
    }

    @Override
    public int saddjxfq(Map m) {
        return mapper.saddjxfq(m);
    }

    @Override
    public List<Map> getjxkh() {
        return mapper.getjxkh();
    }

    @Override
    public int sdeljxkh(int id) {
        return mapper.sdeljxkh(id);
    }

    @Override
    public Map sgetbumen(int id) {
        return mapper.sgetbumen(id);
    }

    @Override
    public List<Map> sgetyg(int id) {
        return mapper.sgetyg(id);
    }

    @Override
    public List<Map> sgetjxkhmb(int id) {
        return mapper.sgetjxkhmb(id);
    }

    @Override
    public List<Map> sbyempidbymb(String empnumber, String perid) {
        return mapper.sbyempidbymb(empnumber,perid);
    }

    @Override
    public List<Map> sgetjxkhygmx(int id) {
        return mapper.sgetjxkhygmx(id);
    }

    @Override
    public List<Map> sgetygkhmx(int id,int pid) {
        return mapper.sgetygkhmx(id,pid);
    }

    @Override
    public Map sgetkhbymbyg(int id) {
        return mapper.sgetkhbymbyg(id);
    }

    @Override
    public List<Map> sgetygbygh(String gh,String did) {
        return mapper.sgetygbygh(gh,did);
    }

    @Override
    public List<Map> sgetygsfpg(String perid, String empid) {
        return mapper.sgetygsfpg(perid,empid);
    }

    @Override
    public List<Map> sgetmbmxbyygkh(int perid) {
        return mapper.sgetmbmxbyygkh(perid);
    }

    @Override
    public Map sgetygbyid(int empid) {
        return mapper.sgetygbyid(empid);
    }

    @Override
    public int saddjxkhpg(List<Map> list) {
        return mapper.saddjxkhpg(list);
    }

    @Override
    public List<Map> sgetyikhyg(String perid, String empid) {
        return mapper.sgetyikhyg(perid,empid);
    }

    @Override
    public List<Map> sgetsfqj(String empnum) {
        return mapper.sgetsfqj(empnum);
    }

    @Override
    public List<Map> sgetmbyid(int id) {
        return mapper.sgetmbyid(id);
    }

    @Override
    public List<Map> sgetAll() {
        return mapper.sgetAll();
    }

    @Override
    public List<Map> sgetempdingAll() {
        return mapper.sgetempdingAll();
    }

    @Override
    public int saddykq(List<Map> list) {
        return mapper.saddykq(list);
    }

    @Override
    public int saddyqkhdate(String date) {
        return mapper.saddyqkhdate(date);
    }

    @Override
    public List<Map> sgetbyyf(Map m) {
        return mapper.sgetbyyf(m);
    }

    @Override
    public List<Map> sgetsumyfkh(int a) {
        return mapper.sgetsumyfkh(a);
    }

    @Override
    public List<Map> sgetalled() {
        return mapper.sgetalled();
    }

    @Override
    public Map sgetallby(Map m) {
        return mapper.sgetallby(m);
    }

    @Override
    public int saddycdj(List<Map> list) {
        return mapper.saddycdj(list);
    }


}
