<%--
  Created by IntelliJ IDEA.
  User: SJP
  Date: 2018/10/19 0019
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="assets\js\jquery.js"></script>
    <script type="text/javascript" src="assets/layui/layui.all.js"></script>
    <link rel="stylesheet" href="assets/layui/css/layui.css">
    <style>

    </style>
</head>
<body>
<table class="layui-hide" id="sdemo" lay-filter="stest"></table>


</body>
</html>
<script type="text/html" id="sbarDemo">
    <a type="file" class="layui-btn layui-btn-xs" lay-event="sedit">导出</a>
    <a class="layui-btn layui-btn-xs" lay-event="sfasong">发送工资单</a>
    <a class="layui-btn layui-btn-xs layui-btn-xs" lay-event="ssub">保存</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="ssdel">删除</a>

</script>
<script>
    $(function () {
        sgetatt();
    })
    function sgetatt() {
        layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'],
            function(){
            var table = layui.table//表格
                ,laypage = layui.laypage //分页
            table.render({
                elem: '#sdemo'
                ,url:'sgetattsjp'
                ,width:1100
                ,page: true //开启分页
                ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                ,totalRow: true //开启合计行
                ,cols: [[
                    {field:'staid', width:120, title: '#', sort: true,align:'center'}
                    ,{field:'stagsname', width:200, title: '公司名称',align:'center'}
                    ,{field:'statjmonth', width:200, title: '月度台账', sort: true,align:'center'}
                    ,{field:'', title: '操作', width: 300,align:'center', toolbar: '#sbarDemo'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ]]
                ,limit:5   //默认十条数据一页
                ,limits:[10,20,30,50]  //数据分页条
            });
                //监听行工具事件
                table.on('tool(stest)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    var data = obj.data //获得当前行数据
                        ,layEvent = obj.event; //获得 lay-event 对应的值
                    if(layEvent === 'sedit'){
                        alert(data.staid);
                     var url ="sexportExcelsjp?id="+data.staid;
                        // 这里一定不能使用Ajax请求
                        window.open(url);

                    } else if(layEvent === 'ssdel'){
                        layer.confirm('真的删除行么', function(index){
                            sdelatt(data.staid);
                        });
                    } else if(layEvent === 'ssub'){
                        layer.confirm('确定要保存吗', function(index){
                            ssub(data.staid);
                        });
                    }else if(layEvent === 'sfasong'){
                        layer.msg('发送');
                    }
                });
        });
    }
    function sdelatt(ssobj){
        $.ajax({
            url:'sdelattsjp',
            type:'post',
            data:{id:ssobj},
            dataType:'json',
            success:function(data){
                if(data!=0){
                    window.location.reload();
                }
            }
        })
    }
    function  ssub(sobj) {
        $.ajax({
            url:'ssubsjp',
            type:'post',
            data:{id:sobj},
            dataType:'json',
            success:function (data) {
                if(data==0){
                    window.location.reload();
                }
            }
        })
    }
</script>