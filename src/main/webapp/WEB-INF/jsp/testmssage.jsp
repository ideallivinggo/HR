<%--
  Created by IntelliJ IDEA.
  User: XBJ
  Date: 2018-10-25
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试消息框</title>
    <link href="../../assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="../../assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="../../assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
测试消息


        <div class="panel panel-success">
            <div class="panel-heading">
                张三消息记录
            </div>
            <div class="panel-body" style="padding:0px;">
                <div class="chat-widget-main">

                    <div class="chat-widget-left">
                        张三发的信息
                    </div>
                    <div class="chat-widget-name-left">
                        <h4>张三</h4>
                    </div>

                    <div class="chat-widget-left">
                        张3发的消息2
                    </div>
                    <div class="chat-widget-name-left">
                        <h4>张3</h4>
                    </div>
                    <div class="chat-widget-right">
                        李四回的信息
                    </div>
                    <div class="chat-widget-name-right">
                        <h4>李四</h4>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="消息" />
                    <span class="input-group-btn">
                                        <button class="btn btn-success" type="button">发送</button>
                                    </span>
                </div>
            </div>
        </div>


</body>
</html>
