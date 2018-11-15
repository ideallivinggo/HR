package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.Keemp;
import com.aaa.rzhr.service.KeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class KeController {
    @Autowired
    private KeService keService;
    @RequestMapping("p_query_ke")
    public  @ResponseBody List<Map> p_query_ke(Integer empid) {
        System.out.println(empid+"aaaaaaaaaaaaaaaaaa");
        return keService.p_query_ke(empid);
    }
}
