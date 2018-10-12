package com.aaa.rzhr.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
     @RequestMapping("login")
     public  String aa(){
         return "sss";
     }

     @RequestMapping("me")
     public String bb(){

         return "me";
     }
    @RequestMapping("you")
    public String you(){

        return "you";
    }

}
