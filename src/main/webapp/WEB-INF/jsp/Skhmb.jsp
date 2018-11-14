<%--
  Created by IntelliJ IDEA.
  User: SJP
  Date: 2018/10/25 0025
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <script src="assets\js\jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="assets/layui/layui.all.js"></script>
    <link rel="stylesheet" href="assets/layui/css/layui.css">

    <link rel="stylesheet" href="assets/ztree/demo.css" type="text/css">
    <link rel="stylesheet" href="assets/ztree/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="assets/ztree/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="assets/ztree/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="assets/ztree/jquery.ztree.exedit.js"></script>
      <script type="text/javascript" src="assets/ztree/jquery.ztree.exhide.js"></script>
    <script type="text/javascript" src="assets/ztree/jquery.ztree.all.js"></script>

    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    <link href="assets/css/table-responsive.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <style>
        .sinst{
            width:40px;
            height:23px;
        }
        #staab td{
            padding-right:50px;
            padding-left:50px;
        }
        #staab tr{
            padding-top:30px;
            padding-bottom:10px;
        }
        .sinputnone{
            display: none;
        }
        #sjx{
            left: 80px;
            height: 40px;
            width: 65px;
        }
        #ssb td{
            padding-left: 3px;
            padding-right: 30px;
            padding-top:0px;
            padding-bottom:7px;
        }
        #sdivv{
            width: 200px;
            height:150px;
            display: none;
            position: absolute;
          left:118px;
            top:92px;
        }
       #citySel{
           width: 200px;
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
        #container3{
            position: relative;
            top:-90px;

        }
    </style>
</head>
<body>
<div class="site-demo-button" id="slayerr">
  <button data-method="offsett" data-type="st" id="sjx" class="layui-btn layui-btn-xs" onclick="Saddji()">添加模板</button>
</div>
<table class="layui-hide" id="sjkh" lay-filter="sttt"></table>
</body>
</html>
<script type="text/html" id="sindeTpl">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script type="text/html" id="sbarDemoo">
    <div  class="site-demo-button" id="slayer">
        <a data-method="offset" data-type="t" class="layui-btn layui-btn-xs"  lay-event="slook">模板明细</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="ssd">删除</a>
    </div>
</script>
<script  type="text/html" id="scrdiv">
   <%-- <div>
        <table id="staab" border="1px" cellpadding="0">
            <tr>
                <td>考核项目</td>
                <td>分值范围</td>
                <td>分值说明</td>
                <td>操作</td>
            </tr>
            <tbody id="stboy"></tbody>
            <tr><button class="layui-btn layui-btn-warm" onclick="saddjimx()">添加</button></tr>
        </table>
    </div>--%>
    <section id="container3" style="width: 900px;height: 700px" >
        <section class="wrapper">
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <table id="staab" class="table table-striped table-advance table-hover">
                            <thead>
                            <tr>
                                <th><i class="fa fa-bullhorn"></i> 考核项目</th>
                                <th class="hidden-phone"><i class="fa fa-question-circle"></i>分值范围</th>
                                <th><i class="fa fa-lightbulb-o"></i> 分值说明</th>
                                <th><i class="fa fa-lightbulb-o"></i> 操作</th>
                            </tr>
                            </thead>
                            <tbody id="stboy">
                            </tbody>
                            <tbody id="stboy2">
                            </tbody>

                            <tr><button class="layui-btn layui-btn-warm" onclick="saddjimx()">添加</button></tr>
                        </table>
                    </div><!-- /content-panel -->
                </div><!-- /col-md-12 -->
            </div><!-- /row -->
        </section>
    </section>
</script>
<script type="text/html" id="sfqjx">
<div>
    <table id="stabbb">
        <tr><td><span style="font-family: 微软雅黑">绩效考核名称:</span>  <input></td></tr>
        <tr> <td><span style="font-family: 微软雅黑">考核起止时间:</span>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd" style="height: 30px;width: 100px"> - <input type="text" class="layui-input" id="test2" placeholder="yyyy-MM-dd" style="height: 30px;width: 100px">
            </div></td> </tr>
        <tr><td><span style="font-family: 微软雅黑">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考核周期:</span>
            <select id="ssel" style="width: 100px">
                <option value="0">周</option>
                <option value="1">月</option>
                <option value="2">季</option>
                <option value="3">年</option>
            </select>
        </td> </tr>
        <tbody id="stboyy"></tbody>

    </table>
