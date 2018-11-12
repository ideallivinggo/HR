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
    <title>Title</title>
    <script src="../../assets/js/jquery.js"></script>
    <script src="../../assets/js/chart-master/Chart.js"></script>
</head>
<style>
    #content {
        margin: 10px;

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
        width: 277px;
        height: 155px;
        background-color: #FFFFFF;
        border-radius:30px;
        margin-top: -10px;
    }

    .matter1{
        border: 20px solid #F3F3F9;
        width: 320px;
        height: 400px;
        background-color: #FFFFFF;
        border-radius:30px;
        text-align: center;
    }
    .matter{
        border: 20px solid #F3F3F9;
        width: 500px;
        height: 400px;
        background-color: #FFFFFF;
        border-radius:30px;
        text-align: center;
    }
    .tu{
        margin-left: 170px;
        margin-top: -100px;
    }
    .shu{
        width: 120px;
        height: 100px;
        text-align: center;
        line-height: 100px;
        margin-left: 20px;
        font-family: 微软雅黑;
        font-size: 20px;
    }
    .ziti{
        width: 277px;
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
        width: 155px;
        height: 160px;
        background-color: #FFFFFF;
        cursor: pointer;
    }
    .items:hover{
        color: #979797;
    }
</style>
<body>
<div id="content">
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
        <div class="matter1">
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
        </div>
        <div class="matter">
            <p style="font-size: 20px">人员构成分析</p>
            <canvas id="bar" height="300" width="470"></canvas><!--图表-->
        </div>
        <div class="matter1">
            <p style="font-size: 20px">公告栏</p>
        </div>
    </div>

</div>
</body>
<script>
    $(function () {
        countEmpstate();
    })
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
    }

    $(function(){
        $('select.styled').customSelect();
    });

    var Script = function () {

        var barChartData = {
            labels : ["Jauaryn","February","March","April","May","June","July"],
            datasets : [
                {
                    fillColor : "rgba(220,220,220,0.5)",
                    strokeColor : "rgba(220,220,220,1)",
                    data : [65,59,90,81,56,55,40]
                },
                {
                    fillColor : "rgba(151,187,205,0.5)",
                    strokeColor : "rgba(151,187,205,1)",
                    data : [28,48,40,19,96,27,100]
                }
            ]

        };
        new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);
    }();
</script>
</html>
