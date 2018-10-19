<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/15
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <script src="assets/js/jquery.js"></script>

    <style>
        #top {
            background:url('assets/img/ess-background.png');
            width:100%;
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
            width: 150px;
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
            width:1000px;
            height: 300px;

        }
        #bottom_1{
            height: 25px;
            border-bottom:1px solid #19AA8D;
            width: auto;
        }
        #bottom_1 input{
            height: 20px;
            width: 150px;
            border:1px solid #19AA8D;
            margin-left:474px;
        }
        #bottom_1 button{
            width: 120px;
            height: 25px;
           background-color: #fff;
           border: none;
            color: #babcbf;
        }

        #yin_3 img{
            width: 150px;
            height: 150px;
        }
        #yin_3 div{
            width: 150px;
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
            width: auto;
            height:500px;
            background-color: #19AA8D;
            display: none;
        }
        #yin_2{
            width: auto;
            height:500px;
            background-color:#5cb85c;
            display: none;
        }
        #yin_3{
            display:none;
        }



    </style>
</head>
<body>
<div style="height:auto;width:100%;background-color: #F3F3F3;margin-top: 0px">
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
            <button id="bottom_1_1" onclick="o1()" style="background-color:#19AA8D">待审批事项</button>
            <button id="bottom_1_2" onclick="o2()">我的申请</button>
            <button id="bottom_1_3" onclick="o3()">发起申请</button>
            <input type="text" placeholder="请输入关键字"/>
        </div>
        <div id="bottom_2">
            <div id="yin_1"></div>
            <div id="yin_2"></div>
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
//个人中心

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
    function o1(){
        b2.style.background='#fff';
        b3.style.background='#fff';
        b1.style.background='#19AA8D';
        y3.style.display='none';
        alert("hello world");
    }
    function o2(){

        b1.style.background='#fff';
        b3.style.background='#fff';
        b2.style.background='#19AA8D';
        y3.style.display='none';
        alert("hello world222");
    }
    function o3(){

        b1.style.background='#fff';
        b2.style.background='#fff';
        b3.style.background='#19AA8D';
        y3.style.display='block';
        alert("hello world.3333");
    }

function  d6() {
    window.location.href="L_list";
}
</script>
