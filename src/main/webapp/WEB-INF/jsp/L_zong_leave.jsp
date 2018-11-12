<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/7
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>总经理审核休假</title>
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
        申请时间:<input readonly="readonly" type="text" id="test1"/>至
        <input readonly="readonly" type="text" id="test2"/>
    </div>
    <div onclick="query()" class="layui-btn" data-type="reload">搜索</div>
</div>
<a href="L_zong_jiaban">加班</a>
<a href="L_zong_lizhi">离职</a>


<table class="layui-hide" lay-filter="dome" id="test">
</table >

<script type="text/html" id="barDemo">
    <button data-method="offset" lay-event="edit" data-type="auto" id="deld" class="layui-btn layui-btn-normal">审核</button>
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
    layui.use('table', function(){
        var table = layui.table;

        //方法级渲染
        table.render({
            elem: '#test'
            ,url: 'J_query_xiujia'
            , limit: 1
            , limits: [1, 2, 3]
            ,cols: [[
                , {field: 'empname', width: 130, title: '姓名'}
                , {field: 'leatype', width: 120, title: '请假类型'}
                , {field: 'shendate', width: 180, title: '申请时间'}
                , {field: 'leaenterdate', width:600, title: '请假时间段'}
                , {field: 'deptname', title: '部门', width: 150}
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
                    url:'J_query_xiujia_a',
                    method:'post',
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                     time1:$("#test1").val(),time2:$("#test2").val()
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
                        title: '休假审核',
                        area: ['800px', '500px'],
                        btn: ['同意申请', '驳回申请'],
                        content: '<div>姓名：<span >'+data.empname+'</span>&nbsp&nbsp&nbsp&nbsp<span style="font-size: 12px">'+data.shendate+'</span><br><br>' +
                        '请假类型：<span>'+data.leatype+'</span><br><br>' +
                        '请假时间段：<span>'+data.leaenterdate+'</span><br><br>' +
                        '请假理由：<span>'+data.leareason+'</span><br><br>' +
                        '一级审批人/审批时间：<span>'+data.pipeople+'</span>&nbsp&nbsp&nbsp&nbsp<span>'+data.pidate+'</span><br><br>' +
                        '通过理由：<span>'+data.bohui+'</span><br><br>' +
                        '审批理由：<input type="text" style="width: 350px" id="zongbohui"/><input hidden id="zongshen" value="${emp.empname}"><br><br></div>',
                         btn1: function(index,layero){
                            var zhi=$("#zongbohui").val();
                            var leaid=data.leaid;

                     if(zhi==""){
                         alert("请填写理由");
                          }else{
                         $.ajax({
                             url: 'J_update_xiujia',
                             data: {"zongbohui":$("#zongbohui").val(),"zongshen":$("#zongshen").val(),"leasate":5,"leaid":leaid},
                             type: 'POST',
                             dataType: "text",
                             success: function (data) {
                                 if(data="chenggong"){
                                     location=location;
                                     layer.close(index);
                                 }

                             }
                         })

                     }
                         },
                        btn2:function(index,layero){
                            var leaid=data.leaid;
                            var zhi=$("#zongbohui").val();
                            if(zhi==""){
                                alert("请填写理由");
                                return false
                            }else{
                                $.ajax({
                                    url: 'J_update_xiujia',
                                    data: {"zongbohui":$("#zongbohui").val(),"zongshen":$("#zongshen").val(),"leasate":2,"leaid":leaid},
                                    type: 'POST',
                                    dataType: "text",
                                    success: function (data) {
                                        if(data="chenggong"){
                                            layer.close(index);
                                            location=location;
                                        }

                                    }
                                })
                                return false

                            }
                        }
                    });


            }
        });
    });

</script>
