<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/23
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <script src="assets/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link  rel="stylesheet" href="../../assets/layui/css/layui.css">

    <style>
    .layui-inline input{
        width: 200px;
        height: 29px;
    }
    </style>
</head>

<body style="width: auto;height: 500px;">


<div class="demoTable layui-form">
    <div class="layui-inline">
        发薪时间:<input readonly="readonly" type="text" id="test1"/>至
        <input readonly="readonly" type="text" id="test2"/>
    </div>
    <div onclick="query()" class="layui-btn" data-type="reload">搜索</div>
</div>



<table class="layui-hide" id="test">

</table >
<input value="${emp.empid}" hidden id="empid">
</body>
</html>
<script>


    laydate.render({
        elem: '#test1'
        ,type: 'datetime'
    });

    laydate.render({
        elem: '#test2'
        ,type: 'datetime'
    });
    layui.use('table', function() {
        var table = layui.table;
        table.render({
            elem: '#test'
            , url: 'L_query_pay'
            , limit: 1
            , limits: [1, 2, 3]
            , where: {empid: $("#empid").val()}
            ,id:'a'
            , cols: [[
                {field: 'statjmonth ', width: 110, title: '统计时间', sort: true}
                , {field: 'empname', width: 85, title: '姓名'}
                , {field: 'worday', width: 90, title: '本月缺勤'}
                , {field: 'worbelate ', width: 90, title: '本月病假'}
                , {field: 'worpaffairs', title: '本月事假', width: 90}
                , {field: 'worweekwork', width: 125, title: '本月周末加班'}
                , {field: 'worpswork ', width: 125, title: '本月平时加班'}
                , {field: 'worhdaywork', width: 125, title: '本月假日加班'}
                , {field: 'worklatesum', width: 125, title: '本月迟到次数'}
                , {field: 'paynumber', width: 110, title: '当前薪资', sort: true}
                , {field: 'paytakehome', width: 110, title: '实发薪资', sort: true}
                , {field: 'paydate', width: 120, title: '发薪资时间', sort: true}
            ]]
            ,page: true
        });
    });

function query() {
    alert("aaaaaaaaa");
    layui.use('table', function() {
        alert("aaaaaaaaaa");
        var table = layui.table;
        table.render({
            elem: '#test'
            , url: 'L_query_pay_time'
            , limit: 1
            , limits: [1, 2, 3]
            , where: {empid: $("#empid").val(),time1:$("#test1").val(),time2:$("#test2").val()}
            , cols: [[
                {field: 'statjmonth ', width: 110, title: '统计时间', sort: true}
                , {field: 'empname', width: 85, title: '姓名'}
                , {field: 'worday', width: 90, title: '本月缺勤'}
                , {field: 'worbelate ', width: 90, title: '本月病假'}
                , {field: 'worpaffairs', title: '本月事假', width: 90}
                , {field: 'worweekwork', width: 125, title: '本月周末加班'}
                , {field: 'worpswork ', width: 125, title: '本月平时加班'}
                , {field: 'worhdaywork', width: 125, title: '本月假日加班'}
                , {field: 'worklatesum', width: 125, title: '本月迟到次数'}
                , {field: 'paynumber', width: 110, title: '当前薪资', sort: true}
                , {field: 'paytakehome', width: 110, title: '实发薪资', sort: true}
                , {field: 'paydate', width: 120, title: '发薪资时间', sort: true}
            ]]
            ,page: true
        });
    });
}

</script>


