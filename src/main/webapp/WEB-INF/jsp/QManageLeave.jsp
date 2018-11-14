<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/11/13
  Time: 10:04
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
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="edit">假期审核</a>
</script>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header" style="height: 60px;padding-top: 15px;">
                    <div class="demoTable layui-form">
                        <div class="layui-inline">
                            <a href="QManageLeave" style="color: #009688;" class="layui-btn layui-btn-primary">请假管理</a>
                        </div>
                        <div class="layui-inline">
                            <a href="QManageOvertime" class="layui-btn layui-btn-primary">加班管理</a>
                        </div>
                        <div class="layui-inline">
                            <a href="QManageTravel" class="layui-btn layui-btn-primary">出差管理</a>
                        </div>
                        <div class="layui-inline">
                            <input type="text" id="name" placeholder="姓名" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-btn" data-type="reload">搜索</div>
                        <button onclick="Reload() " class="layui-btn">刷新</button>
                    </div>
                </div>
                <div class="layui-card-body" style="height:90%;">
                    <table class="layui-hide" id="EmpState" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script>
    layui.use(['form', 'layedit', 'laydate','table','layer'], function(){
        var table = layui.table;
        var $ = layui.jquery,layer = layui.layer;
        table.render({
            elem: '#EmpState'
            ,url:'QueryLeaveYqx'
            ,page: true//开启分页
            ,limit :10//这个是每页面显示多少条，页面跳转后他会自动让下拉框里对应的值设为选中状态
            ,limits: [ 10, 20, 30, 40, 50]
            ,cellMinWidth: 10 //全局定义常规单元格的最小宽度
            ,id:'a'
            ,cols: [[
                {type:'numbers', title: '序号', align:'center'}
                ,{field:'empname', title: '姓名', align:'center'}
                ,{field:'sex', title: '性别', align:'center',width:40}
                ,{field:'empnumber', title: '工号', align:'center'}
                ,{field:'deptname', title: '部门', align:'center'}
                ,{field:'leatype', title: '假期类型', align:'center'}
                ,{field:'leaenterdate', title: '开始时间', align:'center'}
                ,{field:'leaday', title: '休假天数', align:'center'}
                ,{field:'right', title: '操作',toolbar: '#barDemo', align:'center'}
            ]]
        });
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#name').val();
                //执行重载
                table.reload('a', {
                    url:'QueryLeaveYqx',
                    method:'post',
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        empname: demoReload
                    }
                });
            }
        };
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            var empid = data.empid;
            if(obj.event === 'edit'){
                $.ajax({
                    url:'QueryLeaveDYqx',
                    type:'post',
                    data:{"empid":empid},
                    dataType:'json',
                    success:function (data) {
                        window.location.href="QManageLeaveD"
                    }
                })
            }
        });
    });
    //刷新整个页面
    function Reload(){
        location.reload();
    }
</script>
