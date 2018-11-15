<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/12
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html >
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <style>
        .aa{
         float:left;
         height: 180px;
         width: 295px;
         margin-top:30px;
         margin-left: 30px;

     }
        .center{
            height:100px;
            width:1000px;
            margin: 0 auto;


        }
        .center div{
            float:left;
            height: 60px;
            width: 944px;
            margin-top: 25px;
            margin-left: 30px;
            background-color: rgba(200, 218, 222, 0.32);
            font-size: 20px;
            text-align:center;
            line-height:60px;
        }
        .bottom{

            margin-top:210px;
            margin-left: 30px;
        }
        .bottom div {
            height: 60px;
            width: 943px;
            background-color: #19AA8D;
            text-align:center;
            line-height:60px;
            font-size: 20px;
            color: #e3e3e3;
            font-weight: bold;

        }
        #img1{
          border-radius:50%;
            overflow:hidden;
            width:150px;
            height:150px;
            margin-top: 10px;
        }
        .center div:hover{  /*3、鼠标悬浮状态*/
         color: #7f8c9a;
         cursor:pointer
     }
        .center div a{
            text-decoration:none
        }
        .bottom div:hover{
            cursor:pointer
        }
        #form1 input{
           height: 42px;
        }
        #form2 input{
            height: 42px;
        }
        a{
            text-decoration:none
        }
    </style>
</head>

<body style="background-color: #F3F3F3">


<%--页面内容--%>
     <div style="height:635px;width:1298px;margin-top:100px ">

         <div  style="background-color: #FFFFFF;height:420px;width:1000px;margin: 20px auto;">
             <div>
             <div class="aa"  align="center"  >
                <img id="img1" src="assets/img/mobileNoImg.jpg">
             </div>
             <div class="aa">
                 <tr>
                     姓名：<td>${emp.empname}</td><br><br>
                     工号：<td>${emp.empnumber}</td><br><br>
                     电话：<td>${emp.phone}</td><br><br>
                     职位：<td>${emp.roname}</td><br><br>
                     入职日期：<td>${emp.empstatedate}</td>
                 </tr>
             </div>
             <div class="aa">
                 <tr>
                 手机号码：<td>${emp.phone}</td><br><br>
                 所属部门：<td>${emp.deptname}</td><br><br>
                 工作邮箱：<td>${emp.email}</td><br><br>
                 工作地点：<td>${emp.recaddress}</td><br><br>
                 是否部门领导：<td>
                     <c:if test="${emp.roid == 3}">
                        是
                     </c:if>
                     <c:if test="${emp.roid == 4}">
                         否
                     </c:if>
                 </td>
                 <tr/>
             </div>
      </div>

             <div class="center">
                 <div  class="btn " data-toggle="modal" data-target="#myModal"><img src="assets/img/psd.png"><a>修改密码</a></div>
             </div>

             <div class="bottom">
                 <div onclick="xin()">我的薪资</div>
                  <div > <a href="http://localhost:8765/hi?name=${emp.empid}" style="color: white">我的薪资查询</a></div>
             </div>




         </div>



     </div>
<%--修改登录密码--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改密码
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="form1">
                        <tr><td><img src="assets/img/bbb.PNG"><input class="required" name="empnumber" id="empnumber" value="${emp.empnumber}"   readonly="readonly"type="text" placeholder="员工号"></td></tr><br><br>
                        <tr><td><img src="assets/img/ccc.PNG"><input class="required" name="pwd" id="password"type="password" placeholder="原密码"></td><br><br>
                        <tr><td><img src="assets/img/password.PNG"><input class="required" name="repwd" id="repassword" type="password" placeholder="新密码"> </td></tr>
                    </form>
                <div class="modal-footer">
                    <button type="button"  class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="tijiao()" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    </div>
<%--修改查询密码--%>
<%--<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel1">
                    修改查询密码
                </h4>
            </div>
            <div class="modal-body">
                <form id="form2">
                    <tr><td><img src="assets/img/aaa.PNG"><input type="text" placeholder="请输入证件号"></td><br><br>
                    <tr> <td><img src="assets/img/bbb.PNG"><input type="text" placeholder="请输入原密码"></td></tr><br><br>
                    <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="password" placeholder="请输入查询新密码"> </td></tr>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="tijiao2" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>--%>
</body>
</html>
<script>
    var strM = "undefined";
    strM.replace("undefined","");
    $("form :input").blur(function(){
        //验证手机号
        if($(this).is("#empnumber")){
            var phoneVal = $.trim(this.value);
            if(phoneVal== ""){
                alert("请输入员工号") ;
            }
            else{


            }
        }

        //验证密码
        if($(this).is("#password")){
            var pwdVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
            if(pwdVal == "" || pwdVal.length <4){
                alert(" 密码非空，长度5位以上");
            }

        }
        //验证新密码
        if($(this).is("#repassword")){
            var repwdVal = $.trim(this.value);
            if(repwdVal == "" || repwdVal.length <4 ){
                alert( "密码非空，长度5位以上");
            }
        }
    });




    function  xin() {
        window.location.href="L_salary";
    }
   function tijiao() {
       $.ajax({
               url:"L_update_pwd",
               type:"post",
               data:$("#form1").serialize(),
               dataType:"text",
               success:function (data) {
                  alert(data);
                  if(data=="ok"){
                      window.open('logout','_top');
                  }else{
                      alert("原始密码失败");
                  }
               }
           }
       )
   }
</script>
