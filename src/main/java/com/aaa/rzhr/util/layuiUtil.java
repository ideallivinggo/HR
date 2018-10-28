package com.aaa.rzhr.util;

import com.sun.org.apache.bcel.internal.generic.NEW;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @ClassName layuiUtil
 * @Description //TODO
 * @Auther aa
 * @Date 2018/10/26 10:53
 * @Version 1.0
 **/
public class layuiUtil {
    //limit 5 page 2
    public static LayuiFy getData(List<Map> list,Integer limit,Integer page){
        LayuiFy layuiFy=new LayuiFy();
        List<Map> list2=new ArrayList<Map>();
        if(limit>list.size()){
            limit=list.size();
        }
        for (int i=0;i<limit;i++){
            if((page-1)*limit+i>=list.size()){
                break;
            }else {
                list2.add(list.get((page-1)*limit+i));
            }
        }


        layuiFy.setData(list2);
        layuiFy.setCount(list.size());
        return layuiFy;
    }
}
