<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/24
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>离职申请</title>
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
    <div id="top">申请离职信息</div>
    <div id="center" class="layui-input-block">
        <form class="layui-form" action="L_add_lizhi">
            <%--离职理由--%>
            <div>
                请假理由:<select id="sel"  name="dimtype" required lay-verify="required">
                <option value="离职">离职</option>
                <option value="辞退">辞退</option>
                <option value="退休">退休</option>
            </select>
            </div>
            <%--离职原因理由--%>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">离职原因:</label>
                <div class="layui-input-block" style="margin-left:55px">
                    <textarea name="dimdetails" style="width:600px;height:80px"required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                </div>
            </div>
                <%--对公司的建议--%>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">对公司建议:</label>
                    <div class="layui-input-block" style="margin-left:55px">
                        <textarea name="dimsuggest" style="width:600px;height:80px"required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
                    </div>
                </div>
            <%--员工id--%>
            <input style="display: none" name="empid"value="${emp.empid}">
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div  >
</div>
</body>
</html>

