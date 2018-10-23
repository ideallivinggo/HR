<%--
  Created by IntelliJ IDEA.
  User: SJP
  Date: 2018/10/23 0023
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="assets\js\jquery.js"></script>
    <script type="text/javascript" src="assets/layui/layui.all.js"></script>
    <link rel="stylesheet" href="assets/layui/css/layui.css">
</head>
<body>
<table class="layui-hide" id="stable" lay-filter="stet"></table>

</body>
</html>
<script type="text/html" id="sindexTpl">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script>
    $(function(){
        sygxz();
    })
    function sygxz() {
        layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'],
            function(){
                var table = layui.table//表格
                    ,laypage = layui.laypage //分页
                table.render({
                    elem: '#stable'
                    ,url:''
                    ,width:1100
                    ,page: true //开启分页
                    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                    ,totalRow: true //开启合计行
                    ,cols: [[
                        { width:120, title: '#',templet:'#sindexTpl', sort: true,align:'center'}
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
</script>