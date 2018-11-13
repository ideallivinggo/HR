<%--
  Created by IntelliJ IDEA.
  User: SJP
  Date: 2018/11/4 0004
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="assets\js\jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="assets/layui/layui.all.js"></script>
    <link rel="stylesheet" href="assets/layui/css/layui.css">
    <style>
        #sempid{
            display: none;
        }

    </style>
</head>
<body>
<div class="layui-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">评估历史</li>
        <li>未评估的考核</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
           <%-- tab1--%>
               <table class="layui-hide" id="sjxpg1" lay-filter="sttt"></table>
        </div>
        <div class="layui-tab-item">
            <%-- tab2--%>
            <table class="layui-hide" id="nosjxpg" lay-filter="stjt"></table>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/html" id="sfzid">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script type="text/html" id="sbarjxpg">
    <div  class="site-demo-button" id="ssslayer">
    <a data-method="offfset" data-type="tss" class="layui-btn layui-btn-xs"  lay-event="slookjxpg">查看</a>
    </div>
</script>
<script type="text/html" id="sbarjxpgg">
    <div  class="site-demo-button" id="slaer">
        <a data-method="offfset" data-type="tss" class="layui-btn layui-btn-xs"  lay-event="slookjxpgs">开始评估</a>
    </div>
</script>
<script type="text/html" id="sjxpj">
    <table>

    </table>
</script>
<script type="text/html" id="sjxpg">
    <div>
        <table class="layui-hide" id="stabll">
        </table>
    </div>
</script>
<script>
    var sempid="${emp.empid}";
    $(function () {
        sgetjxpg();
        sgetnojxpg();
    })
    function sgetjxpg() {
        layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'],
            function(){
                var table = layui.table//表格
                    ,laypage = layui.laypage //分页
                table.render({
                    elem: '#sjxpg1'
                    ,url:'sgetjxpg'
                    ,width:1000
                    ,page: true //开启分页
                    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                    ,totalRow: true //开启合计行
                    ,cols: [[
                        { width:100,title: '#', templet:'#sfzid', sort: true,align:'center'}
                        ,{field:'pername', width:300, title: '考核名称',align:'center'}
                        ,{field:'perdate1', width:150, title: '考核时间',align:'center'}
                        ,{field:'zhouqi', width:150, title: '考核周期', sort: true,align:'center'}
                        ,{field:'', title: '操作', width:200,align:'center', toolbar: '#sbarjxpg'}//minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                    ]]
                    ,where : {
                        id:sempid,
                    }
                    ,limit:5   //默认十条数据一页
                    ,limits:[10,20,30,50]  //数据分页条
                });
                //监听行工具事件
                table.on('tool(sttt)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    var data = obj.data //获得当前行数据
                        ,layEvent = obj.event; //获得 lay-event 对应的值
                    if(layEvent === 'slookjxpg'){
                       // sjxpgalert();
                        //sjxpgmx(data.perid);
                        window.location.href="spgmx?perid="+data.perid+"&empid="+sempid;
                    }
                });
            });
    }
function sjxpgmx(sperid) {
    layui.use(['table', 'carousel', 'upload', 'element', 'slider'],
        function(){
            var table = layui.table//表格
                ,laypage = layui.laypage //分页
            table.render({
                elem: '#stabll'
                ,url:''
                ,width:1000
                ,page: true //开启分页
                ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                ,totalRow: true //开启合计行
                ,cols: [[
                    { width:100,title: '#', templet:'#sfzid', sort: true,align:'center'}
                    ,{field:'pername', width:300, title: '考核名称',align:'center'}
                    ,{field:'perdate1', width:150, title: '考核时间',align:'center'}
                     ,{field:'zhouqi', width:150, title: '考核周期', sort: true,align:'center'}
                    ,{field:'', title: '操作', width:200,align:'center', toolbar: '#sbarjxpg'}//minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ]]
                ,where : {
                    id:sperid,
                }
                ,limit:5   //默认十条数据一页
                ,limits:[10,20,30,50]  //数据分页条
            });
            //监听行工具事件
            table.on('tool(sttt)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'slookjxpg'){
                    sjxpgalert();
                    sjxpgmx(data.perid);
                }
            });
        });
}
function sgetnojxpg(){
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'],
        function(){
            var table = layui.table//表格
                ,laypage = layui.laypage //分页
            table.render({
                elem: '#nosjxpg'
                ,url:'sgetnojxpg'
                ,width:1000
                ,page: true //开启分页
                ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                ,totalRow: true //开启合计行
                ,cols: [[
                    { width:100,title: '#', templet:'#sfzid', sort: true,align:'center'}
                    ,{field:'pername', width:300, title: '考核名称',align:'center'}
                    ,{field:'perdate1', width:150, title: '考核时间',align:'center'}
                    ,{field:'zhouqi', width:150, title: '考核周期', sort: true,align:'center'}
                    ,{field:'', title: '操作', width:200,align:'center', toolbar: '#sbarjxpgg'}//minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ]]
                ,where : {
                    id:sempid,
                }
                ,limit:5   //默认十条数据一页
                ,limits:[10,20,30,50]  //数据分页条
            });
            //监听行工具事件
            table.on('tool(stjt)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'slookjxpgs'){
                    window.location.href="sjxpgyg?perid="+data.perid+"&empid="+sempid;
                }
            });
        });
}
</script>