package com.aaa.rzhr.util;

import java.util.List;
import java.util.Map;

public class LayuiFy {
 private Integer code=0;
 private String msg="";
 private Integer count;
 private Integer limit;
 private Integer page;
 private List<Map> data;
 private Integer curr=1;
 
 
public Integer getLimit() {
	return limit;
}
public void setLimit(Integer limit) {
	this.limit = limit;
}
public Integer getPage() {
	return page;
}
public void setPage(Integer page) {
	this.page = page;
}
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
public Integer getCurr() {
	return curr;
}
public void setCurr(Integer curr) {
	this.curr = curr;
}

 
}
