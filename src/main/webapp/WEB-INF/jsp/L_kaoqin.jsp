<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/23
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考勤假期</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script src="assets/js/laydate/laydate.js"></script>
</head>
<body style="background-color: #c9cdd7">
<div style="margin-top:20px;margin-left:20px;height:620px;width: 1260px;border: 1px solid #4cae4c">
   <div style="margin-left:80px;margin-top:20px;width:1260px;height: auto">
       <input value="${emp.empid}" hidden id="empid">
       申请日期:<input readonly="readonly" type="text" id="test1"/>至
        <input readonly="readonly" type="text" id="test2"/>
        <select id="pid" style="width: 150px;margin-left:50px">
            <option value="1">我的休假</option>
            <option value="2">我的加班</option>
            <option value="3">我的离职</option>
        </select>
        <span style="margin-left:100px;" >流程状态:</span><select id="stat" style="width:150px">
            <option>--请选择--</option>
            <option value="0">未审批</option>
            <option value="1">已审批</option>
            <option value="2">驳回</option>
            <option value="3">已撤销</option>
        </select>
       <button onclick="query()">查询</button>
    </div>
      <div id="mybody" style="width:1020px;height:500px;border: 2px solid #ac2925;margin-left:110px">
      </div>
</div>
</body>
</html>
<script>
    laydate.render({
        elem: '#test1'
        ,type: 'datetime'
    });

    laydate.render({
        elem: '#test2'
        ,type: 'datetime'
    });
    /*页面加载全部请假信息------------------*/
    $(function () {
        $.ajax({
            url:"L_query_leave",
            type:"post",
            data:{"empid":$("#empid").val()},
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
                        div += "<input id='leaid' hidden value='"+data[i].leaid+"' />";
                        div += "<span  style='font-size:20px;color: #668FB8'> 休假申请</span>";
                        div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].shendate + "</span>";
                        div += "<span style='margin-left:650px; '>审核中 </span><br/>";
                        div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                        div += "<span>" + '姓名:' + data[i].empname + "<span>";
                        div += "<span style='margin-left: 250px'>" + '类型:' + data[i].leatype + "</span><br/><br/>";
                        div += "<span>" + '理由:' + data[i].leareason + "</span><br/><br/>";
                        div += "<span>" + '请假时间/天数:' + data[i].leaenterdate + '/' + data[i].leaday + "天</span>";
                        div += "<button  onclick='query1()' style='margin-left:80px'>撤回</button>";
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

                    }
                    if (data[i].leasate == 3) {
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
                }}})
                })
    /*模糊查询------------------------------------------------------*/
    function query() {
        var zhi=$("#pid").val();
        alert(zhi);
        if(zhi==1){
            $.ajax({
                url:"L_query_xiujia",
                type:"post",
                data:{"empid":$("#empid").val(),"fristdate":$("#test1").val(),"overdate":$("#test2").val(),"leasate":$("#stat").val()},
                dataType:"json",
                success:function (data) {

                  $("#mybody").html("");
            for (var i = 0; i < data.length; i++) {
                /*请假所有申请*/
                if (data[i].leasate == '') {

                }
                if (data[i].leasate == 0) {
                    var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                    div += "<input id='leaid' hidden value='data[i].leaid' />";
                    div += "<span  style='font-size:20px;color: #668FB8'> 休假申请</span>";
                    div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].shendate + "</span>";
                    div += "<span style='margin-left:650px; '>审核中 </span><br/>";
                    div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                    div += "<span>" + '姓名:' + data[i].empname + "<span>";
                    div += "<span style='margin-left: 250px'>" + '类型:' + data[i].leatype + "</span><br/><br/>";
                    div += "<span>" + '理由:' + data[i].leareason + "</span><br/><br/>";
                    div += "<span>" + '请假时间/天数:' + data[i].leaenterdate + '/' + data[i].leaday + "天</span>";
                    div+="<button  onclick='query4()' style='margin-left:80px'>撤回</button>";
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

                }
                if (data[i].leasate == 3) {
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
            }}})}
        if(zhi==2){
                        $.ajax({
                            url: "L_query_jiaban",
                            type: "post",
                            data: {
                                "empid": $("#empid").val(),
                                "fristdate": $("#test1").val(),
                                "overdate": $("#test2").val(),
                                "apovstate":$("stat").val()
                            },
                            dataType: "json",
                            success: function (data) {

                                alert(data);
                                $("#mybody").html("");
                                for (var i = 0; i < data.length; i++) {

                                    /*加班所有申请*/
                                    if (data[i].apovstate == '') {

                                    }
                                    if (data[i].apovstate == 0) {
                                        var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                                        div += "<input id='apovid' hidden value='data[i].apovid' />";
                                        div += "<span  style='font-size:20px;color:#4cae4c'> 加班申请</span>";
                                        div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].apoverdate + "</span>";
                                        div += "<span style='margin-left:650px; '>审核中 </span><br/>";
                                        div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                                        div += "<span>" + '姓名:' + data[i].empname + "<span>";
                                        div += "<span style='margin-left: 250px'>" + '类型:' + data[i].apovtype + "</span><br/><br/>";
                                        div += "<span>" + '理由:' + data[i].apovreason + "</span><br/><br/>";
                                        div += "<span>" + '加班时间/小时:' + data[i].apovhour + "/ 小时</span>";
                                        div+="<button  onclick='query2()' style='margin-left:80px'>撤回</button>";
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


                                    }
                                    if (data[i].apovstate == 3) {
                                        var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                                        div += "<span  style='font-size:20px;color:#4cae4c'> 加班申请</span>";
                                        div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].apoverdate + "</span>";
                                        div += "<span style='margin-left:650px; '>驳回 </span><br/>";
                                        div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                                        div += "<span>" + '姓名:' + data[i].empname + "<span>";
                                        div += "<span style='margin-left: 250px'>" + '类型:' + data[i].apovtype + "</span><br/><br/>";
                                        div += "<span>" + '理由:' + data[i].apovreason + "</span><br/><br/>";
                                        div += "<span>" + '加班时间/小时:' + data[i].apovhour + "/ 小时</span>";
                                        div += "</div>"

                                        $("#mybody").append(div);


                                    }
                                }
                            }
                        })}
        if(zhi==3){
                $.ajax({
                    url:"L_query_cizhi",
                    type:"post",
                    data:{"empid":$("#empid").val(),"fristdate":$("#test1").val(),"overdate":$("#test2").val(),"dimstate":$("stat").val()},
                    dataType:"json",
                    success:function (data) {
                        alert(data);
                        $("#mybody").html("");
                            for (var i = 0; i < data.length; i++) {
                                if (data[i].dimstate == '') {

                                }
                                if (data[i].dimstate == 0) {
                                    var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                                    div += "<input id='dimid' hidden value='data[i].dimid' />";
                                    div += "<span  style='font-size:20px;color:#ac2925'> 离职申请</span>";
                                    div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].dimapplydate + "</span>";
                                    div += "<span style='margin-left:650px; '>审核中 </span><br/>";
                                    div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                                    div += "<span>" + '姓名:' + data[i].empname + "<span>";
                                    div += "<span style='margin-left: 250px'>" + '类型:' + data[i].dimtype + "</span><br/><br/>";
                                    div += "<span>" + '离职原因:' + data[i].dimdetails + "</span><br/><br/>";
                                    div += "<span>" + '对公司的建议:' + data[i].dimsuggest + "</span><br/><br/>";
                                    div+="<button  onclick='query3()' style='margin-left:80px'>撤回</button>";
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
                                if (data[i].dimstate == 3) {
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
                            } }})}

    /*------撤回未审批的请假 状态为3----------------*/


        }

    function query1() {
        alert("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa傻逼")
        alert($("#leaid").val())
        $.ajax({
            url: "L_update_xiujia",
            type: "post",
            data: {"leaid": $("#leaid").val()},
            dataType: "text",
            success: function (data) {
                if (data == "ok") {
                    window.location.href = "L_kaoqin"
                }
            }
        })}

    function query4() {
        alert("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa傻逼")
        alert($("#leaid").val())
        $.ajax({
            url: "L_update_xiujia",
            type: "post",
            data: {"leaid": $("#leaid").val()},
            dataType: "text",
            success: function (data) {
                if (data == "ok") {
                    window.location.href = "L_kaoqin"
                }
            }
        })}



    function query2() {
        alert("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa傻逼")
        alert($("#apovid").val())
        $.ajax({
            url: "L_update_jiaban",
            type: "post",
            data: {"apovid": $("#apovid").val()},
            dataType: "text",
            success: function (data) {
                if (data == "ok") {
                    window.location.href = "L_kaoqin"
                }
            }
        })}




    function query3() {
        alert("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa傻逼")
        alert($("#dimid").val())
        $.ajax({
            url: "L_update_cizhi",
            type: "post",
            data: {"dimid": $("#dimid").val()},
            dataType: "text",
            success: function (data) {
                if (data == "ok") {
                    window.location.href = "L_kaoqin"
                }
            }
        })}
</script>
