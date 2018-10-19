<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/12
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
            width: 457px;
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
                     职位：<td>${emp.posname}</td><br><br>
                     入职日期：<td>${emp.empstatedate}</td>
                 </tr>
             </div>

             <div class="aa">
                 <tr>
                 手机号码：<td>${emp.phone}</td><br><br>
                 所属部门：<td>${emp.deptname}</td><br><br>
                 工作邮箱：<td>${emp.email}</td><br><br>
                 工作地点：<td>${emp.recaddress}</td><br><br>
                 是否部门领导：<td></td>
                 <tr/>
             </div>
      </div>

             <div class="center">
                 <div  class="btn " data-toggle="modal" data-target="#myModal"><img src="assets/img/psd.png"><a>修改密码</a></div>
                 <div class="btn" data-toggle="modal" data-target="#myModal1"><img src="assets/img/psd.png"><a>修改查询密码</a></div>
             </div>

             <div class="bottom">
                 <div><a href="logout">退出登录</a></div>
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
                        <tr><td><img src="assets/img/aaa.PNG"><input class="required" id="name"  type="text" placeholder="公司名称"></td><br><br>
                        <tr><td><img src="assets/img/bbb.PNG"><input class="required" id="phone" type="text" placeholder="登录手机号"></td></tr><br><br>
                        <tr><td><img src="assets/img/ccc.PNG"><input class="required" id="password"type="password" placeholder="原密码"></td><br><br>
                        <tr><td><img src="assets/img/password.PNG"><input class="required" id="repassword" type="password" placeholder="新密码"> </td></tr>
                    </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="tijiao" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    </div>
<%--修改查询密码--%>
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
</div>
</body>
</html>
<script>

    $("form :input").blur(function(){

        //验证姓名
        if($(this).is("#name")){
            var nameVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
            var regName = /[~#^$@%&!*()<>:;'"{}【】]/;
            if(nameVal == "" || nameVal.length <6 || regName.test(nameVal)){
                alert( " 姓名非空，长度6位以上，不包含特殊字符！");


            }
            else{


            }
        }
        //验证手机号
        if($(this).is("#phone")){
            var phoneVal = $.trim(this.value);
          var regPhone = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
            if(phoneVal== "" || (phoneVal != "" && !regPhone.test(phoneVal))){
               alert("请输入正确的手机号！") ;

            }
            else{


            }
        }

        //验证密码
        if($(this).is("#password")){
            var pwdVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
            var pwdName = /^[0-9a-zA-Z]+$/;
            if(pwdVal == "" || pwdVal.length <6 || pwdName.test(pwdVal)){
               alert(" 密码非空，长度6位以上，不包含特殊字符！");

            }
            else{


            }
        }
        //验证新密码
        if($(this).is("#repassword")){
            var repwdVal = $.trim(this.value); //原生js去空格方式：this.replace(/(^\s*)|(\s*$)/g, "")
            var repwdName = /^[0-9a-zA-Z]+$/;
            if(repwdVal == "" || repwdVal.length <6 || repwdName.test(repwdVal)){
                alert( "密码非空，长度6位以上，不包含特殊字符！");

            }
            else{


            }
        }
    });

</script>