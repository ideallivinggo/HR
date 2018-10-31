package com.aaa.rzhr.service;

import com.aaa.rzhr.dao.SpaydataMapper;
import com.aaa.rzhr.pojo.Att_Statistics;
import com.aaa.rzhr.pojo.Latedata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aaa.rzhr.pojo.Payrolldata;

import java.text.DecimalFormat;
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
    public List<Map> SgetAll(Integer id) {
        DecimalFormat format=new DecimalFormat("#.##");
        List<Map>  list=mapper.SgetAll(2);
       List<Payrolldata> pay= mapper.Sgetpaydata();
        List<Latedata> late=mapper.Sgetlate();
        Double shuilv=null;
         Double chidaok=null;
        Double pjiaban=null;
        Double zjiaban=null;
        Double jjiaban=null;
        Double queqink=null;
        Double shijiak=null;
        Double bingjiak=null;
        Double jixiao=null;
        Double gerenshui=null;
        Double shifa=null;
        Double jiaban=null;
        for(int i=0;i<list.size();i++) {
            Map map = list.get(i);
            queqink = (Double) map.get("paynumber") * pay.get(0).getPayrbase() / pay.get(0).getPayrdays() * (Double) map.get("worday");
            map.put("queqink", format.format(queqink));
            shijiak = (Double) map.get("paynumber") * pay.get(1).getPayrbase() / pay.get(1).getPayrdays() / pay.get(1).getPayrhour() * (Double) map.get("worpaffairs");
            map.put("shijiak", format.format(shijiak));
            bingjiak = (Double) map.get("paynumber") * pay.get(2).getPayrbase() / pay.get(2).getPayrdays() / pay.get(2).getPayrhour() * (Double) map.get("worbelate");
            map.put("bingjiak", format.format(bingjiak));
            pjiaban = (Double) map.get("paynumber") * pay.get(3).getPayrbase() / pay.get(3).getPayrdays() / pay.get(3).getPayrhour() * (Double) map.get("worpswork")*pay.get(3).getPayrpacific();
            map.put("pjiaban", format.format(pjiaban));
            zjiaban = (Double) map.get("paynumber") * pay.get(3).getPayrbase() / pay.get(3).getPayrdays() / pay.get(3).getPayrhour() * (Double) map.get("worweekwork")*pay.get(3).getPayrweekend();
            map.put("zjiaban", format.format(zjiaban));
            jjiaban = (Double) map.get("paynumber") * pay.get(3).getPayrbase() / pay.get(3).getPayrdays() / pay.get(3).getPayrhour() * (Double) map.get("worhdaywork")*pay.get(3).getPayrlegal();
            map.put("jjiaban", format.format(jjiaban));
            Double latesum = (Double) map.get("worklatesum");
            jiaban=jjiaban+zjiaban+pjiaban;
            map.put("jiaban", format.format(jiaban));
            if (latesum>0) {
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
            gerenshui=nashuie*shuilv;
            map.put("gerenshui",format.format(gerenshui));
            shifa=(Double) map.get("paynumber")-chidaok-gerenshui-shijiak-bingjiak-queqink+pjiaban+zjiaban+jjiaban;
            map.put("shifa",format.format(shifa));
       }
        return list;
    }

    @Override
    public int Saddpayroll(Map m) {
        return mapper.Saddpayroll(m);
    }


}
