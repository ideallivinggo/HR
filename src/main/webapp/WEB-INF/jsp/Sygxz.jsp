<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <style>
#stabbb td{
    padding-right:50px;
    padding-left:50px;
}
        #sinpt{
    display: none;
        }
    </style>
</head>
<body>
<div class="demoTable">
    搜索：
    <div class="layui-inline">
        <input class="layui-input" name="sid" id="sdemoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<table class="layui-hide" id="stable" lay-filter="stet"></table>

</body>
</html>
<script type="text/html" id="sindexTpl">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script type="text/html" id="sbj">
    <div  class="site-demo-button" id="slayerDemo">
    <button data-method="offset" data-type="t" class="layui-btn layui-btn-xs" lay-event="sbianji">编辑</button>
     </div>
</script>
<script  type="text/html" id="sdiv">
    <div>
        <table id="stabbb">
            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名 : <span id="sspan"></span></td></tr>
        <tr><td>试用薪资 : <input id="ssy">元</td></tr>
        <tr><td>转正薪资 : <input id="szz">元</td></tr>
        <tr><td>当前薪资 : <input id="sdq">元</td></tr>
            <input id="sinpt">
        </table>
    </div>
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
                    ,url:'sgetygxz'
                    ,width:1200
                    ,page: true //开启分页
                    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                    ,totalRow: true //开启合计行
                    ,cols: [[
                        { width:100, title: '#',templet:'#sindexTpl', sort: true,align:'center'}
                        ,{field:'empname', width:100, title: '姓名',align:'center'}
                        ,{field:'deptname', width:100, title: '部门', sort: true,align:'center'}
                        ,{field:'idnumber', width:200, title: '证件号',align:'center'}
                        ,{field:'constart', width:130, title: '入职日期', sort: true,align:'center'}
                        ,{field:'paytry', width:100, title: '试用薪资',align:'center'}
                        ,{field:'payjust', width:100, title: '转正薪资', sort: true,align:'center'}
                        ,{field:'paynumber', width:100, title: '当前薪资',align:'center'}
                        ,{field:'', title: '操作', width: 170,align:'center', toolbar: '#sbj'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                    ]]
                    ,id: 'stestReload'
                    ,limit:5   //默认十条数据一页
                    ,limits:[10,20,30,50]  //数据分页条
                });

                //监听行工具事件
                table.on('tool(stet)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    var data = obj.data //获得当前行数据
                        ,layEvent = obj.event; //获得 lay-event 对应的值
                    if(layEvent === 'sbianji'){
                        salertt(data);
                        sfuzhi(data);
                    }
                });
                $('.demoTable .layui-btn').on('click', function(){
                        var sdemoReload = $('#sdemoReload').val();
                        //执行重载
                        table.reload('stestReload', {
                            url:'sgetygxz'
                            ,page: {
                                curr: 1 //重新从第 1 页开始
                            }
                            ,where: {
                                    id: sdemoReload
                            }
                        });
                });

            });
    }

function salertt(sobb) {
    var $ = layui.jquery, layer = layui.layer;
    layui.use('layer', function () {
        //触发事件
        var active = {
            offset: function (othis) {
                var type = othis.data('type')
                    , text = othis.text();
                layer.open({
                    type: 1
                    , offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    , id: 'slayerDemo' + type //防止重复弹出
                    , content:$('#sdiv').html()
                    ,area: ['500px', '200px']
                    , btn: '确定'
                    , btnAlign: 'c' //按钮居中
                    , shade: 0 //不显示遮罩
                    , yes: function () {
                        supdate();
                        layer.closeAll();
                    }
                });
            }
        };
        $('#slayerDemo .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    })
}
function  sfuzhi(sobjj) {
    $("#sspan").html(sobjj.empname);
    $("#ssy").val(sobjj.paytry);
    $("#szz").val(sobjj.payjust);
    $("#sdq").val(sobjj.paynumber);
    $("#sinpt").val(sobjj.empid);
}
function supdate() {
       var sstr=new Array();
  sstr[0]=$("#ssy").val();
   sstr[1]= $("#szz").val();
   sstr[2]= $("#sdq").val();
    sstr[3]=$("#sinpt").val();
    $.ajax({
        url:'supdatexz',
        type:'post',
        data:{ssr:sstr.toString()},
        dataType:'json',
        success:function (data) {
            if(data!=0){
                window.location.reload();
            }
        }
    })

}
</script>