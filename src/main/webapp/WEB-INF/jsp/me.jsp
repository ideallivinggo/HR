<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-10-12
  Time: 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <script src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
</head>
<style>
    #content {
        margin: 10px;
    }
    #content2 {
        width: 100%;
        height: 630px;
        background-image: url(../../assets/img/beijing.jpg);
        background-size:100% 630px;
        background-repeat:no-repeat;
    }
    .nei{
        width: 100%;
        float: left;
    }
    .nei div{
        float: left;
    }
    .empstate{
        border: 20px solid #F3F3F9;
        width: 275px;
        height: 155px;
        background-color: #FFFFFF;
        border-radius:30px;
        margin-top: -10px;
    }

    .matter{
        border: 20px solid #F3F3F9;
        width: 590px;
        height: 400px;
        background-color: #FFFFFF;
        border-radius:30px;
        text-align: center;
    }
    .matter p{
        margin: 16px auto;
    }
    .tu{
        margin-left: 170px;
        margin-top: -100px;
    }
    .shu{
        width: 120px;
        height: 100px;
        text-align: center;
        line-height: 130px;
        margin-left: 20px;
        font-family: 微软雅黑;
        font-size: 20px;
    }
    .ziti{
        width: 275px;
        height: 50px;
        font-family: 微软雅黑;
        font-size: 25px;
        margin-top: 0px;
        text-align: center;
        line-height: 45px;
        letter-spacing: 10px;
        background-color: #6CE7D2;
        border-radius:5px;
        cursor: pointer;
        color: #FFFFFF;
    }
    .ziti:hover{
        color: #979797;
    }
    .items{
        width: 170px;
        height: 155px;
        background-color: #FFFFFF;
        cursor: pointer;
        margin-left: 18px;
        margin-top: 5px;
        border: 1px solid #ffffff;
        border-radius:5px;
    }
    /*.items:hover{
        border: 1px solid #979797;
        border-radius:5px;
        color: #979797;
    }*/
    #zi{
        font-size: 80px;
        color: #FFFFFF;
        letter-spacing:30px;
        text-align: center;
        line-height: 430px;
    }
    #gonggao li {
        width: 260px;
        font-size: 20px;
        color: #000000;
    }
</style>
<body>
<div id="content" style="display: none">
    <!--员工状态-->
    <div class="nei">
        <div class="empstate">
            <div class="shu"><span id="drz" style="font-size: 30px"></span>&nbsp;人</div>
            <img src="../../assets/img/drz.png" width="100" height="100" class="tu">
            <div class="ziti">待入职&nbsp;»</div>
        </div>
        <div class="empstate">
            <div class="shu"><span id="dzz" style="font-size: 30px">0</span>&nbsp;人</div>
            <img src="../../assets/img/dzz.png" width="100" height="100" class="tu">
            <div class="ziti">待转正&nbsp;»</div>
        </div>
        <div class="empstate">
            <div class="shu"><span id="yzz" style="font-size: 30px">0</span>&nbsp;人</div>
            <img src="../../assets/img/ddd.png" width="100" height="100" class="tu">
            <div class="ziti">已转正&nbsp;»</div>
        </div>
        <div class="empstate">
            <div class="shu"><span id="dlz" style="font-size: 30px">0</span>&nbsp;人</div>
            <img src="../../assets/img/dlz.png" width="100" height="100" class="tu">
            <div class="ziti">待离职&nbsp;»</div>
        </div>
    </div>
    <!--其他-->
    <div class="nei">
        <div class="matter">
            <p style="font-size: 20px">待办事项</p>
            <div class="items">
                <img src="../../assets/img/drz.png" width="80" height="60">
                <p><span id="daoqi"></span>&nbsp;人</p>
                <p>合同到期提醒</p><br>
            </div>
            <div class="items">
                <img src="../../assets/img/drz.png" width="80" height="60">
                <p><span id="jiaban"></span>&nbsp;人</p>
                <p>加班审批</p><br>
            </div>
            <div class="items">
                <img src="../../assets/img/drz.png" width="80" height="60">
                <p><span id="lizhi"></span>&nbsp;人</p>
                <p>离职审批</p>
            </div>
            <div class="items">
                <img src="../../assets/img/drz.png" width="80" height="60">
                <p><span id="xiujia"></span>&nbsp;人</p>
                <p>休假审批</p>
            </div>

            <div class="items">
                <img src="../../assets/img/drz.png" width="80" height="60">
                <p><span id="peixin"></span>&nbsp;人</p>
                <p>培训课程审批</p>
            </div>
            <div class="items">
                <img src="../../assets/img/drz.png" width="80" height="60">
                <p><span id="luqu"></span>&nbsp;人</p>
                <p>面试录取</p>
            </div>
        </div>
        <div class="matter">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title" id="gonggao">
                    <li class="layui-this">系统公告栏</li>
                    <li>部门公告栏</li>
                </ul>
                <div class="layui-tab-content" style="width:95%;overflow: auto; height: 320px;margin-left: 8px;">
                    <div class="layui-tab-item layui-show">
                        <table class="layui-table" lay-skin="line">
                            <colgroup>
                                <col width="400">
                                <col width="150">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>公告内容</th>
                                <th>公告开始时间</th>
                            </tr>
                            </thead>
                            <tbody id="gstbody"></tbody>
                        </table>
                    </div>
                    <div class="layui-tab-item">
                        <table class="layui-table" lay-skin="line">
                            <colgroup>
                                <col width="400">
                                <col width="150">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>公告内容</th>
                                <th>公告开始时间</th>
                            </tr>
                            </thead>
                            <tbody id="bmtbody"></tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>
