<%--
  Created by IntelliJ IDEA.
  User: XBJ
  Date: 2018-10-25
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="assets/js/jquery.js"></script>
    <script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
</head>
<body>
        <input type="button" value="test" onclick="test()">
   
    <input type="button" value="js推送" onclick="testjs()">



</body>
</html>
<script>
    function  test() {
         alert("999999999")
        $.ajax({
            url:'ajaxwebsocket',
            type:'post'
        })
    }
    var goEasy = new GoEasy({
        appkey: "BC-ce1dd32a157e46f892f1dc98a07ebaad",
        onConnected: function () {
            alert("成功连接GoEasy。");
        },
        onDisconnected: function () {
            alert("与GoEasy连接断开。");
        },
        onConnectFailed: function (error) {
            alert("与GoEasy连接失败，错误编码："+error.code+"错误信息："+error.content);
        }
    });
    goEasy.subscribe({
        channel: "channe2",
        onMessage: function (message) {
            alert("您有新消息：channel：" + message.channel + " 内容：" + message.content);
           /// alert("99999999999++++++++")
        },
        onSuccess: function () {
            alert("Channel订阅成功。");
        },
        onFailed: function (error) {
            alert("Channel订阅失败, 错误编码：" + error.code + " 错误信息：" + error.content)
        }
    });



    function  testjs() {

        goEasy.publish({
            channel: "channe1",
            message: "3♈在吗在吗在吗睿智睿智睿智aa",
            onSuccess:function(){
                alert("消息发布成功。");
            },
            onFailed: function (error) {
                alert("消息发送失败，错误编码："+error.code+" 错误信息："+error.content);
            }
        });


    }
</script>