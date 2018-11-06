<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/11/1
  Time: 9:21
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
<%--<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="edit">入职</a>
   &lt;%&ndash; {{# if(d.empstateid==1){ }}
    <a class="layui-btn layui-btn-sm layui-btn-warm" lay-event="edit2">转正</a>
    {{# } }}&ndash;%&gt;

</script>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header" style="height: 60px;">
                    <div class="demoTable layui-form">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-inline">
                            <input type="text" id="name"  autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-btn" data-type="reload">搜索</div>
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
    layui.use(['form', 'layedit', 'laydate','table'], function(){
        var table = layui.table;
        table.render({
            elem: '#EmpState'
            ,url:'QueryEmpState'
            ,page: true//开启分页
            ,limit :5//这个是每页面显示多少条，页面跳转后他会自动让下拉框里对应的值设为选中状态
            ,limits: [ 5, 10, 20, 30, 40, 50]
            ,cellMinWidth: 10 //全局定义常规单元格的最小宽度
            ,id:'a'
            ,cols: [[
                {type:'numbers', title: '序号', align:'center'}
                ,{field:'empname', title: '姓名', align:'center'}
                ,{field:'sex', title: '性别', align:'center'}
                ,{field:'empnumber', title: '工号', align:'center'}
                ,{field:'deptname', title: '部门', align:'center'}
                ,{field:'emppay', title: '薪资', align:'center'}
                /* ,{field:'empstateid', title: '入职状态id', align:'center', sort: true}*/
                ,{field:'statename', title: '状态名称', align:'center'}
                ,{field:'right', title: '操作',toolbar: '#barDemo', align:'center'}
            ]]
        });
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#name').val();
                alert(demoReload)
                //执行重载
                table.reload('a', {
                    url:'QueryEmpState',
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
            var empstateid=data.empstateid;
            var empid = data.empid;
            alert(empid+"wwwwwwwwwwwwwwwww"+empstateid)
            if(obj.event === 'edit'){
                layer.confirm('是否让该员工入职？', function(index){
                    $.ajax({
                        url:'UpdateEmpState',
                        type:'post',
                        data:{"empstateid":empstateid,"empid":empid},
                        dataType:'text',
                        success:function (data) {
                            alert(data)
                            location.reload();
                        }
                    })
                });
            }
        });
    });
</script>--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="edit">入职</a>
</script>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header" style="height: 60px;">
                    <div class="demoTable layui-form">
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-inline">
                            <input type="text" id="name"  autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-btn" data-type="reload">搜索</div>
                    </div>
                </div>
                <div class="layui-card-body" style="height:90%;">
                    <table class="layui-hide" id="Resume" lay-filter="test"></table>
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
            elem: '#Resume'
            ,url:'QueryResumeYqx'
            ,page: true//开启分页
            ,limit :5//这个是每页面显示多少条，页面跳转后他会自动让下拉框里对应的值设为选中状态
            ,limits: [ 5, 10, 20, 30, 40, 50]
            ,cellMinWidth: 10 //全局定义常规单元格的最小宽度
            ,id:'a'
            ,cols: [[
                {type:'numbers', title: '序号', align:'center'}
                ,{field:'actname', title: '姓名', align:'center'}
                ,{field:'sex', title: '性别', align:'center'}
                ,{field:'actnumber', title: '工号', align:'center'}
                ,{field:'resmajor', title: '专业', align:'center'}
                ,{field:'actpwd', title: '密码', align:'center'}
                ,{field:'phone', title: '手机', align:'center'}
                ,{field:'emali', title: '邮箱', align:'center'}
                ,{field:'right', title: '操作',toolbar: '#barDemo', align:'center'}
            ]]
        });
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#name').val();
                alert(demoReload)
                //执行重载
                table.reload('a', {
                    url:'QueryResumeYqx',
                    method:'post',
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        actname: demoReload
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
            alert(data.actname)
            /*var empstateid=data.empstateid;*/
            if(obj.event === 'edit'){
                $.ajax({
                    url:'QaddEmpYqx',
                    type:'post',
                    data:{"actname":data.actname,"actnumber":data.actnumber,"sex":data.sex,"phone":data.phone,"emali":data.emali,"actpwd":data.actpwd},
                    dataType:'json',
                    success:function (actDate) {
                        alert(actDate)
                        window.location.href="QaddEmp"
                    }
                })
            }
            /*if(obj.event === 'edit'){

                /!*layer.confirm('是否让该员工入职？', function(index){
                    $.ajax({
                        url:'UpdateEmpState',
                        type:'post',
                        data:{"empstateid":empstateid,"empid":empid},
                        dataType:'text',
                        success:function (data) {
                            alert(data)
                            location.reload();
                        }
                    })
                });*!/
            }*/
        });
    });
</script>

