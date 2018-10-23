<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/15
  Time: 9:39
  To change tdis template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <script src="assets/js/jquery.js"></script>

    <style>
        #top {
            background:url('assets/img/ess-background.png');
            widtd:100%;
            height: 120px;
            text-align:center;
        }
        #f1{
            border-radius:50%;
            overflow:hidden;
            width:100px;
            height:100px;
            margin-top:0px;
            margin-left:46%;
            background:url('assets/img/mobileNoImg.jpg')
        }
        #center{
            margin-left:120px;
            height: 220px;
        }
        #center div{
           float: left;
            margin-top:30px;
        }
        #center div img{
            widtd: 150px;
            height: 150px;
            margin-left:20px;
        }
        #center div img:hover{
            filter:alpha(Opacity=80);
            -moz-opacity:0.3;
            opacity: 0.3;
            cursor:pointer
        }
        #bottom{
            margin-left: 140px;
            widtd:1000px;
            height: 300px;

        }
        #bottom_1{
            width: 990px;
            height: 25px;
            border-bottom:1px solid #19AA8D;
            widtd: auto;
        }

        #bottom_1 button{
            widtd: 120px;
            height: 25px;
           background-color: #fff;
           border: none;
            color: #babcbf;
        }

        #yin_3 img{
            widtd: 150px;
            height: 150px;
        }
        #yin_3 div{
            widtd: 150px;
            height: 150px;
            float: left;
            border: 1px solid #19AA8D;
            border-right:0px;

        }
        #yin_3 div:hover{
            filter:alpha(Opacity=100);
            -moz-opacity:0.3;
            opacity: 0.3;
            width: 180px;
            height: 180px;
            background-color: #19AA8D;
            cursor:pointer
        }
        #yin_3 img:hover{
            width: 180px;
            height: 180px;
        }
        #yin_1{
            width: 990px;
            height:500px;
            background-color: #19AA8D;
            display: none;
        }
        #yin_2{
            width: 990px;
            height:500px;
            background-color:#5cb85c;
            display: none;
        }
        #yin_3{
            width: 990px;
            display:block;
        }
        #yin_2 table tr {
            height: 40px;


        }
        #yin_2 table tr td{
             width:450px;
        }
        #yin_1 table tr {
            height: 40px;


        }
        #yin_1 table tr td{
            width:450px;
        }




    </style>
</head>
<body>
<div style="height:auto;widtd:100%;background-color: #F3F3F3;margin-top: 0px">
    <div id="top">
        <div id="f1"></div>
        <div id="f2">${emp.empnumber}</div>
    </div>
    <div id="center">
        <div onclick="d1()"><img src="assets/img/shouye1.PNG"/></div>
        <div onclick="d2()"><img src="assets/img/shouye2.PNG"/></div>
        <div onclick="d3()"><img src="assets/img/shouye3.PNG"/></div>
        <div onclick="d4()"><img src="assets/img/shouye4.PNG"/></div>
        <div onclick="d5()"><img src="assets/img/shouye5.PNG"/></div>
        <div onclick="d6()"><img  src="assets/img/shoye6.PNG"/></div>
    </div>
    <div id="bottom">

        <div id="bottom_1">
            <button id="bottom_1_1" onclick="o1()" >待审批事项</button>
            <button id="bottom_1_2" onclick="o2()">我的申请</button>
            <button id="bottom_1_3" style="background-color:#19AA8D" onclick="o3()">发起申请</button>
        </div>
        <div id="bottom_2">
            <div id="yin_1">
                <table>

                    <tbody id="mybody1">

                    </tbody>
                </table>
            </div>
            <div id="yin_2">
                <table>

                    <tbody id="mybody">

                    </tbody>
                </table>
            </div>
            <div id="yin_3">
                <div onclick="i1()"><img src="assets/img/s1.PNG"/></div>
                <div onclick="i2()"><img src="assets/img/s6.PNG"/></div>
                <div onclick="i3()"><img src="assets/img/s7.PNG"/></div>
            </div>
        </div>
    </div>

