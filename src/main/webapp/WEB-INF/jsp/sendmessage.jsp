<%--
  Created by IntelliJ IDEA.
  User: XBJ
  Date: 2018-11-01
  Time: 23:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Responsive Bootstrap Advance Admin Template</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="../../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <!--PAGE LEVEL STYLES-->
    <link href="../../assets/css/pricing.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="../../assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="../../assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>



<!-- /. NAV SIDE  -->
<div style="height:200px;width: 1200px;margin-top:23px ;margin-left:40px ">

    <div class="row text-center pad-row">

        <div class="col-md-3">
            <div class="panel normal-table panel-danger adjust-border-radius">
                <div class="panel-heading adjust-border">
                    <h4>重要通知</h4>
                </div>
                <div class="panel-body">

                      <form id="zhong">
                    标题<br/><input name="metitle"><input name="mestate" value="1"><br/>
                    正文<br/>
                         <textarea rows="10" cols="25" name="metext">
						 </textarea><br/>
                    开始时间 <input type="date" name="begintime"><br/>
                    结束时间 <input type="date" name="endtime">
                      </form>
                </div>
                <div class="panel-footer">
                    <a href="javascript:;" onclick="send(1)" class="btn btn-danger btn-block btn-lg adjust-border-radius">发送重要</a>
                </div>




            </div>
        </div>
        <div class="col-md-3">
            <div class="panel normal-table panel-primary adjust-border-radius">
                <div class="panel-heading adjust-border">
                    <h4>一般通知</h4>
                </div>
                <div class="panel-body">
                    <form id="yiban">
                        标题<br/><input name="metitle"><input name="mestate" value="2"><br/>
                        正文<br/>
                        <textarea rows="10" cols="25" name="metext">
						 </textarea><br/>
                        开始时间 <input type="date" name="begintime"><br/>
                        结束时间 <input type="date" name="endtime">
                    </form>

                </div>
                <div class="panel-footer">
                    <a href="javascript:;" onclick="send(2)" class="btn btn-primary btn-block btn-lg adjust-border-radius">发送一般</a>
                </div>
            </div>
        </div>
        <script>
            function send(obj){
                alert(obj)
                var ssa;
                if(obj==1){
                    ssa=$("#zhong").serialize();
                }else if(obj==2){
                    ssa=$("#yiban").serialize();
                }

                $.ajax({
                    url:'sendmessage/zhong',
                    type:'post',
                    data:ssa,
                    dataType:'text',
                    success:function (data) {
                        alert(data)
                    }
                })

            }
        </script>

        <div class="col-md-3">
            <div class="panel normal-table panel-success adjust-border-radius">
                <div class="panel-heading adjust-border">
                    <h4>部门通知</h4>
                </div>
                <div class="panel-body">

                    标题<br/><input><br/>
                    正文<br/>
                    <textarea rows="10" cols="25">
						 </textarea><br/>
                    开始时间 <input type="date"><br/>
                    结束时间 <input type="date">


                </div>
                <div class="panel-footer">
                    <a href="#" class="btn btn-success btn-block btn-lg adjust-border-radius">发送</a>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- /. PAGE INNER  -->

<!-- /. PAGE WRAPPER  -->


<!-- /. FOOTER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="../../assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="../../assets/js/bootstrap.js"></script>
<!-- METISMENU SCRIPTS -->

<!-- CUSTOM SCRIPTS -->
<script src="../../assets/js/custom.js"></script>


</body>
</html>

