<%--
  Created by IntelliJ IDEA.
  User: SJP
  Date: 2018/10/25 0025
  Time: 16:43
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
        #sjxkhbut{
            position: relative;
            left:1000px;
            height: 30px;
            width: 100px;
        }
        #stabbb{
            position: absolute;
            top:30px;
            left:100px;
        }
        #stabbb td{
            padding-top:10px;
            padding-bottom:10px;
        }
        #spans{
            position: absolute;
            top: 110px;
        }
        #spans2{
            position: absolute;
            top: 170px;
        }
        #sfqjx{
            position: absolute;
            top:-100px;
        }
    </style>
</head>
<body>
<div class="site-demo-button" id="slay">
    <button data-method="offsett" data-type="stt" id="sjxkhbut" class="layui-btn layui-btn-xs" onclick="Saddjikh()"><i class="layui-icon">&#xe654</i>发起绩效考核</button>
</div>
<table class="layui-hide" id="stab2" lay-filter="sttt2"></table>
</body>
</html>
<script type="text/html" id="sbarde">
    <div  class="site-demo-button" id="slaye">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="ssdelss">删除</a>
    </div>
</script>
<script type="text/html" id="sindeTpl">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script type="text/html" id="sfqjx">
    <div id="sdic">
        <form class="layui-form" id="sform">
        <table id="stabbb">
            <tr><td><span style="font-family: 微软雅黑">绩效考核名称:</span>  <input></td></tr>
            <tr> <td><span style="font-family: 微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考核时间:</span>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd" style="height: 30px;width: 100px" onblur="ssjinput()">
                </div> </td> </tr>
            <tr><div class="layui-form-item">
                <td><span id="spans" style="font-family: 微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考核周期:</span>
                 <div class="layui-input-block">
                        <select  id="ssel">
                    <option value="1">月</option>
                </select>
                    </div>
            </td>
            </div>
            </tr>
            <tbody id="stboyy">
            <tr><div class="layui-form-item">
                <td><span id="spans2" style="font-family: 微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考核模板:</span>
                    <div class="layui-input-block">
                        <select  id="ssel2">

                        </select>
                    </div>
                </td>
            </div>
            </tr>
            </tbody>
        </table>
        </form>
    </div>
</script>
<script>
    $(function () {
        sgetjxkh();

    })
    function sgetjxkh() {
        layui.use(['laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'],
            function(){
                var table = layui.table//表格
                    ,laypage = layui.laypage //分页
                table.render({
                    elem: '#stab2'
                    ,url:'sgetjxkh'
                    ,width:1100
                    ,page: true //开启分页
                    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                    ,totalRow: true //开启合计行
                    ,cols: [[
                        { width:100,title: '#', templet:'#sindeTpl', sort: true,align:'center'}
                        ,{field:'pername', width:250, title: '考核名称',align:'center'}
                        ,{field:'perdate1', width:200, title: '考核时间', sort: true,align:'center'}
                         ,{field:'zhouqi', width:200, title: '考核周期', sort: true,align:'center'}
                        ,{field:'', title: '操作', width: 300,align:'center', toolbar: '#sbarde'}//minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                    ]]
                    ,limit:5   //默认十条数据一页
                    ,limits:[10,20,30,50]  //数据分页条
                });
                //监听行工具事件
                table.on('tool(sttt2)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    var data = obj.data //获得当前行数据
                        ,layEvent = obj.event; //获得 lay-event 对应的值
                    if(layEvent === 'ssdelss'){
                        layer.confirm('确定要删除么', function(index){
                            sdeljxkh(data.perid);
                        });
                    }
                });

            });
    }
    function Saddjikh(){
        sjxalert();
        sdatetab();
        sgetjxmb();
        layui.use('form', function(){
            var form = layui.form;
            form.render();
        });
    }
    function sjxalert(){
        var $ = layui.jquery, layer = layui.layer;
        layui.use('layer', function () {
            //触发事件
            var active = {
                offsett: function (othis) {
                    var type = othis.data('type')
                        , text = othis.text();
                    layer.open({
                        type: 1
                        , offsett: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                        , id: 'slay' + type //防止重复弹出
                        , content:$('#sfqjx').html()
                        ,offset: '50px'
                        ,area: ['800px', '500px']
                        , btn: '发起'
                        , btnAlign: 'c' //按钮居中
                        , shade: 0 //不显示遮罩
                        , yes: function () {
                            sjxmbyanzheng();

                        }
                    });
                }
            };
            $('#slay .layui-btn').on('click', function () {
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });
        })
        layui.use('form', function(){
            var form = layui.form;
            form.render();
        });
    }
    function sdatetab() {
        layui.use('laydate', function () {
            var laydate = layui.laydate
            //常规用法
            laydate.render({
                elem: '#test1'
                , type: 'month'
                , done: function (value, date, endDate) {
                    console.log(value); //得到日期生成的值，如：2017-08-18

                }
            });

        });

    }
    function sjxmbyanzheng(){
        var a=0;
        $("#stabbb input").each(function() {
            var s=$(this).val();
            if(Number(s)==0){
                a--;
            }else{
                a++;
            }
        });
        if(parseInt(a)<4){
            layer.msg('不能有空');
        }else{

            saddfaqijx();
        }
    }
    function saddfaqijx() {

        var myDate = new Date;
        var year = myDate.getFullYear();//获取当前年
        var yue = myDate.getMonth()+1;//获取当前月
        var date = myDate.getDate();//获取当前日
        var s1=  $("#stabbb input:eq(0)").val();
        var s2=  $("#stabbb input:eq(1)").val();
        var s3= year+"-"+yue+"-"+date ;
        var s4= $("#ssel").val();
        var s5=$("#ssel2").val();
        var now = year + '-' + yue;
        var start = new Date(s2.replace("-", "/").replace("-", "/"));
        var end = new Date(now.replace("-", "/").replace("-", "/"));
        if (start >= end) {
            $("#test1").val("");
            layer.msg('时间不能大于或等于这个月');
        }else {
             $.ajax({
                  url: 'saddjxfq',
                  type: "post",
                  data:{jxmc:s1,
                      skhsjone:s2,
                      skhsjtwo:s3,
                      khzq:s4,
                      tnaid:s5
                  },
                  dataType: "json",
                  success: function (data) {//AJAX发送后成功执行。
                      if(data!=0){
                          window.location.reload();
                          layer.msg('绩效已发起');
                      }else{
                          layer.msg('请完善该模板');
                      }
                  }
              })
        }
    }
    function sgetjxmb() {
        $.ajax({
            url: 'sgetmbs',
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#ssel2").val("");
                var tr='';
                for(var i=0;i<data.length;i++){
                    tr+="<option value='"+data[i].tnaid+"'>"+data[i].tanname+"</option>";
                }
                $("#ssel2").append(tr);
            }
        });
    }
    function sdeljxkh(sperid) {
        $.ajax({
            url: 'sdeljxkh',
            type: "post",
            data:{perid:sperid},
            dataType: "json",
            success: function (data) {//AJAX发送后成功执行。
                if(data!=0){
                    window.location.reload();
                }else{
                    layer.msg('删除失败');
                }
            }
        })
    }

</script>