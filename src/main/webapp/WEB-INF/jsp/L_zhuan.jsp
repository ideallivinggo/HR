<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/12
  Time: 8:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请假申请</title>
    <script src="assets/js/laydate/laydate.js"></script>
    <script src="assets/js/jquery-1.10.2.min.js"></script>
    <style>
        body{padding-left: 100px;
            padding-top: 20px;
        }
        .demo-footer a{padding: 0 5px; color: #01AAED;}
        #body{
            background-color: #FFFFFF;
            width: 1100px;
            padding-top:50px;
            padding-left: 40px;
            height:auto;
        }
        #top{
            width: 1060px;
            height:20px;
            font-weight:700;
            color: #19AA8D;
            border-bottom:1px solid #babcbf;
        }
        #center{
            width: 900px;
            height:500px;
            border:1px solid #19AA8D;
            margin-top: 20px;
            margin-left: 100px;
        }


        .layui-form div{
            margin-top: 18px;
            margin-left: 20px;
        }
        .layui-form{
            font-weight: 700;
            font-size: 12px;
        }
    </style>
</head>
<body style="background-color: #F3F3F3">
<div id="body">
    <div id="top">转正申请</div>
    <div id="center" class="layui-input-block">
        <center>
            <div style="color:#0A0A0A;font-size: 16px;font-weight:800">实习报告</div>
        <form class="layui-form" action="L_add_zhuan" method="post">
            <div class="layui-form-item layui-form-text">
                <div class="layui-input-block" style="margin-left:55px">
                    <textarea name="shentext" maxlength="255" placeholder="报告字数为255以内" style="width:500px;height:300px"required lay-verify="required"  class="layui-textarea"></textarea>
                </div>
            </div>
            <%--员工id--%>
            <input style="display: none" name="empid"value="${emp.empid}">
            <input style="display: none" name="deptid"value="${emp.deptid}">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button style="margin-left: 200px" class="layui-btn" lay-submit lay-filter="*">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
        </center>
    </div>

</div>
</body>
</html>

