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


        #bottom_1 button{
            widtd: 120px;
            height: 25px;
           background-color: #fff;
           border: none;
            color: #babcbf;
        }
        #di {
           margin-left: 120px;
        }
   #di div{
       float: left;
   }
        #di div img{
            widtd: 150px;
            height: 150px;
            margin-left:20px;
        }
        #di div img:hover{
            filter:alpha(Opacity=80);
            -moz-opacity:0.3;
            opacity: 0.3;
            cursor:pointer
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
    <div id="di">
        <div onclick="d7()"><img src="assets/img/s4.PNG"/></div>
        <div onclick="d8()"><img  src="assets/img/pei.png"/></div>
        <div onclick="d9()"><img  src="assets/img/zhuan.PNG"/></div>
    </div>
</div>
<input value="${emp.empid}" id="empidid" type="hidden">
</body>
</html>
<script>
    var strM = "undefined";
    strM.replace("undefined","");
    function i1() {

        $.ajax({
                url:"L_query_user",
                type:"post",
                data:{"empid":$("#empidid").val()},
                dataType:"json",
                success:function (data) {
                    window.location.href="L_leave";

                }
            }
        )
    }

function d1() {
    window.location.href="L_leave";
}
function d2() {
        window.location.href="L_jiaban";
    }
function d3() {
        window.location.href="L_lizhi";
    }
function d4() {

//个人中心
        $.ajax({
                url:"L_query_user",
                type:"post",
                data:{"empid":$("#empidid").val()},
                dataType:"json",
                success:function (data) {
                    window.location.href="L_user";

                }
            }
        )
    }
function d5() {
        window.location.href= "L_kai_leave";
    }
function d6() {
        window.location.href="L_list";
    }
    function d7() {
        window.location.href="L_out";
    }
    function d8() {
        window.location.href="L_pei";
    }
    function d9() {
        window.location.href="L_zhuan";
    }

</script>
