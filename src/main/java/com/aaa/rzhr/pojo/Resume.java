package com.aaa.rzhr.pojo;

import java.math.BigInteger;

/**
 * @author YLP
 * @date 2018-10-14 16:46
 * 简历
 */
public class Resume {

  private Integer resid;
  private String resumename;
  private String sex;
  private String education;
  private Integer age;
  private String phone;
  private String resmajor;
  private String resposition;
  private String emali;
  private String resdate;
  private Integer resstate;


  public Integer getResid() {
    return resid;
  }

  public void setResid(Integer resid) {
    this.resid = resid;
  }


  public String getResumename() {
    return resumename;
  }

  public void setResumename(String resumename) {
    this.resumename = resumename;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public String getEducation() {
    return education;
  }

  public void setEducation(String education) {
    this.education = education;
  }


  public Integer getAge() {
    return age;
  }

  public void setAge(Integer age) {
    this.age = age;
  }


  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }


  public String getResmajor() {
    return resmajor;
  }

  public void setResmajor(String resmajor) {
    this.resmajor = resmajor;
  }


  public String getResposition() {
    return resposition;
  }

  public void setResposition(String resposition) {
    this.resposition = resposition;
  }


  public String getEmali() {
    return emali;
  }

  public void setEmali(String emali) {
    this.emali = emali;
  }

  public String getResdate() {
    return resdate;
  }

  public void setResdate(String resdate) {
    this.resdate = resdate;
  }


  public Integer getResstate() {
    return resstate;
  }

  public void setResstate(Integer resstate) {
    this.resstate = resstate;
  }

  public Resume(Integer resid, String resumename, String sex, String education, Integer age, String phone, String resmajor, String resposition, String emali, String resdate, Integer resstate) {
    this.resid = resid;
    this.resumename = resumename;
    this.sex = sex;
    this.education = education;
    this.age = age;
    this.phone = phone;
    this.resmajor = resmajor;
    this.resposition = resposition;
    this.emali = emali;
    this.resdate = resdate;
    this.resstate = resstate;
  }

  public Resume() {
    super();
  }
}
