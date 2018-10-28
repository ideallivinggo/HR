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
            background-color:  #F3F3F3;
            display: none;
        }
        #yin_2{
            width: 990px;
            height:500px;
            background-color: #F3F3F3;
            display: none;
        }
        #yin_3 {
            width: 990px;
            display:block;
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
                <div id="mybody1"></div>
                <div id="myjiaban1"></div>
                <div id="lizhi1"></div>
            </div>
            <div id="yin_2">
                <div id="mybody"></div>
                <div id="myjiaban"></div>
                <div id="lizhi"></div>
            </div>
            <div id="yin_3">
                <div onclick="i1()"><img src="assets/img/s1.PNG"/></div>
            </div>
        </div>
    </div>

</div>
<input value="${emp.empid}" id="empidid" type="hidden">
</body>
</html>
<script>

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
            url: "L_query_leave",
            type: "post",
            data: {"empid": $("#empidid").val(), "leasate": 0},
            dataType: "json",
            success: function (data) {
                $("#mybody1").html("");
                for (var i = 0; i < data.length; i++) {

                    alert(data);
                    $("#mybody").html("");
                    for (var i = 0; i < data.length; i++) {
                        /*请假所有申请*/
                        if (data[i].leasate == '') {

                        }
                        if (data[i].leasate == 0) {
                            var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                            div += "<span  style='font-size:20px;color: #668FB8'> 休假申请</span>";
                            div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].shendate + "</span>";
                            div += "<span style='margin-left:650px; '>审核中 </span><br/>";
                            div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                            div += "<span>" + '姓名:' + data[i].empname + "<span>";
                            div += "<span style='margin-left: 250px'>" + '类型:' + data[i].leatype + "</span><br/><br/>";
                            div += "<span>" + '理由:' + data[i].leareason + "</span><br/><br/>";
                            div += "<span>" + '请假时间/天数:' + data[i].leaenterdate + '/' + data[i].leaday + "天</span>";
                            div += "</div>"

                            $("#mybody").append(div);

                        }
                        if (data[i].leasate == 1) {


                        }
                        if (data[i].leasate == 2) {
                        }


                        /*-------------------------------------------------------------------*/

                        /*加班所有申请*/
                        if (data[i].apovstate == '') {

                        }
                        if (data[i].apovstate == 0) {
                            var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                            div += "<span  style='font-size:20px;color:#4cae4c'> 加班申请</span>";
                            div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].apoverdate + "</span>";
                            div += "<span style='margin-left:650px; '>审核中 </span><br/>";
                            div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                            div += "<span>" + '姓名:' + data[i].empname + "<span>";
                            div += "<span style='margin-left: 250px'>" + '类型:' + data[i].apovtype + "</span><br/><br/>";
                            div += "<span>" + '理由:' + data[i].apovreason + "</span><br/><br/>";
                            div += "<span>" + '加班时间/小时:' + data[i].apovhour + "/ 小时</span>";
                            div += "</div>"

                            $("#mybody").append(div);

                        }
                        if (data[i].apovstate == 1) {


                        }
                        if (data[i].apovstate == 2) {

                        }

                        /*-------------------------------------------------------------------*/

                        /*离职*/
                        if (data[i].dimstate == '') {

                        }
                        if (data[i].dimstate == 0) {
                            var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                            div += "<span  style='font-size:20px;color:#ac2925'> 离职申请</span>";
                            div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].dimapplydate + "</span>";
                            div += "<span style='margin-left:650px; '>审核中 </span><br/>";
                            div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                            div += "<span>" + '姓名:' + data[i].empname + "<span>";
                            div += "<span style='margin-left: 250px'>" + '类型:' + data[i].dimtype + "</span><br/><br/>";
                            div += "<span>" + '离职原因:' + data[i].dimdetails + "</span><br/><br/>";
                            div += "<span>" + '对公司的建议:' + data[i].dimsuggest + "</span><br/><br/>";
                            div += "</div>"
                            $("#mybody").append(div);

                        }
                        if (data[i].dimstate == 1) {

                        }
                        if (data[i].dimstate == 2) {
                        }

                    }
                }
            }
        } )
    }
    function o2(){
        alert("aaa");
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
                    for (var i = 0; i < data.length; i++) {
                        /*请假所有申请*/
                        if (data[i].leasate == '') {

                        }
                        if (data[i].leasate == 0) {
                            var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                            div += "<span  style='font-size:20px;color: #668FB8'> 休假申请</span>";
                            div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].shendate + "</span>";
                            div += "<span style='margin-left:650px; '>审核中 </span><br/>";
                            div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                            div += "<span>" + '姓名:' + data[i].empname + "<span>";
                            div += "<span style='margin-left: 250px'>" + '类型:' + data[i].leatype + "</span><br/><br/>";
                            div += "<span>" + '理由:' + data[i].leareason + "</span><br/><br/>";
                            div += "<span>" + '请假时间/天数:' + data[i].leaenterdate + '/' + data[i].leaday + "天</span>";
                            div += "</div>"

                            $("#mybody").append(div);

                        }
                        if (data[i].leasate == 1) {
                            var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                            div += "<span  style='font-size:20px;color: #668FB8'> 休假申请</span>";
                            div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].shendate + "</span>";
                            div += "<span style='margin-left:650px; '>通过</span><br/>";
                            div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                            div += "<span>" + '姓名:' + data[i].empname + "<span>";
                            div += "<span style='margin-left: 250px'>" + '类型:' + data[i].leatype + "</span><br/><br/>";
                            div += "<span>" + '理由:' + data[i].leareason + "</span><br/><br/>";
                            div += "<span>" + '请假时间/天数:' + data[i].leaenterdate + '/' + data[i].leaday + "天</span><br/><br/>";
                            div += "<span>" + '审批人/审批时间:部门主管' + '/' + data[i].pidate + "</span><br/><br/>";
                            div += "</div>"

                            $("#mybody").append(div);

                        }
                        if (data[i].leasate == 2) {
                            var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                            div += "<span  style='font-size:20px;color: #668FB8'> 休假申请</span>";
                            div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].shendate + "</span>";
                            div += "<span style='margin-left:650px; '>驳回</span><br/>";
                            div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                            div += "<span>" + '姓名:' + data[i].empname + "<span>";
                            div += "<span style='margin-left: 250px'>" + '类型:' + data[i].leatype + "</span><br/><br/>";
                            div += "<span>" + '理由:' + data[i].leareason + "</span><br/><br/>";
                            div += "<span>" + '请假时间/天数:' + data[i].leaenterdate + '/' + data[i].leaday + "天</span><br/><br/>";
                            div += "<span>" + '审批人/审批时间:部门主管' + '/' + data[i].pidate + "</span><br/><br/>";
                            div += "<span>" + '驳回理由' + data[i].noleareason + "</span>";
                            div += "</div>"

                            $("#mybody").append(div);


                            /*-------------------------------------------------------------------*/

                            /*加班所有申请*/
                            if (data[i].apovstate == '') {

                            }
                            if (data[i].apovstate == 0) {
                                var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                                div += "<span  style='font-size:20px;color:#4cae4c'> 加班申请</span>";
                                div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].apoverdate + "</span>";
                                div += "<span style='margin-left:650px; '>审核中 </span><br/>";
                                div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                                div += "<span>" + '姓名:' + data[i].empname + "<span>";
                                div += "<span style='margin-left: 250px'>" + '类型:' + data[i].apovtype + "</span><br/><br/>";
                                div += "<span>" + '理由:' + data[i].apovreason + "</span><br/><br/>";
                                div += "<span>" + '加班时间/小时:' + data[i].apovhour + "/ 小时</span>";
                                div += "</div>"

                                $("#mybody").append(div);

                            }
                            if (data[i].apovstate == 1) {
                                var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                                div += "<span  style='font-size:20px;color:#4cae4c'> 加班申请</span>";
                                div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].apoverdate + "</span>";
                                div += "<span style='margin-left:650px; '>通过 </span><br/>";
                                div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                                div += "<span>" + '姓名:' + data[i].empname + "<span>";
                                div += "<span style='margin-left: 250px'>" + '类型:' + data[i].apovtype + "</span><br/><br/>";
                                div += "<span>" + '理由:' + data[i].apovreason + "</span><br/><br/>";
                                div += "<span>" + '加班时间/小时:' + data[i].apovhour + "/ 小时</span><br/><br/>";
                                div += "<span>" + '审批人/审批时间:部门主管' + '/' + data[i].shentime + "</span><br/><br/>";
                                div += "</div>"

                                $("#mybody").append(div);

                            }
                            if (data[i].apovstate == 2) {
                                var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                                div += "<span  style='font-size:20px;color:#4cae4c'> 加班申请</span>";
                                div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].apoverdate + "</span>";
                                div += "<span style='margin-left:650px; '>驳回 </span><br/>";
                                div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                                div += "<span>" + '姓名:' + data[i].empname + "<span>";
                                div += "<span style='margin-left: 250px'>" + '类型:' + data[i].apovtype + "</span><br/><br/>";
                                div += "<span>" + '理由:' + data[i].apovreason + "</span><br/><br/>";
                                div += "<span>" + '加班时间/小时:' + data[i].apovhour + "/ 小时</span>";
                                div += "<span>" + '审批人/审批时间:部门主管' + '/' + data[i].shentime + "</span><br/><br/>";
                                div += "<span>" + '驳回理由' + data[i].bohui + "</span>";
                                div += "</div>"

                                $("#mybody").append(div);





                                /*-------------------------------------------------------------------*/

                                /*离职*/
                                if (data[i].dimstate == '') {

                                }
                                if (data[i].dimstate == 0) {
                                    var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                                    div += "<span  style='font-size:20px;color:#ac2925'> 离职申请</span>";
                                    div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].dimapplydate + "</span>";
                                    div += "<span style='margin-left:650px; '>审核中 </span><br/>";
                                    div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                                    div += "<span>" + '姓名:' + data[i].empname + "<span>";
                                    div += "<span style='margin-left: 250px'>" + '类型:' + data[i].dimtype + "</span><br/><br/>";
                                    div += "<span>" + '离职原因:' + data[i].dimdetails + "</span><br/><br/>";
                                    div += "<span>" + '对公司的建议:' + data[i].dimsuggest + "</span><br/><br/>";
                                    div += "</div>"
                                    $("#mybody").append(div);

                                }
                                if (data[i].dimstate == 1) {
                                    var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                                    div += "<span  style='font-size:20px;color:#ac2925'> 离职申请</span>";
                                    div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].dimapplydate + "</span>";
                                    div += "<span style='margin-left:650px; '>同意离职 </span><br/>";
                                    div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                                    div += "<span>" + '姓名:' + data[i].empname + "<span>";
                                    div += "<span style='margin-left: 250px'>" + '类型:' + data[i].dimtype + "</span><br/><br/>";
                                    div += "<span>" + '离职原因:' + data[i].dimdetails + "</span><br/><br/>";
                                    div += "<span>" + '对公司的建议:' + data[i].dimsuggest + "</span><br/><br/>";
                                    div += "<span>" + '审批时间:' + data[i].shendimdate + "</span>";
                                    div += "<span style='margin-left: 50px'>请尽快到人事部办理相关手续</span><br/><br/>";
                                    div += "</div>"
                                    $("#mybody").append(div);

                                }
                                if (data[i].dimstate == 2) {
                                    var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                                    div += "<span  style='font-size:20px;color:#ac2925'> 离职申请</span>";
                                    div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].dimapplydate + "</span>";
                                    div += "<span style='margin-left:650px; '>驳回离职 </span><br/>";
                                    div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                                    div += "<span>" + '姓名:' + data[i].empname + "<span>";
                                    div += "<span style='margin-left: 250px'>" + '类型:' + data[i].dimtype + "</span><br/><br/>";
                                    div += "<span>" + '离职原因:' + data[i].dimdetails + "</span><br/><br/>";
                                    div += "<span>" + '对公司的建议:' + data[i].dimsuggest + "</span><br/><br/>";
                                    div += "<span>" + '驳回理由:' + data[i].nodim + "</span><br/><br/>";
                                    div += "<span>" + '审批时间:' + data[i].shendimdate + "</span><br/><br/>";
                                    div += "</div>"
                                    $("#mybody").append(div);






                                }
                        }
                    }
                }}}
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



function d1() {
    window.location.href="L_jiaban";
}
function d2() {
        window.location.href="";
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
                    alert(data);
                    window.location.href="L_user";

                }
            }
        )
    }
function d5() {
        window.location.href= "L_kaoqin";
    }
function d6() {
        window.location.href="L_list";
    }

</script>
