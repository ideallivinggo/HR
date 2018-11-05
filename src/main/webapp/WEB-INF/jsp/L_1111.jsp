<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/30
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>审批中心</title>
    <script src="assets/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <style>
        #top{
            height: 45px;

        }
        .div_1{
            width:120px;
            height:25px;
            float:left;
            border-radius:2px;
            margin-left:3px;
            margin-top: 20px;
            text-align: center;
            line-height:25px;
            font-size: 13px;

        }
        #sel{
            margin-top:-45px;
            margin-left:520px;
            width: 150px;
            height: 25px;
            border-radius:4px
        }
        #div_2 input{
            border-radius:4px
        }
      #div_2{
          float: left;
          margin-left:120px;
          margin-top:20px;
      }
        #query_1111{
            margin-left: 20px;
          margin-top: -45px;
            width: 50px;
            height: 25px;
            background-color: #19aa8d;
        }
        .demo-input{
            width: 300px;
        }
        #center{
            width:1000px ;
            height:500px ;
            border:2px solid #4cae4c;
        }
    </style>
</head>
<body style="background-color: #c9cdd7">
   <div style="width:1000px;height: 600px;margin-top:50px;margin-left:150px">
       <div id="top" style="border-bottom:1px solid #4cae4c">
           <input hidden id="deptid" value="${emp.deptid}"/>
           <div onclick="o1()" style=" background-color: #00AEAE;color: #1F1F1F;" id="top_1" class="div_1">待审批事项</div>
           <div  onclick="o2()" style=" background-color: #FFFFFF;color: #999999;" id="top_2" class="div_1">已审批事项</div>
           <div id="div_2">
              申请时间:<input name="apovstartdate" required lay-verify="required" readonly="readonly" type="text" class="demo-input" placeholder="请选择日期" id="test16">
           </div>
           <select id="sel">
               <option>--选择审批类型--</option>
               <option value="5">------休假审批------</option>
               <option value="6">------加班审批------</option>
               <option value="7">------离职审批------</option>
           </select>
           <button id="query_1111" onclick="query_shen()">查询</button>
       </div>
       <div id="center">
           <div id="yin_1">
               <input hidden id="val_1" value="${emp.deptid}"/>
               <input hidden id="val_2" value="${emp.empname}"/>
                   <div id="aaa"></div>
           </div>
           <div id="yin_2">
               <div id="bbb"></div>
           </div>
       </div>
   </div>
</body>
</html>
<script>
    lay('#version').html('-v'+ laydate.v);
    //执行一个laydate实例
    laydate.render({
        elem: '#test16'
        ,type: 'datetime'
        ,range: '至'
        ,format: 'yyyy-MM-dd HH:mm:ss'
    });
    //三个按钮点击事件
    var b1 = document.getElementById('top_1');
    var b2 = document.getElementById('top_2');
    var y2 = document.getElementById('yin_2');
    var y1 = document.getElementById('yin_1');
    function o1() {
        b2.style.background = '#fff';
        b1.style.background = '#19AA8D';
        b1.style.color="#1F1F1F";
        b2.style.color="#999999";
        y1.style.display = 'block';
        y2.style.display = 'none';
        window.location.reload();
    }
    function o2() {
        b1.style.background = '#fff';
        b2.style.background = '#19AA8D';
        y2.style.display = 'block';
        y1.style.display = 'none';
        b2.style.color="#1F1F1F";
        b1.style.color="#999999";
        $.ajax({
            url:"L_queryAll_leave",
            type:"post",
            data:{"deptid":$("#deptid").val()},
            dataType:"json",
            success:function (data) {
                alert(data)
                for (var i = 0; i < data.length; i++) {
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
                        div += "<span>" + '审批人/审批时间:' + data[i].pipeople  + '/' + data[i].pidate + "</span><br/><br/>";
                        div += "</div>"

                        $("#bbb").append(div);

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
                        div += "<span>" + '审批人/审批时间:' + data[i].pipeople  + '/' + data[i].pidate + "</span><br/><br/>";
                        div += "<span>" + '驳回理由:' + data[i].bohui + "</span>";
                        div += "</div>"
                        $("#bbb").append(div);

                    }
                }
                }})
        $.ajax({
            url:"L_queryAll_jiaban",
            type:"post",
            data:{"deptid":$("#deptid").val()},
            dataType:"json",
            success:function (data) {
                alert(data)
                for (var i = 0; i < data.length; i++) {
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
                        div += "<span>" + '审批人/审批时间:' + data[i].pipeople   + '/' + data[i].shentime + "</span><br/><br/>";
                        div += "</div>"

                        $("#aaa").append(div);

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
                        div += "<span>" + '审批人/审批时间:' + data[i].pipeople  + '/' + data[i].shentime + "</span><br/><br/>";
                        div += "<span>" + '驳回理由' + data[i].bohui + "</span>";
                        div += "</div>"

                        $("#aaa").append(div);


                    }
                }
            }})

        $.ajax({
            url:"L_queryAll_lizhi",
            type:"post",
            data:{"deptid":$("#deptid").val()},
            dataType:"json",
            success:function (data) {
                alert(data)
                for (var i = 0; i < data.length; i++) {
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
                        div += "<span>" + '审批人/审批时间:' + data[i].nodim   + '/' + data[i].shendimdate + "</span>";
                        div += "<span style='margin-left: 50px'>请尽快到人事部办理相关手续</span><br/><br/>";
                        div += "</div>"
                        $("#aaa").append(div);

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
                        div += "<span>" + '驳回理由:' + data[i].bohui + "</span><br/><br/>";
                        div += "<span>" + '审批人/审批时间:' + data[i].nodim   + '/' + data[i].shendimdate + "</span>";
                        div += "</div>"
                    $("#aaa").append(div);
                }
            }}})

    }
    /*页面加载显示未办理*/
