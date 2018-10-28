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
        #bottom{
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
            margin-left:600px;
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
            height: auto;
            background-color: #FFFFFF;
        }
       #gangwei{
           margin-top: 20px;
           width: 1000px;
           height: 300px;
           background-color: #FFFFFF;
           display: none;
       }
    </style>
</head>
<body style="background-color: #babcbf">
<div id="zhu" >
<div id="bottom">
    <div id="bottom_1">
        <button id="bottom_1_1" onclick="t1()" style="background-color:#19AA8D">公司通讯录</button>
        <button id="bottom_1_2" onclick="t2()">岗位说明书</button>
        <input type="text" placeholder="请输入关键字"/>
    </div>
      <div id="center">
       <div id="center_left"></div>
       <div id="center_right">员工信息</div>
    </div>
      <div id="gangwei">
          <table>
          <tr>
              <td>职位名称</td><td>编制人数</td>
          </tr>
          <tr>
              <td>职位名称</td><td>编制人数</td>
          </tr>
          <tr>
            <td>职位名称</td><td>编制人数</td>
         </tr>
          <tr>
            <td>职位名称</td><td>编制人数</td>
          </tr>
          </table>
      </div>
    </div>
</div>
</div>
</body>
</html>
<script>
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
        alert("hello xianshi");
    }
    $(function () {
        $.ajax({
            url: "QueryDeptYqx",
            type: "post",
            data: {},
            dataType: "json",
            success: function (data) {
                alert(data+"aaa");
                for (var i = 0; i < data.length; i++) {
                            var ul="<ul>";
                    ul+="<li>"+data[i].deptname+'('+data[i].deptnum+')'+"</li>";
                    ul+="</ul>"
                $("#center_left").append(ul);
            }}
    })})
</script>
