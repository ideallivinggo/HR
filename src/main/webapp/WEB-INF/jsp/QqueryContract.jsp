<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/10/26
  Time: 8:47
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
                        合同类型：
                        <div class="layui-inline">
                            <select id="ContypeId">
                                <option value="1">劳动合同</option>
                                <option value="2">劳务合同</option>
                                <option value="3">实习合同</option>
                                <option value="4">其他合同</option>
                            </select>
                        </div>
                        <div class="layui-btn" data-type="reload">搜索</div>
                    </div>
                </div>
                <div class="layui-card-body" style="height:90%;">
                    <table class="layui-hide" id="Contract" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#Contract'
            ,url:'QueryContractYqx'
            ,page: true//开启分页
            ,limit :2//这个是每页面显示多少条，页面跳转后他会自动让下拉框里对应的值设为选中状态
            ,limits: [2,5, 20, 30, 40, 50]
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度
            ,id:'a'
            ,cols: [[
                 {type:'numbers', title: '序号', align:'center'}
                ,{field:'conid', title: 'Id', align:'center'}
                ,{field:'empname', title: '员工', align:'center'}
                ,{field:'contype', title: '合同类型', align:'center', sort: true}
                ,{field:'concontent', title: '合同内容', align:'center'}
                ,{field:'constart', title: '合同开始时间', align:'center'}
                ,{field:'conover', title: '合同结束时间', align:'center', sort: true}
                ,{field:'conexpire', title: '试用期时间', align:'center', sort: true}
            ]]

        });
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#ContypeId').val();
                alert(demoReload)
                //执行重载
                table.reload('a', {
                    url:'QueryContractYqx',
                    method:'post',
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        contypeid: demoReload
                    }
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });

</script>
