<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/18
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head >
    <title>Title</title>
    <script src="assets/js/jquery.js"></script>
    <style>
        #zhu{
            width: 1000px;
            height: auto;
            margin-top: 50px;
            margin-left: 150px;
          background-color: #dff0d8;

        }
        /*0------------------*/
        #bottom{
            width:1000px;
            height:600px;

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
            margin-left:530px;
        }

        #bottom_1 button{
            width: 120px;
            height: 25px;
            background-color: #fff;
            border: none;
            color: #babcbf;
        }

         #center{
             margin-top: 20px;
         }
        #center div{
            float:left;
        }
        #center_left{

            width: 245px;
            height: 500px;
            background-color: #FFFFFF;
        }
        #center_right{
            margin-left:20px;
            width: 734px;
            height: 600px;

        }
       #gangwei{
           margin-top: 20px;
           width: 1000px;
           height: 300px;
           background-color: #FFFFFF;
           display: none;
       }
   /*     #sub_menu_1{
            display: none;
        }*/
        ul li:hover{
            cursor: pointer;
        }
        ul{
            list-style: none;
        }
        ul li{
            list-style: none;
        }
    </style>
</head>
<body style="background-color: #babcbf">
<div id="zhu" >
<div id="bottom">
    <div id="bottom_1">
        <input hidden id="empid" value="${emp.empid}"/>
        <button id="bottom_1_1" onclick="t1()" style="background-color:#19AA8D">公司通讯录</button>
        <button id="bottom_1_2" onclick="t2()">岗位说明书</button>
        <input id="input_val" type="text" placeholder="请输入员工姓名"/><button style="width:60px;height:20px;margin-left:10px;background-color: #19AA8D" onclick="b_query()">查询</button>
    </div>
      <div id="center">
       <div id="center_left">
           <ul >
               <li onclick ="sub_menu()">所有员工
                  <ul id="sub_menu_1"></ul>
           </li>
           </ul>
       </div>
       <div id="center_right"></div>
    </div>
      <div id="gangwei">
          <table id="aa"></table>
      </div>
    </div>
</div>
</div>
</body>
</html>
<script>
    /*二级菜单*/
/*    var sub_1=document.getElementById("sub_menu_1");
function sub_menu() {
        if( sub_1.style.display=="block"){
            sub_1.style.display='none';
        }else
            sub_1.style.display='block';
    }*/
    var gg = document.getElementById('gangwei');
    var ct = document.getElementById('center');
    var b1 = document.getElementById('bottom_1_1');
    var b2 = document.getElementById('bottom_1_2');

    function t1(){
        b2.style.background='#fff';
        b1.style.background='#19AA8D';
        gg.style.display='none';
        ct.style.display='block';
    }
    function t2(){
        b1.style.background='#fff';
        b2.style.background='#19AA8D';
        ct.style.display='none';
        gg.style.display='block';
        $.ajax({
            url: "L_query_emp_empid",
            type: "post",
            data: {empid:$("#empid").val()},
            dataType: "json",
            success: function (data) {
                alert(data)
                  var tr="<tr>";
                  tr+="<td>所属部门："+data[0].deptname+"</td>";
                  tr+="<td>编制人数："+data[0].deptnum+"</td>";
                    tr+"</td>";
                $("#aa").append(tr);
            }
        })


    }
    $(function () {
        $.ajax({
            url: "QueryDeptYqx",
            type: "post",
            data: {},
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    var deptid=data[i].deptid;
                    var num=data[i].num;
                    if(deptid==null){
                        num=0;
                    }else {
                        num=data[i].num;
                    }
                            var li="";
                        li+="<li onclick='li(this,"+data[i].deptid+")'>"+data[i].deptname+'('+num+'/'+data[i].deptnum+')'+"</li>";
                         $("#sub_menu_1").append(li);
            }
            }
    })

        $.ajax({
            url: "L_query_emp",
            type: "post",
            data: {},
            dataType: "json",
            success: function (data) {
                alert(data)
                for (var i = 0; i < data.length; i++) {
                    var div="<div style=' background-color: #FFFFFF;width: 650px;font-size:12px;margin-top:10px'>";
                    div+="<span>姓名:"+data[i].empname+"</span>";
                    div+="<span style='margin-left:250px'>工作电话:"+data[i].phone+"</span><br/><br/>";
                    div+="<span>职位:"+data[i].roname+"</span>";
                    div+="<span style='margin-left:235px'>工作邮箱:"+data[i].email+"</span><br/><br/>";
                    div+="<span>手机:"+data[i].phone+"</span>";
                    div+="</div>";
                    $("#center_right").append(div);
                }}
        })

    })
    function li(a,b) {
        alert(b);
        $.ajax({
            url: "L_query_emp",
            type: "post",
            data: {deptid:b},
            dataType: "json",
            success: function (data) {
                alert(data)
                $("#center_right").html("");
                for (var i = 0; i < data.length; i++) {
                    var div="<div style=' background-color: #FFFFFF;width: 650px;font-size: 12px;margin-top:10px'>";
                    div+="<span>姓名:"+data[i].empname+"</span>";
                    div+="<span style='margin-left:200px'>工作电话:"+data[i].phone+"</span><br/><br/>";
                    div+="<span>职位:"+data[i].roname+"</span>";
                    div+="<span style='margin-left:248px'>工作邮箱:"+data[i].email+"</span><br/><br/>";
                    div+="<span>手机:"+data[i].phone+"</span>";
                    div+="</div><br/>";
                    $("#center_right").append(div);
                }}
        })
    }
    function b_query() {
        alert($("#input_val").val());
       $.ajax({
            url: "L_query_emp_name",
            type: "post",
            data: {empname:$("#input_val").val()},
            dataType: "json",
            success: function (data) {
                alert(data)
                $("#center_right").html("");
                for (var i = 0; i < data.length; i++) {
                    var div="<div style=' background-color: #FFFFFF;width: 650px;font-size: 12px;margin-top:10px'>";
                    div+="<span>姓名:"+data[i].empname+"</span>";
                    div+="<span style='margin-left:180px'>工作电话:"+data[i].phone+"</span><br/><br/>";
                    div+="<span>职位:"+data[i].roname+"</span>";
                    div+="<span style='margin-left:260px'>工作邮箱:"+data[i].email+"</span><br/><br/>";
                    div+="<span>手机:"+data[i].phone+"</span>";
                    div+="</div><br/>";
                    $("#center_right").append(div);
                }}
        })
    }
</script>
