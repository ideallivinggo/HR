<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/14
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人加班记录</title>
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
        <a href="L_kai_jiaban"  style="color: #009688;" class="layui-btn layui-btn-primary">加班</a>
    </div>
    <div class="layui-inline">
        <a href="L_kai_leave" class="layui-btn layui-btn-primary">休假</a>
    </div>
    <div class="layui-inline">
        <a href="L_kai_lizhi" class="layui-btn layui-btn-primary">离职</a>
    </div>
    <div class="layui-inline">
        申请时间:<input readonly="readonly" type="text" id="test1"/>至
        <input readonly="readonly" type="text" id="test2"/>
        <input id="empid" hidden value="${emp.empid}"/>
    </div>
    <div onclick="query()" class="layui-btn" data-type="reload">搜索</div>
</div>



<table class="layui-hide"  lay-filter="dome" id="test">

</table >
<script type="text/html" id="barDemo">
    <button data-method="offset" lay-event="edit" data-type="auto" id="deld" class="layui-btn layui-btn-normal">详情</button>
</script>
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
    var emp=$("#empid").val();
    layui.use('table', function(){
        var table = layui.table;
        //方法级渲染
        table.render({
            elem: '#test'
            ,url: 'J_query_jiaban_shen'
            , limit: 1
            , limits: [1, 2, 3]
            ,where:{
                "empid":emp
            }
            ,cols: [[
                , {field: 'empname', width: 150, title: '姓名'}
                , {field: 'apovtype', width: 180, title: '加班类型'}
                , {field: 'apoverdate', width:200, title: '申请时间'}
                , {field: 'apovstartdate', width:350, title: '加班时间段'}
                , {field: 'deptname', title: '部门', width: 150}
                , {field: 'apovstate', title: '审核状态', width: 160,templet:function(d){
                    return d.apovstate == "4" ? "已通过": d.apovstate=="2" ? "驳回" : "审核中"
                }}
                ,{fixed: 'right',title: '操作', width: 100, align:'center', toolbar: '#barDemo'}
            ]]
            ,id: 'testReload'
            ,page: true
            ,height: 315
        });

        var $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('testReload', {
                    url:'J_query_jiaban_shen_a',
                    method:'post',
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        time1:$("#test1").val(),time2:$("#test2").val(), empid:emp
                    }
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //监听行工具事件
        table.on('tool(dome)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'edit'){

                layer.open({
                    title: '详情',
                    area: ['800px', '520px'],
                    btn: ['关闭'],
                    content: '<div id="cont">姓名：<span >'+data.empname+'</span>&nbsp&nbsp&nbsp&nbsp<span style="font-size: 12px">'+data.shentime+'</span><br><br>' +
                    '请假类型：<span>'+data.apovtype+'</span><br><br>' +
                    '请假时间段：<span>'+data.apovstartdate+'</span><br><br>' +
                    '请假理由：<span>'+data.apovreason+'</span><br><br>' +
                    '一级审批人/审批时间：<span>'+data.pipeople+'</span>&nbsp&nbsp&nbsp&nbsp<span>'+data.shentime+'</span><br><br>' +
                    '通过理由：<span>'+data.bohui+'</span><br><br>' +
                    '总经理审批/审批时间：<span>'+data.zongshen+'/</span><span>'+data.zongshendate+'</span><br><br>' +
                    '审批理由：<span>'+data.zongbohui+'</span><br><br>' +
                    '人事审批/审批时间：<span>'+data.renshishen+'/</span><span>'+data.renshishendate+'</span><br><br></div>',
                    success: function(layero, index){
                        var str=layero.find("#cont").html();
                        layero.find("#cont").html(str.replace(/undefined/g,""));
                    }

                });


            }
        });
    });

</script>