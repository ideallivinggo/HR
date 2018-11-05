<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-10-31
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>激活工号</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
</head>

<style>
   #content{
        width: 400px;
        height: 370px;
        font-size: 18px;
        text-align: center;
        margin: 150px auto;
        background-color: #FFFFFF;
       border-radius:10px;
    }
    #biaoti{
        background-color: #2bb4e8;
        width: 100%;
        height: 50px;
        margin-bottom: 30px;
        line-height: 50px;
        font-size: 20px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        color: #FFFFFF;
        letter-spacing:10px;
    }
</style>
<body>
    <div id="content" >
        <div id="biaoti">入职激活</div>
        <form class="layui-form" id="jhForm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">入职工号</label>
                    <div class="layui-input-inline">
                        <input name="actnumber" id="actnumber" readonly value="${gh}" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">入职姓名</label>
                    <div class="layui-input-inline">
                        <input readonly value="${name}" class="layui-input" >
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">设置密码</label>
                    <div class="layui-input-inline">
                        <input name="actpwd" id="actpwd" placeholder="请设置6位密码" type="password"  class="layui-input" >
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">确认密码</label>
                    <div class="layui-input-inline">
                        <input id="qzactpwd"  placeholder="请确认密码"  type="password" class="layui-input" >
                    </div>
                </div>
            </div>
            <div style="display: none">
                <input name="actstate" value="1">
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <input type="button" value="激活" onclick="jihuo()" class="layui-btn" style="letter-spacing:15px;width: 300px"/>
                </div>
            </div>
        </form>

    </div>
<script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
<script>
    $.backstretch("assets/img/login-bg.jpg", {speed: 500});
</script>
</body>
<script>
    function jihuo() {
        var mima = $("#actpwd").val();
        var qzmima = $("#qzactpwd").val();
        if(mima == ""){
            alert("密码不能为空")
        }else if(mima.length > 6){
            alert("密码最大6位")
        }else if(mima != qzmima){
            alert("请确认密码与密码不一致")
        }else {
            $.ajax({
                url: "updateActYLP",
                type: "post",
                data: $("#jhForm").serialize(),
                dataType: "text",
                success: function (data) {
                    if(data=="true"){
                        alert("激活成功")
                        window.location.reload();
                    }
                }
            })
        }

    }

</script>


</html>