<div id="content2" style="display: none;">
    <div id="zi">欢迎来到睿智管理系统</div>
</div>
</body>
<script>
    layui.use('element', function(){ });

    $(function () {
        countEmpstate();
    })
    if('${emp.poid}'== 2){
      $("#content2").css('display','block');

    }else {
        $("#content").css('display','block');
    }
    //首页显示
    function countEmpstate() {
        //待入职统计
        $.ajax({
            url: "countActYLP",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#drz").html(data.countnum);
            }
        })
        //统计员工(待转正，已转正，代离职)
        $.ajax({
            url: "countEmpStateYLP",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#dzz").html(data[0].countstate);
                $("#yzz").html(data[1].countstate);
                $("#dlz").html(data[2].countstate);
            }
        })
        //合同到期提醒
        $.ajax({
            url: "countContractYLP",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#daoqi").html(data.countnum);
            }
        })
        //加班审批
        $.ajax({
            url: "countOvertimeYLP",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#jiaban").html(data.countnum);
            }
        })
        //离职审批
        $.ajax({
            url: "countDimissionYLP",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#lizhi").html(data.countnum);
            }
        })
        //休假审批
        $.ajax({
            url: "countLeaveYLP",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#xiujia").html(data.countnum);
            }
        })
        //培训课程审批
        $.ajax({
            url: "countKecYLP",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#peixin").html(data.countnum);
            }
        })
        //培训课程审批
        $.ajax({
            url: "countInttwoYLP",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#luqu").html(data.countnum);
            }
        })


      //公司公告栏
        $.ajax({
            url: "sendmessage/betweendatezhong",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#gstbody").html("");
                for ( var i = 0; i < data.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data[i].metext+"</td>";
                    tr+="<td>"+data[i].begintime+"</td>";
                    tr+="</tr>";
                    $("#gstbody").append(tr);
                }
            }
        })
        //部门公告栏
        $.ajax({
            url: "sendmessage/betweendateyiban",
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#bmtbody").html("");
                for ( var i = 0; i < data.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data[i].metext+"</td>";
                    tr+="<td>"+data[i].begintime+"</td>";
                    tr+="</tr>";
                    $("#bmtbody").append(tr);
                }
            }
        })








    }


</script>
</html>
