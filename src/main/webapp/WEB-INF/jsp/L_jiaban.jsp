<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/23
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>加班申请</title>
    <script src="assets/js/laydate/laydate.js"></script>
    <script src="assets/js/jquery-1.10.2.min.js"></script>
    <style>
        #top{
            margin-top: 25px;
            color:#19AA8D;
            font-size:14px;
            width:1060px;
            height:25px;
            font-weight:700;
            padding-left: 30px ;
            border-bottom:1px solid #19AA8D;
            padding-top:30px;
        }
        #center{
            margin-left: 200px;
            margin-top:50px;
        }
        #center  form input{
            width: 255px;
                border-radius:4px;
        }
        #center form select{
            width: 255px;
            border-radius:4px;
        }
      #center{
          font-size: 13px;
          color: #4B4B4B;
          font-weight:700;

      }
    </style>
</head>
<body style="background-color:#EFEFEF">
    <div style="background-color: #FFFFFF;width: 1090px;height: 500px;margin-left:100px;margin-top: 10px">

            <div  id="top">申请加班</div>
            <div id="center">
                <form  action="L_add_jiaban" class="layui-form">
                    <input value="${emp.empid}" hidden name="empid">
                    <input style="display: none" name="deptid"value="${emp.deptid}">
                    加班类型：<select name="apovtype" required lay-verify="required">
                                 <option></option>
                                 <option>工作日加班</option>
                                 <option>节假日加班</option>
                                 <option>休息日加班</option>
                            </select><br/><br/>
                    加班时间：<input name="apovstartdate" required lay-verify="required" readonly="readonly" type="text" class="demo-input" placeholder="请选择日期" id="test16">
                    <br/><br/>
                    加班时长：<input   value="0" style="width: 100px" name="apovhour_1"  maxlength="3" oninput="value=value.replace(/[^\d.]/g,'')"/>天<input name="apovhour_2"  maxlength="3" oninput="value=value.replace(/[^\d.]/g,'')" style="width: 100px;margin-left: 15px"  required lay-verify="required"/>小时  <span style="font-size: 14px;color:#E1E2E6;margin-left:70px">请假时长为0.5的整数倍,日常工作时间8小时</span>
                    <br/><br/>
                    申请理由:<textarea name="apovreason" required lay-verify="required" style="width:600px;height:25px; border-radius:4px;"required lay-verify="required" placeholder="请输入" ></textarea>
                    <div class="layui-form-item" style="margin-top:100px;margin-left: 50px  ">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
    </div>
</body>
</html>
<script>
    lay('#version').html('-v'+ laydate.v);
    //执行一个laydate实例
    laydate.render({
        elem: '#test16'
        ,type: 'datetime'
        ,range: '至'
        ,format: 'yyyy-MM-dd HH:mm:ss'
    });
</script>

