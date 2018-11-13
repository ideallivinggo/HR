<%--
  Created by IntelliJ IDEA.
  User: SJP
  Date: 2018/11/6 0006
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="assets\js\jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="assets/layui/layui.all.js"></script>
    <link rel="stylesheet" href="assets/layui/css/layui.css">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <link href="assets/css/table-responsive.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <style>
        #container{
            position: relative;
            top:-90px;

        }
        #container2{
            position: relative;
            top:-90px;

        }
        .sippn{
            width:40px;
            height:23px;
        }
        .std{
            padding-right: 10px;
            padding-left: 20px;
        }
        #sfanhuibut{
            width: 50px;
            height: 25px;
            position: fixed;
            right:740px;
            bottom: 100px;
        }
    </style>
</head>
<body>
<table class="layui-hide" id="nosjxpg" lay-filter="stjt"></table>
<button id="sfanhuibut" class="layui-btn layui-btn-danger layui-btn-xs" onclick="javascript:window.history.back(-1);">返回</button>
</body>
</html>
<script type="text/html" id="sfzidd">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script type="text/html" id="statepd">
    {{#if (d.state == 0) { }}
    <span style="color: #d43f3a">未评估</span>
    {{# }else if(d.state == 1){ }}
    <span style="color: #00FF00">已评估</span>
    {{# } }}
</script>
<script type="text/html" id="sbarjxpggs">
    {{#if (d.state == 0) { }}
    <div  class="site-demo-button" id="sslaer">
        <a data-method="offfset" data-type="tss" class="layui-btn layui-btn-xs"  lay-event="sygpg">评估</a>
    </div>
    {{# }else if(d.state == 1){ }}
    <div  class="site-demo-button" id="slaerr">
        <a data-method="offfset" data-type="tss" class="layui-btn layui-btn-xs"  lay-event="slookyipg">查看</a>
    </div>
    {{# } }}

</script>
<script type="text/html" id="sjxpgs">
    <section id="container" style="width: 780px;height: 500px" >
        <section class="wrapper">
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <table class="table table-striped table-advance table-hover">
                            <h4>考核员工:<span id="ssan"></span></h4>
                            <hr>
                            <thead>
                            <tr>
                                <th><i class="fa fa-bullhorn"></i> 考核名称</th>
                                <th class="hidden-phone"><i class="fa fa-question-circle"></i>分值范围</th>
                                <th><i class="fa fa-lightbulb-o"></i> 评分描述</th>
                                <th><i class="fa fa-lightbulb-o"></i> 打分</th>
                            </tr>
                            </thead>
                            <tbody id="spgbody">

                            </tbody>
                            <tr><td>对员工的评价</td><td><textarea id="stext" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')"></textarea></td></tr>
                        </table>
                    </div><!-- /content-panel -->
                </div><!-- /col-md-12 -->
            </div><!-- /row -->
        </section>
    </section>
</script>
<script type="text/html" id="sjxpgs2">
    <section id="container2" style="width: 780px;height: 500px" >
        <section class="wrapper">
            <div class="row mt">
                <div class="col-md-12">
                    <div class="content-panel">
                        <table class="table table-striped table-advance table-hover">
                            <h4>最终得分:<span id="dfdj"></span></h4>
                            <hr>
                            <thead>
                            <tr>
                                <th><i class="fa fa-bullhorn"></i> 员工名称</th>
                                <th class="hidden-phone"><i class="fa fa-question-circle"></i>考核名称</th>
                                <th><i class="fa fa-lightbulb-o"></i> 评分时间</th>
                                <th><i class="fa fa-lightbulb-o"></i> 员工的分</th>
                            </tr>
                            </thead>
                            <tbody id="spgbody2">

                            </tbody>
                            </table>
                    </div><!-- /content-panel -->
                </div><!-- /col-md-12 -->
            </div><!-- /row -->
        </section>
    </section>
</script>
<script>
    var sperid="${perid}";
    var empid="${empid}"

    $(function(){
        sgetjxpgyg();

    })
function sgetjxpgyg() {
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'],
        function(){
            var table = layui.table//表格
                ,laypage = layui.laypage //分页
            table.render({
                elem: '#nosjxpg'
                ,url:'sgetnpjxpgyg'
                ,width:950
                ,page: true //开启分页
                ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
                ,totalRow: true //开启合计行
                ,cols: [[
                    { width:100,title: '#', templet:'#sfzidd', sort: true,align:'center'}
                    ,{field:'empname', width:200, title: '员工名称',align:'center'}
                    ,{field:'deptname', width:200, title: '所在部门',align:'center'}
                    ,{field:'state', width:200, title: '考核状态',align:'center',templet:'#statepd'}
                    ,{field:'', title: '操作', width:200,align:'center', toolbar: '#sbarjxpggs'}//minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ]]
                ,where : {
                    id:sperid,
                    eid:empid,
                }
                ,limit:5   //默认十条数据一页
                ,limits:[10,20,30,50]  //数据分页条
            });
            //监听行工具事件
            table.on('tool(stjt)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data //获得当前行数据
                    ,layEvent = obj.event; //获得 lay-event 对应的值
                if(layEvent === 'sygpg'){
                   //评估
                    spgalert(data.empid);
                    sygkhmxjz(data.empid);
                }else if(layEvent === 'slookyipg'){
                    //查看已评估的员工
                    sdfalert();
                    sgetpgyg(data.empid);
                }
            });
        });
}
function spgalert(sempid) {
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
                    , id: 'sslaer' + type //防止重复弹出
                    , content:$('#sjxpgs').html()
                    ,area: ['800px', '500px']
                    , btn: '完成'
                    , btnAlign: 'c' //按钮居中
                    , shade: 0 //不显示遮罩
                    , yes: function () {
                        syanzhengpg(sempid);
                        //layer.closeAll();
                    }
                });
            }
        };
        $('#sslaer .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    })
}
function sdfalert(){
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
                    , id: 'slaerr' + type //防止重复弹出
                    , content:$('#sjxpgs2').html()
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
        $('#slaerr .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    })
}
function sygkhmxjz(semp){
    $.ajax({
        url:'sgetygkhmxzj',
        type:'post',
        data:{perid:sperid.toString(),
        empid:semp.toString()
        },
        dataType:'json',
        success:function (data) {
            $("#spgbody").html("");
         if(data.length!=0){
             var tr="";
             for(var i=0;i<data.length;i++){
               tr+="<tr><td>"+data[i].temcontent+"</td>" +
                   "<td><input name='name1' value="+data[i].temscoreone+" readonly='readonly'class='sippn'> - <input name='name2' value="+data[i].temscoretwo+" readonly='readonly'class='sippn'></td>" +
                   "<td>"+data[i].temnumsm+"</td>" +
                   "<td><input id='pfinp' onblur='sfzinput(this)' onkeyup=\"if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\\D/g,'')}\" /></td></tr>";
             }
        $("#spgbody").append(tr);
             $("#ssan").append(data[0].empname);
         }
        }
    })
}
function syanzhengpg(sempid) {
    var sstr=new Array();
    var i=0;
    var a=0;
    var sl= $("#spgbody").find("tr").length;
    $("#spgbody tr").each(function () {
       sstr[i]=$(this).find("td:eq(3) input").val();
        if(sstr[i]!=""){
            a++;
        }
        i++;
    })
    var ss=$("#stext").val();
    if(ss.length!=0){
        a++;
    }
    if(parseInt(a)<sstr.length+1){
        layer.msg('评价不能有空');
    }else{
        saddygjxpf(sstr,sempid);
    }

}
function saddygjxpf(ssttr,sempid){
    var ss=$("#stext").val();
    $.ajax({
        url:'saddygjxdf',
        type:'post',
        data:{ygdf:ssttr.toString(),
            zgpj:ss,
            perid:sperid,
            empid:sempid
        },
        dataType:'json',
        success:function (data) {
 if(data!=0){
     layer.msg('该员工考评完成');
     layer.closeAll();
     window.location.reload();
           }
        }
    })
}
function sfzinput(sobb) {
        var s=$(sobb).val();
   var input1= $(sobb).parent().parent().find("input[name=name1]").val();
    var input2= $(sobb).parent().parent().find("input[name=name2]").val();
    if(parseInt(input1)<parseInt(input2)){
        if(parseInt(s)<parseInt(input1) || parseInt(s)>parseInt(input2)){
            $(sobb).val("");
            layer.msg('分值不能评范围以外');
        }
    }else if(parseInt(input1)>parseInt(input2)){
        if(parseInt(s)>parseInt(input1) & parseInt(s)<parseInt(input2)){
            $(sobb).val("");
            layer.msg('分值不能评范围以外');
        }
    }
}
function sgetpgyg(sempp) {
    $.ajax({
        url:'sgetypgyg',
        type:'post',
        data:{perid:sperid.toString(),
            empid:sempp.toString()
        },
        dataType:'json',
        success:function (data) {
            $("#spgbody2").html("");
            if(data.length!=0){
                var tr="";
                for(var i=0;i<data.length;i++){
                    tr+="<tr><td>"+data[i].empname+"</td>" +
                        "<td>"+data[i].pxqname+"</td>" +
                        "<td>"+data[i].pxqdate+"</td>" +
                        "<td>"+data[i].pxqdefen+"</td></tr>";
                }
                $("#spgbody2").append(tr);
                $("#dfdj").append(data[0].perjieguo);
            }
        }
    })
}
</script>