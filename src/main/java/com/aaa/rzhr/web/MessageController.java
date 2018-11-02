package com.aaa.rzhr.web;

import com.aaa.rzhr.pojo.Rzmessage;
import com.aaa.rzhr.service.RzmessageService;
import io.goeasy.GoEasy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @author XBJ
 * @date 2018-11-02 9:55
 */
@RestController
@RequestMapping("/sendmessage")
public class MessageController {

    @Autowired
    RzmessageService rzmessageService;

    @RequestMapping("/zhong")
    public String sendZhong(Rzmessage rzmessage) {

        int a= rzmessageService.addRzmessageX(rzmessage);
        if (a>0){
               String tongzhi=rzmessage.getMetitle()+"♈"+rzmessage.getMetext();
            System.out.println(tongzhi+"++++tongzhitongzhitongzhitongzhi");

            GoEasy goEasy = new GoEasy("http://rest-hangzhou.goeasy.io", "BC-ce1dd32a157e46f892f1dc98a07ebaad");
            goEasy.publish("zhong",tongzhi);

            return "ok";
        }else {
            return "no";
        }
    }

}
