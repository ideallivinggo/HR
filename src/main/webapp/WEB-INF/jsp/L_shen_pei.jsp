<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/12
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>一级培训审核</title>
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
        <a href="L_shen_out"  class="layui-btn layui-btn-primary">出差审批</a>
    </div>
    <div class="layui-inline">
        <a href="L_shen_pei" style="color: #009688;"  class="layui-btn layui-btn-primary">培训审批</a>
    </div>
    <div class="layui-inline">
        <a href="L_shen_zhuan"  class="layui-btn layui-btn-primary">转正审批</a>
    </div>
    <div class="layui-inline">
        申请时间:<input readonly="readonly" type="text" id="test1"/>至
        <input readonly="readonly" type="text" id="test2"/>
        <input  id="deptid"hidden value="${emp.deptid}"/>
    </div>
    <div onclick="query()" class="layui-btn" data-type="reload">搜索</div>
    <div  style="margin-left:350px" class="layui-btn" data-type="reload"><a href="L_yishen_pei">已审批</a></div>
</div>
<table class="layui-hide"  lay-filter="dome" id="test">
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
    var parentId=$("#deptid").val();
    layui.use('table', function(){
        var table = layui.table;
        //方法级渲染
        table.render({
            elem: '#test'
            ,url: 'L_query_kecheng'
            , limit: 1
            , limits: [1, 2, 3]
            ,where:{
                "deptid":parentId
            }
            ,cols: [[
                ,{field: 'empname', width: 150, title: '员工姓名'}
                , {field: 'kename', width: 200, title: '课程名称'}
                , {field: 'kebegintime', width:250, title: '课程开始时间',sort: true}
                , {field: 'keendtime', width:250, title: '课程结束时间',sort: true}
                ,{field: 'keaddress', width: 150, title: '上课地点'}
                ,{field: 'deptname', width: 150, title: '部门'}
                ,{fixed: 'right',title: '操作', width: 150,  toolbar: '#barDemo'}
            ]]
            ,id: 'testReload'
            ,page: true
            ,height: 315
        });
        var $ = layui.$, active = {
            reload: function(){
                //执行重载
                table.reload('testReload', {
                    url:'L_query_kecheng_a',
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
                    title: '审核',
                    area: ['800px', '500px'],
                    btn: ['同意申请', '驳回申请'],
                    content: '<div>课程名字：<span >'+data.kename+'</span><br><br>' +
                    '课程描述：<span>'+data.kemiaoshu+'</span><br><br>' +
                    '课程详情：<span>'+data.kexiangqing+'</span><br><br>' +
                    '课程报名开始时间：<span>'+data.kebaomingtimebegin+'</span><br><br>' +
                    '课程报名结束时间：<span>'+data.kebaomingtimeend+'</span><br><br>' +
                    '上课人数：<span>'+data.kechengmaxren+'</span><br><br>' +
                    '上课地点：<span>'+data.keaddress+'</span><br><br>' +
                    '审核理由：<input id="bohui"/><br><br>' +
                    '<input hidden id="empid" value="${emp.empid}"><input hidden id="pipeople" value="${emp.empname}"> </div>',
                    btn1: function(index,layero){
                        var zhi=$("#bohui").val();
                        var kaid=data.kaid;

                        if(zhi==""){
                            alert("请填写理由");
                        }else{
                            $.ajax({
                                url: 'L_upd_pei',
                                data: {"bohui":$("#bohui").val(),"pipeople":$("#pipeople").val(),"kstate":2,"kaid":kaid},
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
                        var zhi=$("#bohui").val();
                        var kaid=data.kaid;

                        if(zhi==""){
                            alert("请填写理由");
                        }else{
                            $.ajax({
                                url: 'L_upd_pei',
                                data: {"bohui":$("#bohui").val(),"pipeople":$("#pipeople").val(),"kstate":4,"kaid":kaid},
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
                        return false


                    }
                });


            }
        });
    });

</script>
