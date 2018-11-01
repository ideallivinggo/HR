package com.aaa.rzhr.web;

import io.goeasy.GoEasy;
import io.goeasy.publish.Publisher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author XBJ
 * @date 2018-10-25 9:19
 */
@Controller
public class websocket {

     @RequestMapping("websocket")
  public  String  websocket(){
      System.out.println("进入websocket");
         GoEasy goEasy = new GoEasy("http://rest-hangzhou.goeasy.io", "BC-ce1dd32a157e46f892f1dc98a07ebaad");
         goEasy.publish("testChannel","测试");

      return "websocket";
  }

 @RequestMapping("ajaxwebsocket")
  public @ResponseBody String  ajaxwebsocket(){
     GoEasy goEasy = new GoEasy("http://rest-hangzhou.goeasy.io", "BC-ce1dd32a157e46f892f1dc98a07ebaad");
     goEasy.publish("channe2","2♈今天");
      return "ok";
  }
}