</div>
</script>
<script type="text/html" id="sipt">
    <table id='ssb' border="1px" cellpadding="0px">
        <tr>
        <td><span style="font-family: 微软雅黑">考核项目名称:</span></td>
        <td><input id="skhmx" style="height: 25px"></td>
        </tr>
       <tr>
           <td>考核项目描述:</td>
           <td><textarea id="stext" style="width: 180px;height: 40px"/>(最多输入25个字符)</td>
       </tr>
       <tr>
           <td>被考核员工:</td>
           <td>
               <input id="citySel"  style="height: 25px" type="text" readonly="readonly" onclick="ssxcd()"><button onclick="squeding()">确定</button>
           </td>
           <div id="sdivv" class="ztree-wrap">
               <ul id="treeDemo" class="ztree selectZtree"></ul>
           </div>
       </tr>

        <tr></tr>
        <tbody id=""></tbody>
        </table>
</script>
<script>
    var spids=null;
    var sids=null;
    var sntaid=null;
    $(function () {
        sgetmb();
    })
    function sgetmb() {
        layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'],
            function(){
                var table = layui.table//表格
                    ,laypage = layui.laypage //分页
                table.render({
                    elem: '#sjkh'
                    ,url:'sgetmb'
                    ,width:1100
                    ,page: true //开启分页
                    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                    ,totalRow: true //开启合计行
                    ,cols: [[
                        { width:100,title: '#', templet:'#sindeTpl', sort: true,align:'center'}
                        ,{field:'tanname', width:200, title: '模板名称',align:'center'}
                        ,{field:'temcontext', width:400, title: '模板描述', sort: true,align:'center'}
                        ,{field:'', title: '操作', width: 300,align:'center', toolbar: '#sbarDemoo'}//minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                        ]]
                    ,limit:5   //默认十条数据一页
                    ,limits:[10,20,30,50]  //数据分页条
                });
                //监听行工具事件
                table.on('tool(sttt)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                    var data = obj.data //获得当前行数据
                        ,layEvent = obj.event; //获得 lay-event 对应的值
                    if(layEvent === 'slook'){
                        sntaid=data.tnaid;
                        salerrt();
                        skhmx();

                    }else if(layEvent === 'ssd'){
                        layer.confirm('确定要删除么', function(index){
                            sdeljxmb(data.tnaid);
                        });

                    }
                });
            });
    }
    function spanduanjxbut() {
        $.ajax({
            url:'',
            type:'post',
            data:{smbid:sntaid.toString()},
            dataType:'json',
            success:function (data) {

            }
        })
    }
    function sdeljxmb(soj) {
        $.ajax({
            url: 'sdeljxmb',
            type: "post",
            data:{stnaid:soj},
            dataType: "json",
            success: function (data) {//AJAX发送后成功执行。
                if(data!=0){
                    window.location.reload();
                }
            }
        })
    }
    function salerrt() {
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
                        , id: 'slayer' + type //防止重复弹出
                        , content:$('#scrdiv').html()
                        ,area: ['1000px', '500px']
                        , btn: '保存'
                        ,offset: '30px'
                        , btnAlign: 'c' //按钮居中
                        , shade: 0 //不显示遮罩
                        , yes: function () {
                            syzmx();
                            layer.closeAll();
                        }
                    });
                }
            };
            $('#slayer .layui-btn').on('click', function () {
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });
        })
    }
    function skhmx(){
        $.ajax({
            url:'sgetmbmx',
            type:'post',
            data:{smbid:sntaid.toString()},
            dataType:'json',
            success:function (data) {
                $("#stboy").html("");
             for(var i=0;i<data.length;i++){
                 var tr="";
                 tr+="<tr><td><input class='sinputnone' value='"+data[i].temid+"' id='input1'><input id='sinpp1"+i+"' value='"+data[i].temcontent+"' class='sfuzhu'></td><td><input class='sinst' id='sinpp2"+i+"'value='"+data[i].temscoreone+"'onkeyup=\"this.value=this.value.replace(/[^\\d]/g,'') \" onafterpaste=\"this.value=this.value.replace(/[^\\d]/g,'') \">～<input class='sinst' id='sinpp3"+i+"' value='"+data[i].temscoretwo+"'onkeyup=\"this.value=this.value.replace(/[^\\d]/g,'') \" onafterpaste=\"this.value=this.value.replace(/[^\\d]/g,'') \">" +
                     "</td><td><input id='sinpp4"+i+"'value='"+data[i].temnumsm+"' onkeyup='this.value=this.value.replace(/[^\u4e00-\u9fa5\\w]/g,\"\")'></td><td> <a  id='sinpp6"+i+"' class='layui-btn layui-btn-danger layui-btn-xs' onclick='sdelkhmxh(this)'>删除</a></td></tr>";
                 $("#stboy").append(tr);
             }
            }
        })
    }
