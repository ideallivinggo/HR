package com.aaa.rzhr.util;

import java.util.List;
import java.util.Map;

/**
 * @author YQL
 * @date 2018/10/26 9:59
 */
public class layuiPage {
    private Integer code=0;
    private List<Map> data;
    private Integer count;
    private String msg="";

    public Integer getCode() {
        return code;
    }
    public void setCode(Integer code) {
        this.code = code;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
    public Integer getCount() {
        return count;
    }
    public void setCount(Integer count) {
        this.count = count;
    }
    public List<Map> getData() {
        return data;
    }
    public void setData(List<Map> data) {
        this.data = data;
    }

}
