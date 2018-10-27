<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/10/26
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link  rel="stylesheet" href="../../assets/layui/css/layui.css">
</head>
<body>

<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header" style="height: 60px;">
                    <div class="layui-form">
                        <div class="layui-inline" style="width:150px;padding:10px 0 10px 80px;text-align: center;float: left;">
                            <select id="StateId">
                                <option value="">--入职状态--</option>
                            </select>
                        </div>
                        <div style="float: left;padding:10px 0 0 0; ">
                            <button class="layui-btn" onclick="QueryStateId()">查询</button>
                        </div>
                    </div>
                </div>
                <div class="layui-card-body" style="height:90%;">
                    <table class="layui-hide" id="EmpState"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    layui.use(['form', 'layedit', 'laydate','table'], function(){
        var table = layui.table;

        table.render({
            elem: '#EmpState'
            ,url:'QueryEmpState'
            ,page: true//开启分页
            ,limit :5//这个是每页面显示多少条，页面跳转后他会自动让下拉框里对应的值设为选中状态
            ,limits: [ 5, 10, 20, 30, 40, 50]
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度
            ,id:'a'
            ,cols: [[
                {type:'numbers', title: '序号', align:'center'}
                ,{field:'empname', title: '姓名', align:'center'}
                ,{field:'empnumber', title: '工号', align:'center'}
                ,{field:'empstateid', title: '入职状态id', align:'center', sort: true}
                ,{field:'statename', title: '状态名称', align:'center'}
            ]]

        });
    });
    $(function () {
        queryState();
    })
    function queryState() {
        $.ajax({
            url:'QueryEmpStateName',
            type:'post',
            data:{},
            dataType:'json',
            success:function (data) {
                for (var i=0;i<data.length;i++){
                    $("#StateId").append("<option value='"+data[i].empstateid+"'>"+data[i].statename+"</option>");
                }
            }
        })
    }
    function QueryStateId() {
        var id = $("#StateId").val();
        alert(id);
        table.reload(a,{
            url:'QueryEmpState'
            ,method: 'POST'
            ,page: {
                curr: 1 //重新从第 1 页开始
            }
            ,where: {
                empstateid: id
            }
        });

    }
</script>

