<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/11
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>培训申请</title>
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <script src="assets/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link  rel="stylesheet" href="../../assets/layui/css/layui.css">
    <style>
        #left{
            float:left;
        }
        #right{
            float:left;
            margin-left: 20px;
        }
        #t1 td{
            border: 1px solid #0A0A0A;
        }
        #t1{
            width:580px;
            margin-top: 20px;
        }
    </style>
</head>
<body style="background-color: #F3F3F3">
<input hidden  id="aa"value="${emp.empid}">
<input hidden id="deptid" value="${emp.deptid}">
    <div id="left"  style="width:700px">
        <table class="layui-hide"  lay-filter="dome" id="test">
        </table >
        <script type="text/html" id="barDemo">
            <button data-method="offset" lay-event="edit" data-type="auto" id="deld" class="layui-btn layui-btn-normal">报名详情</button>
        </script>
    </div>
    <div id="right" style="width:570px">
        <table id="t1">
            <tr><td>课程名称</td><td>课程得分</td><td>状态</td><td>课程评语</td></tr>
        </table>

    </div>
</body>
</html>
<script>
    var parentId=$("#deptid").val();
    layui.use('table', function(){
        var table = layui.table;
        //方法级渲染
        table.render({
            elem: '#test'
            ,url: 'L_query_pei'
            ,cols: [[
                , {field: 'kename', width: 200, title: '课程名称'}
                , {field: 'kebegintime', width:250, title: '课程开始时间',sort: true}
                ,{field: 'keaddress', width: 150, title: '上课地点'}
                ,{fixed: 'right',title: '操作', width: 150,  toolbar: '#barDemo'}
            ]]
        });



        //监听行工具事件
        table.on('tool(dome)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'edit'){
                layer.open({
                    title: '课程详情',
                    area: ['350px', '550px'],
                    btn: ['报名课程'],
                    content: '<div>课程名字：<span >'+data.kename+'</span><br><br>' +
                    '课程描述：<span>'+data.kemiaoshu+'</span><br><br>' +
                    '课程详情：<span>'+data.kexiangqing+'</span><br><br>' +
                    '课程开始时间：<span>'+data.kebegintime+'</span><br><br>' +
                    '课程结束时间：<span>'+data.keendtime+'</span><br><br>' +
                    '课程报名开始时间：<span>'+data.kebaomingtimebegin+'</span><br><br>' +
                    '课程报名结束时间：<span>'+data.kebaomingtimeend+'</span><br><br>' +
                    '上课人数：<span>'+data.kechengmaxren+'</span><br><br>' +
                    '上课地点：<span>'+data.keaddress+'</span><br><br>' +
                     '<input hidden id="empid" value="${emp.empid}"> </div>',
                    btn1: function(index,layero){
                        var keid=data.keid;

                            $.ajax({
                                url: 'L_add_keapply',
                                data: {"empid":$("#empid").val(),"keid":keid,"kstate":1},
                                type: 'POST',
                                dataType: "text",
                                success: function (data) {
                                    if(data="chenggong"){
                                        layer.msg('已提交报名申请');
                                        location=location;
                                        layer.close(index);
                                    }

                                }
                            })
                    },
                });
            }
        });
    });
     $(function () {
         $.ajax({
             url: 'p_query_ke',
             data: {"empid":$("#aa").val()},
             type: 'POST',
             dataType: "JSON",
             success: function (data) {
                 var state="";
                 for(var i=0;i<data.length;i++){
                     if(data[i].keokstate==0){
                         state="未完成"
                     }
                     if(data[i].keokstate==1){
                         state="完成"
                     }

                 var tr="<tr>"
                 tr+="<td>"+data[i].kename+"</td>"
                 tr+="<td>"+data[i].kefenshuo+"</td>"
                 tr+="<td id='stat'>"+state+"</td>"
                 tr+="<td>"+data[i].kepingyu+"</td>"
                 tr+="</tr>";
                    $("#t1").append(tr);
                    var str=$("#t1").html();
                     $("#t1").html(str.replace(/undefined/g,""))
                 }
             }
         })
     })
</script>

