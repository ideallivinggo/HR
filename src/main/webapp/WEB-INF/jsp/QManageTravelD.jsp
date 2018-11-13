<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/11/13
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link  rel="stylesheet" href="../../assets/layui/css/layui.css">
    <style>
        .layui-form-label{
            width: 200px;
        }
        #tableY{
            margin-left: 110px;
            text-align: center;
        }
        #tableY td{
            border: 1px solid #818181;
            width: 150px;
            height: 50px;
        }
    </style>
</head>
<body>
<div id="head" style="margin:1%;width:100%;height: 50%;background-color: #19aa8d">
    <div style="overflow:hidden;width:120px;height:120px;border: 1px solid #fff9ec;border-radius:60px;position: absolute;top:10%;left:15%;">
        <h1><img src="../../assets/img/ui-zac.jpg"></h1>
    </div>
    <div style="width:440px;height:140px;position: absolute;top:13%;left:30%;">
        <span style="color: #FFFFFF;font-family:'黑体';"><h3>${list.empname}</h3></span>
        <hr style="color: #FFFFFF;width: 500px;">
        <span style="color: #FFFFFF;font-family:'黑体';font-size:16px;margin-top:100px;">部门:${list.deptname}</span><br>
        <span style="color: #FFFFFF;font-family:'黑体';font-size:16px;margin-top:100px;">入职日期:${list.empstatedate}</span>
    </div>
</div>
<div id="body" style="border-radius:10px;position: absolute;top:35%;left:8%;width:84%;height: 1000px;background-color: #ffffff">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header" style="margin-top: 20px;">
                    <div  style="margin-left: 470px"><h1>出差审核</h1></div>
                </div>
                <div class="layui-card-body">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-form-item" style="margin-top: 20px;">
                            <table id="tableY" >
                                <tr>
                                    <td>姓名</td>
                                    <td colspan="2" style="width: 225px;">${list.empname}</td>
                                    <td>工号</td>
                                    <td colspan="2" style="width: 225px;">${list.empnumber}</td>
                                </tr>
                                <tr>
                                    <td>性别</td>
                                    <td colspan="2">${list.sex}</td>
                                    <td>申请时间</td>
                                    <td colspan="2">${list.shentime}</td>
                                </tr>
                                <tr>
                                    <td>天数</td>
                                    <td colspan="2">${list.leaday}</td>
                                    <td>地点</td>
                                    <td colspan="2">${list.didian}</td>
                                </tr>
                                <tr>
                                    <td>出差路线</td>
                                    <td colspan="2">${list.offreason}</td>
                                    <td>出差时间</td>
                                    <td colspan="2">${list.offdate}</td>
                                </tr>
                                <tr >
                                    <td >申请理由</td>
                                    <td colspan="5" style="height: 150px;">
                                        <textarea name="address" placeholder="请输入内容" style="width: 700px;height: 150px;" class="layui-textarea">${list.offgoods}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="3">部门审核</td>
                                </tr>
                                <tr>
                                    <td>部门主管</td>
                                    <td>${list.pipeople}</td>
                                    <td>审核时间</td>
                                    <td>${list.pidate}</td>
                                </tr>
                                <tr>
                                    <td>留言</td>
                                    <td colspan="3" style="height: 150px;">
                                        <textarea name="address" placeholder="请输入内容" style="width: 550px;height: 150px;" class="layui-textarea">${list.bohui}</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="3">总经理审核</td>
                                </tr>
                                <tr>
                                    <td>姓名</td>
                                    <td>${list.zongshen}</td>
                                    <td>审核时间</td>
                                    <td>${list.zongshendate}</td>
                                </tr>
                                <tr>
                                    <td>留言</td>
                                    <td colspan="3" style="height: 150px;">
                                        <textarea name="address" placeholder="请输入内容" style="width: 550px;height: 150px;" class="layui-textarea">${list.zongbohui}</textarea>
                                    </td>
                                </tr>
                               <%-- <tr>
                                    <td rowspan="2">人事审核</td>
                                </tr>
                                <tr>
                                    <td>留言</td>
                                    <td colspan="3" style="height: 150px;">
                                        <textarea name="address" placeholder="请输入内容" style="width: 550px;height: 150px;" class="layui-textarea"></textarea>
                                    </td>
                                </tr>--%>
                            </table>
                        </div>
                    </div>
                    <div class="demoTable layui-form">
                        <div class="layui-inline">
                            <input value="${list.empid}" id="a" style="display: none;">
                            <input value="${list.offid}" id="b" style="display: none;">
                            <input value="${emp.empname}" id="name" style="display: none;">
                            <button class="layui-btn"  onclick="pass()"  style="margin-top:30px;margin-left: 380px;">同意</button>
                            <button class="layui-btn layui-btn-primary"  style="margin-top:30px;margin-left: 100px;" onclick="TurnDown()">返回</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    function pass() {
        var empid=$("#a").val();
        var offid=$("#b").val();
        var name=$("#name").val();
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
        $.ajax({
            url:'UpdateTravelYqx',
            type:'post',
            data:{"offid":offid,"name":name,"data":currentdate},
            dataType:'text',
            success:function (data) {
                alert(data+"ggggggggggggggg")
                window.location.href="QManageTravel"
            }
        })
    }
    function TurnDown() {
        window.history.back();//返回上一页
    }
</script>