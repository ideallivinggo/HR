package com.aaa.rzhr.pojo;

/**
 * @author YLP
 * @date 2018-10-14 16:46
 * 招聘申请表
 */
public class Recruitment {

  private Integer recid;
  private String rectitle;
  private Integer empid;
  private Integer deptid;
  private String recaddress;
  private Integer poid;
  private Integer recnumber;
  private String recreachdate;
  private String recsex;
  private String receducation;
  private String recage;
  private String recsuffer;
  private String recmajor;
  private String recrequire;
  private Integer recstate;

  public String getrectitle() {
    return rectitle;
  }

  public void setrectitle(String rectitle) {
    this.rectitle = rectitle;
  }

  public Integer getRecid() {
    return recid;
  }

  public void setRecid(Integer recid) {
    this.recid = recid;
  }

  public Integer getEmpid() {
    return empid;
  }

  public void setEmpid(Integer empid) {
    this.empid = empid;
  }


  public String getRecaddress() {
    return recaddress;
  }

  public void setRecaddress(String recaddress) {
    this.recaddress = recaddress;
  }


  public Integer getPoid() {
    return poid;
  }

  public void setPoid(Integer poid) {
    this.poid = poid;
  }

  public Integer getDeptid() {
    return deptid;
  }

  public void setDeptid(Integer deptid) {
    this.deptid = deptid;
  }


  public Integer getRecnumber() {
    return recnumber;
  }

  public void setRecnumber(Integer recnumber) {
    this.recnumber = recnumber;
  }


  public String getRecreachdate() {
    return recreachdate;
  }

  public void setRecreachdate(String recreachdate) {
    this.recreachdate = recreachdate;
  }


  public String getRecsex() {
    return recsex;
  }

  public void setRecsex(String recsex) {
    this.recsex = recsex;
  }


  public String getReceducation() {
    return receducation;
  }

  public void setReceducation(String receducation) {
    this.receducation = receducation;
  }


  public String getRecage() {
    return recage;
  }

  public void setRecage(String recage) {
    this.recage = recage;
  }


  public String getRecsuffer() {
    return recsuffer;
  }

  public void setRecsuffer(String recsuffer) {
    this.recsuffer = recsuffer;
  }


  public String getRecmajor() {
    return recmajor;
  }

  public void setRecmajor(String recmajor) {
    this.recmajor = recmajor;
  }


  public String getRecrequire() {
    return recrequire;
  }

  public void setRecrequire(String recrequire) {
    this.recrequire = recrequire;
  }


  public Integer getRecstate() {
    return recstate;
  }

  public void setRecstate(Integer recstate) {
    this.recstate = recstate;
  }

  public Recruitment(Integer recid, Integer empid, Integer deptid, String recaddress, Integer poid, Integer recnumber, String recreachdate, String recsex, String receducation, String recage, String recsuffer, String recmajor, String recrequire, Integer recstate) {
    this.recid = recid;
    this.empid = empid;
    this.deptid = deptid;
    this.recaddress = recaddress;
    this.poid = poid;
    this.recnumber = recnumber;
    this.recreachdate = recreachdate;
    this.recsex = recsex;
    this.receducation = receducation;
    this.recage = recage;
    this.recsuffer = recsuffer;
    this.recmajor = recmajor;
    this.recrequire = recrequire;
    this.recstate = recstate;
  }
}
