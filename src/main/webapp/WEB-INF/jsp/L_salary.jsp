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
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../assets/js/layer.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link href="../../assets/layui/css/layui.css" rel="stylesheet">
    <script type="text/javascript" src="../../assets/js/bootstrap-paginator.js"></script>
</head>

<body>

<table class="layui-hide" id="test"></table>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'L_query_pay'
            ,cols: [[
                {field:'empid', width:80, title: 'ID', sort: true}
                ,{field:'empname', width:80, title: '用户名'}
                ,{field:'sex', width:80, title: '性别', sort: true}
                ,{field:'city', width:80, title: '城市'}
                ,{field:'sign', title: '签名', minWidth: 150}
                ,{field:'experience', width:80, title: '积分', sort: true}
                ,{field:'score', width:80, title: '评分', sort: true}
                ,{field:'classify', width:80, title: '职业'}
                ,{field:'wealth', width:135, title: '财富', sort: true}
            ]]
            ,page: true
        });
    });
</script>

</body>
</html>


