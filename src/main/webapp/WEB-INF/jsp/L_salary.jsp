<%--
  Created by IntelliJ IDEA.
  User: 15G5567
  Date: 2018/10/17
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</head>
<style>
    #form1 input{
        width: 260px;
        height: 45px;
        margin-left: 50px;
    }

</style>
<body>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   输入薪资查询密码
                </h4>
            </div>
            <div class="modal-body">
                <form id="form1">
                   <input type="password" name="" placeholder="输入薪资查询密码" maxlength="4" oninput="value=value.replace(/[^\d]/g,'')">
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" id="tijiao" class="btn btn-primary">
                        提交
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
<div style="width: 800px;height:600px;background-color: #19AA8D">
    <h1>工资单详情</h1>
</div>
</body>
</html>
<script>

    $('#myModal').modal();

</script>
