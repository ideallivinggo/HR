<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/18
  Time: 8:34
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
        .demo-input{padding-left: 10px; height: 38px; min-width: 350px; line-height: 38px; border: 1px solid #e6e6e6;  background-color: #fff;  border-radius: 2px;}
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
        #sel{
            width: 350px;
            height: 20px;
        }
    </style>
</head>
<body style="background-color: #F3F3F3">
<div id="body">
    <div id="top">申请信息</div>
    <div id="center" class="layui-input-block">
        <form class="layui-form" action="upload" method="post" enctype="multipart/form-data" >
            <%--请假理由--%>
            <div>
               请假理由:<select id="sel"  name="leatype" required lay-verify="required">
                    <option value="事假">事假</option>
                    <option value="产假">产假</option>
                    <option value="病假">病假</option>
                </select>
            </div>
                <%--请假日期--%>
            <div>
              休假时间:<input name="leaenterdate" readonly="readonly" required lay-verify="required" type="text" class="demo-input" placeholder="请选择日期" id="test16">
            </div>
                <div>
                    请假时长:<input type="text" name="leaday"  required lay-verify="required" style="width: 30px;height: 25px"  maxlength="3" oninput="value=value.replace(/[^\d]/g,'')">
                    <input type="button" value="天"/>
                    <span style="font-size: 14px;color:#E1E2E6;margin-left: 100px">请假时长为1的整数倍</span>
                </div>
                <%--请假理由--%>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">申请事由:</label>
                <div class="layui-input-block" style="margin-left:55px">
                    <textarea name="leareason" style="width:600px;height:80px"required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                </div>
            </div>
                <%--员工id--%>
                <input style="display: none" name="empid"value="${emp.empid}">
             <%--w文件上传--%>
                <div>
                    附件上传:<input name="file" accept="image/*" style="width:600px" type="file" >
                </div>
            <div class="layui-form-item">
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
        ,range: '到'
        ,format: 'yyyy年M月d日H时m分s秒'
    });
</script>
