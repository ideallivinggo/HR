<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/11/13
  Time: 8:20
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
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="edit">离职审核</a>
</script>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header" style="height: 60px;padding-top: 15px;">
                    <div class="demoTable layui-form">
                        <div class="layui-inline">
                            <a href="QmanageEntry" class="layui-btn layui-btn-primary">入职管理</a>
                        </div>
                        <div class="layui-inline">
                            <a href="QmanageTurn" class="layui-btn layui-btn-primary">转正管理</a>
                        </div>
                        <div class="layui-inline">
                            <a href="QResignation" style="color: #009688;" class="layui-btn layui-btn-primary">离职管理</a>
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
            ,url:'QueryApplyDimissionYqx'
            ,page: true//开启分页
            ,limit :10//这个是每页面显示多少条，页面跳转后他会自动让下拉框里对应的值设为选中状态
            ,limits: [ 10, 20, 30, 40, 50]
            ,cellMinWidth: 10 //全局定义常规单元格的最小宽度
            ,id:'a'
            ,cols: [[
                {type:'numbers', title: '序号', align:'center'}
                /*,{field:'empid', title: 'empid', align:'center',width:40}
                ,{field:'shenid', title: 'shenid', align:'center',width:40}*/
                ,{field:'empname', title: '姓名', align:'center'}
                ,{field:'sex', title: '性别', align:'center',width:40}
                ,{field:'empnumber', title: '工号', align:'center'}
                ,{field:'deptname', title: '部门', align:'center'}
                ,{field:'emppay', title: '薪资', align:'center'}
                ,{field:'constart', title: '合同签订日期', align:'center'}
                ,{field:'conover', title: '合同结束日期', align:'center'}
                ,{field:'right', title: '操作',toolbar: '#barDemo', align:'center'}
            ]]
        });
        var $ = layui.$, active = {
            reload: function(){
                var empname=$('#name').val();
                //执行重载
                table.reload('a', {
                    url:'QueryApplyDimissionIfYqx',
                    method:'post',
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        empname:empname
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
                    url:'QueryEmpAllApplyYqx',
                    type:'post',
                    data:{"empid":empid},
                    dataType:'json',
                    success:function (data) {
                        window.location.href="QResignationJob"
                    }
                })
            }
        });
        //弹出框


    });

</script>

