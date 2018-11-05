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
                    <h4>公司通知</h4>
                </div>
                <div class="panel-body">

                      <form id="zhong">
                    标题<br/><input name="metitle"><input name="mestate" value="1"><br/>
                    正文<br/>
                         <textarea rows="10" cols="25" name="metext">
						 </textarea><br/>
                    开始时间 <input type="date" name="begintime" id="begintime1"><br/>
                    结束时间 <input type="date" name="endtime" id="endtime1">
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
                    <h4>部门通知</h4>
                </div>
                <div class="panel-body">
                    <form id="yiban">
                        标题<br/><input name="metitle"><input name="mestate" value="2"><br/>
                        正文<br/>
                        <textarea rows="10" cols="25" name="metext">
						 </textarea><br/>
                        开始时间 <input type="date" name="begintime" id="begintime2"><br/>
                        结束时间 <input type="date" name="endtime" id="endtime2">
                    </form>

                </div>
                <div class="panel-footer">
                    <a href="javascript:;" onclick="send(2)" class="btn btn-primary btn-block btn-lg adjust-border-radius">发送一般</a>
                </div>
            </div>
        </div>
        <script>
            function send(obj){

                function toDate(str){
                    var sd=str.split("-");
                    return new Date(sd[0],sd[1],sd[2]);
                }
                var d1=toDate($("#begintime"+obj).val());
                var d2=toDate($("#endtime"+obj).val());

                if($("#begintime"+obj).val()==""){
                    alert("开始时间不能为空");
                    return false;
                }
                if($("#endtime"+obj).val()==""){
                    alert("结束时间不能为空");
                    return false;
                }

                var d3 =toDate(getNowFormatDate());
                function getNowFormatDate() {
                    var date = new Date();
                    var seperator1 = "-";
                    var year = date.getFullYear();
                    var month = date.getMonth() + 1;
                    var strDate = date.getDate();
                    if (month >= 1 && month <= 9) {
                        month = "0" + month;
                    }
                    if (strDate >= 0 && strDate <= 9) {
                        strDate = "0" + strDate;
                    }
                    var currentdate = year + seperator1 + month + seperator1 + strDate;
                    return currentdate;
                }


                if (d1<d3){
                    alert("开始日期不可以小于当前日期");
                }else{

                    if(d2<d1){

                        alert("输入有误开始日期不可以大于或者等于结束日期")
                    }else{

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
                }








            }
        </script>



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

