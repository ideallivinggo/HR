package com.aaa.rzhr.pojo;


public class Rzmessage {

  private long meid;
  private String metext;
  private String begintime;
  private String endtime;
  private String mestate;
  private String metitle;
  private Integer deptid;

  public Integer getDeptid() {
    return deptid;
  }

  public void setDeptid(Integer deptid) {
    this.deptid = deptid;
  }

  public String getMetitle() {
    return metitle;
  }

  public void setMetitle(String metitle) {
    this.metitle = metitle;
  }

  public long getMeid() {
    return meid;
  }

  public void setMeid(long meid) {
    this.meid = meid;
  }


  public String getMetext() {
    return metext;
  }

  public void setMetext(String metext) {
    this.metext = metext;
  }


  public String getBegintime() {
    return begintime;
  }

  public void setBegintime(String begintime) {
    this.begintime = begintime;
  }


  public String getEndtime() {
    return endtime;
  }

  public void setEndtime(String endtime) {
    this.endtime = endtime;
  }


  public String getMestate() {
    return mestate;
  }

  public void setMestate(String mestate) {
    this.mestate = mestate;
  }

}