function saddjimx() {
   var str="<tr><td><input class='sinputnone' id='input1'><input id='' class='sfuzhu'></td><td><input class='sinst' id='' onkeyup=\"this.value=this.value.replace(/[^\\d]/g,'') \" onafterpaste=\"this.value=this.value.replace(/[^\\d]/g,'') \">～<input class='sinst' id='' onkeyup=\"this.value=this.value.replace(/[^\\d]/g,'') \" onafterpaste=\"this.value=this.value.replace(/[^\\d]/g,'') \">" +
        "</td><td><input id='' onkeyup='this.value=this.value.replace(/[^\u4e00-\u9fa5\\w]/g,\"\")'></td><td><a  id='' class='layui-btn layui-btn-danger layui-btn-xs' onclick='sdelkhmxh(this)'>删除</a></td></tr>";
    $("#stboy2").append(str);
}
function sdelkhmxh(soj) {
        $(soj).parent().parent().remove();
       // var a=$(soj).parent().parent().find("#input1").val();
}
function sbaocunjimx() {
       var sl= $("#staab").find("tr").length;
     if(parseInt(sl)>2) {
         var jxmxone = new Array();
         var jxmxtwo = new Array();
         var jxmxthree = new Array();
         var jxmxfour = new Array();
         var jxmxfive = new Array();
         var i = 0;
         $("#stboy tr").each(function () {
             jxmxone[i] = $(this).find('td:eq(0)').find('#input1').val();
             jxmxtwo[i] = $(this).find('td:eq(0)').find('.sfuzhu').val();
             jxmxthree[i] = $(this).find('td:eq(1)').find('.sinst:eq(0)').val();
             jxmxfour[i] = $(this).find('td:eq(1)').find('.sinst:eq(1)').val();
             jxmxfive[i] = $(this).find('td:eq(2) input').val();
             i++;
         });
         $("#stboy2 tr").each(function () {
             jxmxone[i] = $(this).find('td:eq(0)').find('#input1').val();
             jxmxtwo[i] = $(this).find('td:eq(0)').find('.sfuzhu').val();
             jxmxthree[i] = $(this).find('td:eq(1)').find('.sinst:eq(0)').val();
             jxmxfour[i] = $(this).find('td:eq(1)').find('.sinst:eq(1)').val();
             jxmxfive[i] = $(this).find('td:eq(2) input').val();
             i++;
         });
         $.ajax({
             url: 'supdkhmxid',
             type: 'post',
             data: {
                 smbid: sntaid.toString(),
                 jxmxone: jxmxone.toString(),
                 jxmxtwo: jxmxtwo.toString(),
                 jxmxthree: jxmxthree.toString(),
                 jxmxfour: jxmxfour.toString(),
                 jxmxfive: jxmxfive.toString()
             },
             dataType: 'json',
             success: function (data) {

             }
         })
     }else{
         alert("保存失败")
         layui.layer.closeAll();
     }
}
function Saddji() {
    sjxmb();
}
function sjxmb(){
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
                    , id: 'slayerr' + type //防止重复弹出
                    , content:$('#sipt').html()
                    ,area: ['800px', '500px']
                    , btn: '添加'
                    ,offset: '50px'
                    , btnAlign: 'c' //按钮居中
                    , shade: 0 //不显示遮罩
                    , yes: function () {
                        saddyanzheng();

                    }
                });
            }
        };
        $('#slayerr .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    })
}
function ssxcd() {
    $("#citySel").val("");
   $("#sdivv").show();
    ssxxlk();
}
function ssxxlk() {
    var node=null;
  $.ajax({
        type: "post",
        async: false,
        url: 'sgetcxcd',
        dataType: "json",
        success: function (data) {//AJAX发送后成功执行。
         node=data;
        }
    })
    var setting = {
        view: {
            selectedMulti: true
        },
        check: {
            enable: true,
           },
        data: {
            simpleData: {
                enable: true
            }
        }
    };
    var zNodes =node
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);

}
    function filter(node) {   //过滤器直选中2级节点累加
        return (node.checked == true);
    }

