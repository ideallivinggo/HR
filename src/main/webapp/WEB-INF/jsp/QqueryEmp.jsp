<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/10/29
  Time: 14:41
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
                        <div class="demoTable layui-form">
                            <%--姓名--%>
                            <div class="layui-inline">
                                <input id="empname" class="layui-input" placeholder="姓名">
                            </div>
                            <%--下拉--%>
                            <div class="layui-inline">
                                <select id="ByType">
                                    <option value="">--部门--</option>
                                </select>
                            </div>
                            <%--员工类型--%>
                                <div class="layui-inline">
                                    <select id="ByEmpType">
                                        <option value="">--员工类型--</option>
                                        <option value="1">实习期</option>
                                        <option value="2">已转正</option>
                                        <option value="4">已离职</option>
                                    </select>
                                </div>
                                <div class="layui-btn" data-type="reload"><i class="layui-icon"> &#xe615;</i></div>
                                <div class="layui-btn" onclick="Reload()">刷新</div>
                         </div>
                </div>
                <div class="layui-card-body" style="height:90%;">
                    <table class="layui-hide" id="QueryEmp" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/html" id="barDemo">
    {{# if(d.empstateid==1){ }}
    <%--<a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="edit2">转正</a>--%>
    <a class="layui-btn layui-btn-sm " lay-event="edit">完善信息</a>
    {{# } }}
    {{# if(d.empstateid==2){ }}
    <a class="layui-btn layui-btn-sm " lay-event="edit">完善信息</a>
    {{# } }}
    {{# if(d.empstateid==3){ }}
    <a class="layui-btn layui-btn-sm " lay-event="edit">完善信息</a>
    {{# } }}
    {{# if(d.empstateid==4){ }}
    <a class="layui-btn layui-btn-disabled layui-btn-sm" >已离职</a>
    {{# } }}



</script>
</body>
</html>
<script>
    $(function () {
        layui.use(['form', 'layedit', 'laydate','table'], function(){
            var table = layui.table;
            table.render({
                elem: '#QueryEmp'
                ,url:'QueryEmpYqx'
                ,page: true//开启分页
                ,limit :10//这个是每页面显示多少条，页面跳转后他会自动让下拉框里对应的值设为选中状态
                ,limits: [ 10, 20, 30, 40, 50]
                ,cellMinWidth: 50 //全局定义常规单元格的最小宽度
                ,id:'a'
                ,cols: [[
                    {type:'numbers', title: '序号', align:'center'}
                    ,{field:'empname', title: '姓名', align:'center'}
                    ,{field:'empnumber', title: '工号', align:'center'}
                    ,{field:'sex', title: '性别', align:'center',width:50, sort: true}
                    ,{field:'phone', title: '电话', align:'center'}
                    ,{field:'deptname', title: '部门', align:'center'}
                    ,{field:'posname', title: '职位', align:'center'}
                    /*,{field:'emptype', title: '员工类型', align:'center', sort: true}*/
                    ,{field:'emppay', title: '薪资',width:80, align:'center'}
                   /* ,{field:'empstateid', title: '入职状态', align:'center'}*/
                    ,{field:'statename', title: '入职状态', align:'center'}
                    ,{field:'empstatedate', title: '入职日期', align:'center', sort: true}
                    ,{field:'right', title: '操作', width:200,toolbar: '#barDemo', align:'center'}
                ]]
            });
            var $ = layui.$, active = {
                reload: function(){
                    var demoReload = $('#ByType').val();
                    var empType=$('#ByEmpType').val();
                    var empname=$('#empname').val();
                   /* alert(demoReload+"aaaaaaaaaaa"+empType)*/
                    //执行重载
                    table.reload('a', {
                        method:'post',
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        ,where: {
                            deptid: demoReload,
                            empstateid:empType,
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
                /*alert(empid)*/
                if(obj.event === 'edit'){
                        $.ajax({
                            url:'QqueryEmpIf',
                            type:'post',
                            data:{"empid":empid},
                            dataType:'json',
                            success:function (data) {
                                /*window.location.href="QupdateEmp"*/
                                window.location.href="QoneEmp"
                            }
                        })
                }
            });

        });
        QuerySelect();
    })
    /**
     * 下拉
     * */
    function QuerySelect(){
        $.ajax({
            url:'QueryDeptSelectYqx',
            type:'post',
            data:{},
            dataType:'json',
            success:function (data) {
                for (var i=0;i<data.length;i++){
                    var o="<option value='"+data[i].deptid+"'>"+data[i].deptname+"</option>";
                    $("#ByType").append(o);
                }
            }
        })
    }
    //刷新整个页面
    function Reload(){
        location=location;
    }
</script>
