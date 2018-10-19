package com.aaa.rzhr.pojo;

/**
 * @author YLP
 * @date 2018-10-14 16:46
 * 部门表
 */
public class Dept {

  private Integer deptid;
  private String deptname;
  private String pdeptid;


  public Integer getDeptid() {
    return deptid;
  }

  public void setDeptid(Integer deptid) {
    this.deptid = deptid;
  }


  public String getDeptname() {
    return deptname;
  }

  public void setDeptname(String deptname) {
    this.deptname = deptname;
  }


  public String getPdeptid() {
    return pdeptid;
  }

  public void setPdeptid(String pdeptid) {
    this.pdeptid = pdeptid;
  }

}