</div>
<input value="${emp.empid}" id="empidid" type="hidden">
</body>
</html>
<script>
    function d4() {

//个人中心
       $.ajax({
             url:"L_query_user",
             type:"post",
             data:{"empid":$("#empidid").val()},
             dataType:"json",
           success:function (data) {
                 alert(data);
                 window.location.href="L_user";

           }
           }
       )
    }
    function i1() {
        alert("请假申请");
//请假申请

        $.ajax({
                url:"L_query_user",
                type:"post",
                data:{"empid":$("#empidid").val()},
                dataType:"json",
                success:function (data) {
                    alert(data);
                    window.location.href="L_leave";

                }
            }
        )
    }
    //三个按钮点击事件
    var b3 = document.getElementById('bottom_1_3');
    var b2 = document.getElementById('bottom_1_2');
    var b1 = document.getElementById('bottom_1_1');
    var y3 = document.getElementById('yin_3');
    var y2 = document.getElementById('yin_2');
    var y1 = document.getElementById('yin_1');
    function o1(){
        b2.style.background='#fff';
        b3.style.background='#fff';
        b1.style.background='#19AA8D';
        y1.style.display='block';
        y3.style.display='none';
        y2.style.display='none';
        $.ajax({
                url:"L_query_leave",
                type:"post",
                data:{"empid":$("#empidid").val(),"leasate":0},
                dataType:"json",
                success:function (data) {
                    alert(data);
                    $("#mybody1").html("");
                    for(var i=0;i<data.length;i++){
                        var tab="<table>";
                        var tab1="</table>";
                        var tr="<tr>";
                        tr+="<td>休假申请</td>";
                        tr+="<td>"+'申请时间:'+data[i].shendate+"</td>";
                        tr+="<td>请假状态：审核中</td>";
                        tr+="</tr>";
                        tr+="<td>"+'姓名:'+data[i].empname+"</td>";
                        tr+="<td>"+'类型:'+data[i].leatype+"</td>";
                        tr+="</tr>";
                        tr+="<td>"+'理由:'+data[i].leareason+"</td>";
                        tr+="<td>"+'请假时间/天数:'+data[i].leaenterdate+'/'+data[i].leaday+"天</td>";
                        tr+="</tr>";

                        $("#mybody1").append(tab+tr+tab1);

                    }
                }
            }
        )
    }
    function o2(){
        b1.style.background='#fff';
        b3.style.background='#fff';
        b2.style.background='#19AA8D';
        y3.style.display='none';
        y2.style.display='block';
        y1.style.display='none';
        $.ajax({
                url:"L_query_leave",
                type:"post",
                data:{"empid":$("#empidid").val()},
                dataType:"json",
                success:function (data) {
                   alert(data);
                    $("#mybody").html("");
                    for(var i=0;i<data.length;i++){
                        var tab="<table>";
                        var tab1="</table>";
                        var tr="<tr>";
                        tr+="<td>休假申请</td>";
                        tr+="<td>"+'申请时间:'+data[i].shendate+"</td>";
                        tr+="<td>请假状态：审核中</td>";
                        tr+="</tr>";
                        tr+="<td>"+'姓名:'+data[i].empname+"</td>";
                        tr+="<td>"+'类型:'+data[i].leatype+"</td>";
                        tr+="</tr>";
                        tr+="<td>"+'理由:'+data[i].leareason+"</td>";
                        tr+="<td>"+'请假时间/天数:'+data[i].leaenterdate+'/'+data[i].leaday+"天</td>";
                        tr+="</tr>";

                        $("#mybody").append(tab+tr+tab1);

                    }
                }
            }
        )
        alert("hello world222");
    }
    function o3(){

        b1.style.background='#fff';
        b2.style.background='#fff';
        b3.style.background='#19AA8D';
        y2.style.display='none';
        y3.style.display='block';
        y1.style.display='none';
        alert("hello world.3333");
    }

function  d6() {
    window.location.href="L_list";
}

</script>
