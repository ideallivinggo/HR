package com.aaa.rzhr.ding;

import lombok.Data;

import java.io.Serializable;

/**
 * @author XBJ
 * @date 2018-10-29 20:46
 */

@Data
public class AttendanceQvo implements Serializable {
    private String checkType;     //上下午
    private String userId;        //员工ID
    private long userCheckTime;//实际打卡时间
    private long workDate;      //工作日
    private  long baseCheckTime;//上班基准  （应该上班时间和应该下班时间）
    private String timeResult;//上班结果
}