function squeding() {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo").getNodesByFilter(filter);
    var choose = "";
    var pids=new Array();
    var ids=new Array();
    for (var i=0;i<zTree.length;i++) {
        pids[i]=""+zTree[i].pId+"";
        ids[i]=""+zTree[i].id+"";
        if(parseInt(i)+1==zTree.length){
            choose+=""+zTree[i].name+""
        }else{
      choose+=""+zTree[i].name+","
    }}
    spids=pids.toString();
    sids=ids.toString();
    $("#citySel").val(choose);
    $("#sdivv").hide();
}
function saddyanzheng() {
    var a=0;
    $("input").each(function() {
        var s=$(this).val();
        if(Number(s)==0){
            a--;
        }else{
            a++;
        }
});
   var ss= $("#stext").val();
    if(Number(ss)!=0){
       a++;
    }
    if(parseInt(a)==4){
        saddjxkhmb();
    }else{
        layer.msg('不能有空');
    }
}
function syzmx(){
    var s=$("#stboy").find("tr").length*5;
    var s2=$("#stboy2").find("tr").length*4;
    var a=0;
    var ss=parseInt(s)+parseInt(s2);
    $("#staab input").each(function() {
        var ss= $(this).val();
        if(Number(ss)!=0){
            a++;
        }
    });
if(parseInt(a)<parseInt(ss)){
    layer.msg('不能有空');
}else{
    sbaocunjimx();
}

}
function saddjxkhmb() {
    $.ajax({
        url: 'sddjxkh',
        type: "post",
        data:{spids:spids,
            sids: sids,
             sxmms:$("#stext").val(),
            skhmx:$("#skhmx").val()
        },
        dataType: "json",
        success: function (data) {//AJAX发送后成功执行。
     if(data!=0){
         layer.closeAll();
         window.location.reload();
     }else{
         layer.msg('保存失败');
     }

        }
    })
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
    if(parseInt(a)<3){
        layer.msg('不能有空');
    }else{

        saddfaqijx();
    }
}
function saddfaqijx() {
    var s1=  $("#stabbb input:eq(0)").val();
    var s2=  $("#stabbb input:eq(1)").val();
    var s3=  $("#stabbb input:eq(2)").val();
    var s4= $("#ssel").val();
    $.ajax({
        url: 'saddjxfq',
        type: "post",
        data:{jxmc:s1,
        skhsjone:s2,
       skhsjtwo:s3,
        khzq:s4,
        tnaid:sntaid
        },
        dataType: "json",
        success: function (data) {//AJAX发送后成功执行。
            if(data!=0){
                window.location.reload();
                layer.msg('绩效已发起');
            }else{
                layer.msg('绩效发起异常');
            }
        }
    })
}
</script>