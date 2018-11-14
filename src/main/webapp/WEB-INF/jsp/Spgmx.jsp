<%--
  Created by IntelliJ IDEA.
  User: SJP
  Date: 2018/11/5 0005
  Time: 20:41
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
        #sdivvv{
            position: absolute;
        }
        #stabll{
         position: relative;
            left:100px;
        }#sfanhuibut{
             width: 50px;
             height: 25px;
             position: fixed;
             right:740px;
             bottom: 100px;
         }

    </style>
</head>
<body>
<table class="layui-hide" id="sjxpg2" lay-filter="sttt"></table>
<button id="sfanhuibut" class="layui-btn layui-btn-danger layui-btn-xs" onclick="javascript:window.history.back(-1);">返回</button>
</body>
</html>
<script type="text/html" id="sfzidd">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script type="text/html" id="sbarjxpg">
    <div  class="site-demo-button" id="ssslayer">
        <a data-method="offfset" data-type="tss" class="layui-btn layui-btn-xs"  lay-event="slookjxpg">查看详情</a>
    </div>
</script>
<script type="text/html" id="sjxpg">
    <div id="sdivvv">
        <table  class="layui-hide" id="stabll">
            <tr></tr>
        </table>
    </div>
</script>
<script>
    var sperid="${perid}";
    var empid="${empid}"
$(function(){
    sjxpgmx();
})
function  sjxpgmx(){
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'],
        function(){
            var table = layui.table//表格
                ,laypage = layui.laypage //分页
            table.render({
                elem: '#sjxpg2'
                ,url:'sgetjxpgmx'
                ,width:1150
                ,page: true //开启分页
                ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                ,totalRow: true //开启合计行
                ,cols: [[
                    { width:100,title: '#', templet:'#sfzidd', sort: true,align:'center'}
                    ,{field:'empname', width:150, title: '员工名称',align:'center'}
                    ,{field:'deptname', width:150, title: '所在部门',align:'center'}
                    ,{field:'pxqdate', width:200, title: '评估时间',align:'center'}
                    ,{field:'peizgpj', width:300, title: '主管评价',align:'center'}
                    ,{field:'', title: '操作', width:200,align:'center', toolbar: '#sbarjxpg'}//minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ]]
                ,where : {
                    id:sperid,
                    eid:empid,
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
                    spgxxalert(data.empid);
                }
            });
        });
}
    function sjxpgalert() {
        var $ = layui.jquery, layer = layui.layer;
        layui.use('layer', function () {
            //触发事件
            var active = {
                offfset: function (othis) {
                    var type = othis.data('type')
                        , text = othis.text();
                    layer.open({
                        type: 1
                        , offfset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                        , id: 'ssslayer' + type //防止重复弹出
                        , content:$('#sjxpg').html()
                        ,area: ['800px', '500px']
                        , btn: '关闭'
                        , btnAlign: 'c' //按钮居中
                        , shade: 0 //不显示遮罩
                        , yes: function () {
                            layer.closeAll();
                        }
                    });
                }
            };
            $('#ssslayer .layui-btn').on('click', function () {
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });
        })
    }

    function spgxxalert(scsempid){
        layui.use(['table','laypage'],
            function(){
                var table = layui.table//表格
                    ,laypage = layui.laypage //分页
                table.render({
                    elem: '#stabll'
                    ,url:'sgetygjxmx'
                    ,width:780
                    ,page: true //开启分页
                    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                    ,totalRow: true //开启合计行
                    ,cols: [[
                        { width:150,title: '#', templet:'#sfzidd', sort: true,align:'center'}
                        ,{field:'pxqname', width:216, title: '考核内容名称',align:'center'}
                        ,{field:'pxqdefen', width:200, title: '考核评分',align:'center'}
                        ,{field:'perjieguo', width:200, title: '考核结果',align:'center'}
                       ]]
                    ,where : {
                        id:scsempid,
                        perid:sperid,
                    }
                    ,limit:5   //默认十条数据一页
                    ,limits:[5,10,15,30]  //数据分页条
                });
            });
    }
</script>