$(function () {
    alert("我是傻子");
    $.ajax({
        url:"L_shen_leave",
        type:"post",
        data:{"deptid":$("#deptid").val()},
        dataType:"json",
        success:function (data) {
              alert(data)
            for (var i = 0; i < data.length; i++) {
                var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                div+="<input hidden id='id_val_1' value='"+data[i].leaid+"'/>"
                div += "<span  style='font-size:20px;color: #668FB8'> 休假申请</span>";
                div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].shendate + "</span>";
                div += "<span style='margin-left:650px; '>未审核</span><br/>";
                div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                div += "<span>" + '姓名:' + data[i].empname + "<span>";
                div += "<span style='margin-left: 250px'>" + '类型:' + data[i].leatype + "</span><br/><br/>";
                div += "<span>" + '理由:' + data[i].leareason + "</span><br/><br/>";
                div += "<span>" + '请假时间/天数:' + data[i].leaenterdate + '/' + data[i].leaday + "天</span><br/><br/>";
                div += "<span>" + '审批人:'+ $("#val_2").val() + "</span><br/><br/>";
                div += "<span>" + '驳回理由:'+  "<input id='liyou' style='width: 500px'/>" + "</span>";
                div += "<button onclick='pass_xiujia()' value='1'>通过</button>";
                div += "<button onclick='unpass_xiujia()' value='2'>驳回</button>";
                div += "</div>"
                $("#aaa").append(div);
            }
        }})
    $.ajax({
        url:"L_shen_jiaban",
        type:"post",
        data:{"deptid":$("#deptid").val()},
        dataType:"json",
        success:function (data) {
            alert(data)
            for(var i=0;i<data.length;i++){
                var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                div+="<input hidden  id='id_val_2' value='"+data[i].apovid+"'/>"
                div += "<span  style='font-size:20px;color:#4cae4c'> 加班申请</span>";
                div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].apoverdate + "</span>";
                div += "<span style='margin-left:650px; '>未审核 </span><br/>";
                div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                div += "<span>" + '姓名:' + data[i].empname + "<span>";
                div += "<span style='margin-left: 250px'>" + '类型:' + data[i].apovtype + "</span><br/><br/>";
                div += "<span>" + '理由:' + data[i].apovreason + "</span><br/><br/>";
                div += "<span>" + '加班时间/小时:' + data[i].apovhour + "/ 小时</span><br/><br/>";
                div += "<span>" + '审批人:'+ $("#val_2").val() + "</span><br/><br/>";
                div += "<span>" + '驳回理由:'+  "<input id='liyou_2'style='width: 500px'/>" + "</span>";
                div += "<button onclick='pass_jiaban()'>通过</button>";
                div += "<button onclick='unpass_jiaban()'>驳回</button>";
                div += "</div>"
                $("#aaa").append(div);
            }
        }})
    $.ajax({
        url:"L_shen_lizhi",
        type:"post",
        data:{"deptid":$("#deptid").val()},
        dataType:"json",
        success:function (data) {
            alert(data)
            for(var i=0;i<data.length;i++){
                var div = "<div style='background-color: #FFFFFF;margin-top: 20px;padding-left: 20px'>";
                div+="<input hidden id='id_val_3'  value='"+data[i].dimid+"'/>"
                div += "<span  style='font-size:20px;color:#ac2925'> 离职申请</span>";
                div += "<span style='font-size: 12px;font-weight:500;color:#999999 '>" + data[i].dimapplydate + "</span>";
                div += "<span style='margin-left:650px; '>驳回离职 </span><br/>";
                div += "<div style='border-top:1px solid #2a6496;width: auto'></div><br/>"
                div += "<span>" + '姓名:' + data[i].empname + "<span>";
                div += "<span style='margin-left: 250px'>" + '类型:' + data[i].dimtype + "</span><br/><br/>";
                div += "<span>" + '离职原因:' + data[i].dimdetails + "</span><br/><br/>";
                div += "<span>" + '对公司的建议:' + data[i].dimsuggest + "</span><br/><br/>";
                div += "<span>" + '审批人:'+ $("#val_2").val() + "</span><br/><br/>";
                div += "<span>" + '驳回理由:'+  "<input id='liyou_3'style='width: 500px'/>" + "</span>";
                div += "<button onclick='pass_lizhi()'>通过</button>";
                div += "<button onclick='unpass_lizhi()'>驳回</button>";
                div += "</div>"
                $("#aaa").append(div);
            }
        }})
})


    /*休假点击通过驳回*/
     function  pass_xiujia() {
         $.ajax({
             url:"L_upd_xiujia_unpass",
             type:"post",
             data:{"leasate":1,"bohui":$("#liyou").val(),"leaid":$("#id_val_1").val(),"pipeople":$("#val_2").val()},
             dataType:"text",
             success:function (data) {
                  alert(data);
             }})
     }
    function  unpass_xiujia() {
         alert("aaaaa");
         var  zhi=$("#liyou").val();
         alert(zhi+"ccccccccccc");
         if(zhi!=""){
             alert("错误");
             $.ajax({
                 url:"L_upd_xiujia_unpass",
                 type:"post",
                 data:{"leasate":2,"bohui":$("#liyou").val(),"leaid":$("#id_val_1").val(),"pipeople":$("#val_2").val()},
                 dataType:"text",
                 success:function (data) {
                     alert(data);
                 }})
         }else {
             alert("请填写驳回理由");
         }

    }


    /*加班点击通过驳回*/
    function  pass_jiaban() {
        $.ajax({
            url:"L_upd_jiaban_unpass",
            type:"post",
            data:{"apovstate":1,"bohui":$("#liyou").val(),"apovid":$("#id_val_2").val(),"pipeople":$("#val_2").val()},
            dataType:"text",
            success:function (data) {
                alert(data);
            }})
    }
    function  unpass_jiaban() {
        alert("aaaaa");
        var  zhi=$("#liyou_2").val();
        alert(zhi+"ccccccccccc");
        if(zhi!=""){
            alert("错误");
            $.ajax({
                url:"L_upd_jiaban_unpass",
                type:"post",
                data:{"apovstate":2,"bohui":$("#liyou_2").val(),"apovid":$("#id_val_2").val(),"pipeople":$("#val_2").val()},
                dataType:"text",
                success:function (data) {
                    alert(data);
                }})
        }else {
            alert("请填写驳回理由");
        }

    }

    /*离职点击通过驳回*/
    function  pass_jiaban() {
        $.ajax({
            url:"L_upd_jiaban_unpass",
            type:"post",
            data:{"dimstate":1,"bohui":$("#liyou_3").val(),"dimid":$("#id_val_2").val(),"dimsign":$("#val_2").val()},
            dataType:"text",
            success:function (data) {
                alert(data);
            }})
    }
    function  unpass_jiaban(){
        alert("aaaaa");
        var  zhi=$("#liyou_3").val();
        alert(zhi+"ccccccccccc");
        if(zhi!=""){
            alert("错误");
            $.ajax({
                url:"L_upd_jiaban_unpass",
                type:"post",
                data:{"dimstate":2,"bohui":$("#liyou_3").val(),"dimid":$("#id_val_2").val(),"dimsign":$("#val_2").val()},
                dataType:"text",
                success:function (data) {
                    alert(data);
                }})
        }else {
            alert("请填写驳回理由");
        }

    }

</script>
