<%--
  Created by IntelliJ IDEA.
  User: 31830
  Date: 2018-10-12
  Time: 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>睿智HR管理系统</title>
    <!-- Bootstrap core CSS -->
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="../../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-----------消息----------->
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <!--CUSTOM BASIC STYLES-->
    <link href="../../assets/css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="../../assets/css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <!-- Custom styles for this template -->
    <link href="../../assets/css/style.css" rel="stylesheet">
    <link href="../../assets/css/style-responsive.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../assets/js/gritter/css/jquery.gritter.css" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>
<style>
</style>
<body>

<section id="container" >
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg" style="background-color: #424A5D ">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a  class="logo"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;·睿智管理·</b></a>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu">
            <!--  notification start -->
            <ul class="nav top-menu">
                <!-- settings start -->

                <!-- settings end -->
                <!-- inbox dropdown start-->
                <li id="header_inbox_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" >
                        <i class="fa fa-envelope-o"></i>
                     <%--   <span class="badge bg-theme"></span>--%>
                    </a>
                    <ul class="dropdown-menu extended inbox" id="showfriend">
                        <div class="notify-arrow notify-arrow-green"></div>





                        <li>

                                <button type="button" class="btn btn-primary btn-lg"
                                        style="font-size:12px;background-color:#68DFF0;width: 236px" onclick="createtoemp()">
                                <span class="glyphicon glyphicon-plus-sign" style="font-size:14px">创建聊天</span>
                                </button>


                        </li>
                    </ul>
                </li>
                <!-- inbox dropdown end -->
            </ul>
            <!--  notification end -->
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="logout">退 出</a></li>
            </ul>
        </div>
    </header>
    <!--header end-->

    <!-- **********************************************************************************************************************************************************
    MAIN SIDEBAR MENU
    *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">

                <p class="centered"><a href="javascript:;" onclick="skipjsp('/L_shouye')">
                    <img src="../../assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
                <h5 class="centered">${emp.empnumber}</h5>




                <c:forEach items="${treevo}" var="list">
       <li class="sub-menu">
  <a href="javascript:;" >  <i class="fa fa-desktop"></i>  <span>${list.name}</span> </a>

           <style>
               .dian{
                   width: 190px;
                   height: 40px;
                   margin-left: -32px;
                   text-align: left;
                   padding-left: 40px;
                   line-height: 40px;
                   color: #FFFFFF;
                   border: 0px solid #000000;
                   background-color: #424A5D;
               }
               .dian:focus{
                   color: #68DFF0;
               }
           </style>

     <ul class="sub">
         <c:forEach items="${list.permissionList}" var="plist">
             <li><button class="dian" onclick="skipjsp('${plist.url}')">${plist.name}</button></li>
         </c:forEach>
     </ul>
  </li>
                </c:forEach>

            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->

    <!-- **********************************************************************************************************************************************************
    MAIN CONTENT
    *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
            <div style="display: none"  id="zcmessage">暂存message</div>

            <div class="row mt" >
            <div class="col-lg-12" style="margin-top:-25px;margin-left:-16px">
                <iframe src="me" height="660px" width="1320px" id="ifra">
                    <p>Your browser does not support iframes.</p>
                </iframe>
            </div>



<%--//------------------------------------------------聊天模态窗------------------------------------------%>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="height:600px;" aria-hidden="true">
                        <div class="modal-content">

                            <div class="modal-body">

                                <!--聊天消息------>
                                        <div class="panel panel-success" style="height:600px; ">
                                            <div class="panel-heading">
                                                <span id="toemp"></span>
                                                <span id="uuid" style="display: none"></span>
                                                <button type="button"  class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            </div>
                                            <div class="panel-body" style="padding:0px;">
                                                <div class="chat-widget-main" id="messagetext">
                                                    <center> <h4>暂无聊天记录</h4></center>

                                                </div>
                                            </div>
                                            <div class="panel-footer" style="position: absolute;top:550px;width:566px">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" style="word-wrap:break-word" placeholder="消息" id="messagetextt"/>
                                                    <span class="input-group-btn">
                                               <button class="btn btn-success" onclick="sendmessage()" type="button">发送</button>
                                            </span>
                                                </div>
                                            </div>
                                        </div>

                                <!--聊天消息------>

                            </div>

                        </div>
                    </div>
                </div>
<%--------------------------------------------------end模态------------------------------------------%>
<%--------------------------------------------------显示所有好友模态------------------------------------------%>
                <div class="modal fade" id="showemp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content" style="width: 300px;border-radius:25px;">
                            <div class="modal-header" style="width: 300px;border-radius:25px;">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel"style="text-align:center">选择在线员工聊天</h4>
                            </div>
                             <div class="modal-header" style="width: 300px;height:55px;border-radius:25px;
                            position:absolute;left:300px;top:0px;   ">
                                <h4 class="modal-title" style="text-align:center"><input style="color:#0C0C0C" id="empnamei">&nbsp;&nbsp;
                                    <span onclick="b_query()">查找</span></h4>
                            </div>

                            <div class="col-lg-3 ds" id="yuangong" style="height:500px;width:400px;overflow-y:auto;border:1px solid ;border-radius:25px;
                            position: absolute;left:300px;top:55px; ">
                                <%--<div class="desc" style="background:#FFD777;height:70px;border-radius:25px;" onclick="openmessage(2)">
                                    <div class="thumb">
                                        <img class="img-circle" src="assets/img/ui-sherman.jpg" width="35px" height="35px" align="">
                                    </div>
                                    <div class="details" >
                                        <p > <span style="color:#B26A8F;font-size:15px;margin-left:10px; ">张三一</span><br/>
                                            <muted>在线</muted>
                                        </p>
                                    </div>
                                </div>--%>


                            </div>


                            <div class="col-lg-3 ds" id="bumen" style="height:500px;width:300px;overflow-y:auto;border:1px solid ;border-radius:25px;">
                                    <!-- USERS ONLINE SECTION -->
                               <%-- <div class="desc" style="background:#FFD777;height:70px;border-radius:25px;" onclick="openmessage(2)">
                                    <div class="thumb">
                                        <img class="img-circle" src="assets/img/ui-sherman.jpg" width="35px" height="35px" align="">
                                    </div>
                                    <div class="details" >
                                        <p > <span style="color:#B26A8F;font-size:15px;margin-left:10px; ">财务部门</span><br/>
                                            <muted>5人</muted>
                                        </p>
                                    </div>
                                </div>--%>

                                </div><!-- /col-lg-3 -->
                            <script>



                            </script>


                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
<%--------------------------------------------------end显示所有好友模态------------------------------------------%>

            </div>


        </div>

        </section><! --/wrapper -->
    </section><!-- /MAIN CONTENT -->


</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="../../assets/js/jquery.js"></script>
<script src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script src="../../assets/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="../../assets/js/jquery.ui.touch-punch.min.js"></script>
<script class="include" type="text/javascript" src="../../assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="../../assets/js/jquery.scrollTo.min.js"></script>
<script src="../../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
<script type="text/javascript" src="assets/js/gritter-conf.js"></script>

<!--common script for all pages-->
<script src="../../assets/js/common-scripts.js"></script>

<!--script for this page-->

<script>
     var emp;



    function  skipjsp(obj) {
        $("#ifra").attr("src",obj);
    }
   var motaistate=1;




    $(document).ready(function () {
         $('<audio id="chatAudio"> <source src="../../assets/map3/iphoneqq.mp3" type="audio/mpeg"></audio>').appendTo('body');

         $.ajax({
              url:'sendmessage/betweendatezhong',
              type:'post',
              dataType:'json',
              success:function (data) {
                     for(var  i=0;i<data.length;i++){
                         $.gritter.add({
                             title: data[i].metitle+"&nbsp;&nbsp;--来自公司通告",
                             text:data[i].metext ,
                             sticky: true,
                             time: '',
                             class_name: 'my-sticky-class'
                         });
                     }
              }
         });
        $.ajax({
            url:'sendmessage/betweendateyiban',
            type:'post',
            dataType:'json',
            success:function (data) {
                for(var  i=0;i<data.length;i++){
                    $.gritter.add({
                        title: data[i].metitle+"&nbsp;&nbsp;--来自部门通告",
                        text:data[i].metext ,
                        sticky: true,
                        time: '',
                        class_name: 'my-sticky-class'
                    });
                }
            }
        });

//加载部门信息
        $.ajax({
            url: "QueryDeptYqx",
            type: "post",
            data: {},
            dataType: "json",
            success: function (data) {
                var div="";
                for (var i = 0; i < data.length; i++) {
                    var deptid=data[i].deptid;
                    var num=data[i].num;
                    if(deptid==null){
                        num=0;
                    }else {
                        num=data[i].num;
                    }
                    div+=" <div class='desc' style='background:#FFD777;height:70px;border-radius:25px;' onclick='showall("+deptid+")'   >" +
                        "                                    <div class='thumb'>\n" +
                        "                                        <img class='img-circle' src='assets/img/ui-sherman.jpg' width='35px' height='35px' align=''>\n" +
                        "                                    </div>\n" +
                        "                                    <div class='details' >\n" +
                        "                                        <p > <span style='color:#B26A8F;font-size:15px;margin-left:10px; '>"+data[i].deptname+"</span><br/>\n" +
                        "                                            <muted>"+num+"人</muted>\n" +
                        "                                        </p>\n" +
                        "                                    </div>\n" +
                        "                                </div>";

                }
                $("#bumen").html(div)
                //endsuccess
            }
        })
        //点击部门显示部门员工




        //加载全部
        $.ajax({
            url: "L_query_emp",
            type: "post",
            data: {},
            dataType: "json",
            success: function (data) {
                  var div="";
                for (var i = 0; i < data.length; i++) {
                  div+="<div class='desc' style='background:#FFD777;height:70px;border-radius:25px;' onclick='openmessage("+data[i].empid+")'  >\n" +
                      "                                    <div class='thumb'>\n" +
                      "                                        <img class='img-circle' src='assets/img/ui-sherman.jpg' width='35px' height='35px' align=''>\n" +
                      "                                    </div>\n" +
                      "                                    <div class='details' >\n" +
                      "                                        <p > <span style='color:#B26A8F;font-size:15px;margin-left:10px; '>"+data[i].empname+"</span><br/>\n" +
                      "                                            <muted>在线</muted>\n" +
                      "                                        </p>\n" +
                      "                                    </div>\n" +
                      "                                </div>";

                }
              $("#yuangong").html(div);
            }
        })




       });
    function showall(b) {
        $.ajax({
            url: "L_query_emp",
            type: "post",
            data: {deptid:b},
            dataType: "json",
            success: function (data) {
                var div="";
                for (var i = 0; i < data.length; i++) {
                    div+="<div class='desc' style='background:#FFD777;height:70px;border-radius:25px;' onclick='openmessage("+data[i].empid+")'  >\n" +
                        "                                    <div class='thumb'>\n" +
                        "                                        <img class='img-circle' src='assets/img/ui-sherman.jpg' width='35px' height='35px' align=''>\n" +
                        "                                    </div>\n" +
                        "                                    <div class='details' >\n" +
                        "                                        <p > <span style='color:#B26A8F;font-size:15px;margin-left:10px; '>"+data[i].empname+"</span><br/>\n" +
                        "                                            <muted>在线</muted>\n" +
                        "                                        </p>\n" +
                        "                                    </div>\n" +
                        "                                </div>";

                }
                $("#yuangong").html(div);
            }
        })

    };
    function b_query() {
        $.ajax({
            url: "L_query_emp_name",
            type: "post",
            data: {empname:$("#empnamei").val()},
            dataType: "json",
            success: function (data) {
                var div="";
                for (var i = 0; i < data.length; i++) {
                    div+="<div class='desc' style='background:#FFD777;height:70px;border-radius:25px;' onclick='openmessage("+data[i].empid+")'  >\n" +
                        "                                    <div class='thumb'>\n" +
                        "                                        <img class='img-circle' src='assets/img/ui-sherman.jpg' width='35px' height='35px' align=''>\n" +
                        "                                    </div>\n" +
                        "                                    <div class='details' >\n" +
                        "                                        <p > <span style='color:#B26A8F;font-size:15px;margin-left:10px; '>"+data[i].empname+"</span><br/>\n" +
                        "                                            <muted>在线</muted>\n" +
                        "                                        </p>\n" +
                        "                                    </div>\n" +
                        "                                </div>";

                }
                $("#yuangong").html(div);

            }
        })


    }


    var goEasy = new GoEasy({
        appkey: "BC-ce1dd32a157e46f892f1dc98a07ebaad",
        onConnected: function () {
         // alert("成功连接GoEasy。");
        },
        onDisconnected: function () {
            alert("与GoEasy连接断开。");
        },
        onConnectFailed: function (error) {
            alert("与GoEasy连接失败，错误编码："+error.code+"错误信息："+error.content);
        }
    });
    goEasy.subscribe({
        channel: "zhong",
        onMessage: function (message) {
            $.gritter.add({
                // (string | mandatory) the heading of the notification
                title:'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;'+ message.content.split("♈")[0]+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-----重要通知',
                // (string | mandatory) the text inside the notification
                text: message.content.split("♈")[1],
                // (string | optional) the image to display on the left

                // (bool | optional) if you want it to fade out on its own or just sit there
                sticky: true,
                // (int | optional) the time you want it to be alive for before fading out
                time: '',
                // (string | optional) the class name you want to apply to that specific message
                class_name: 'my-sticky-class'
            });

        },
        onSuccess: function () {
         //   alert("Channel订阅成功。");
        },
        onFailed: function (error) {
            alert("Channel订阅失败, 错误编码：" + error.code + " 错误信息：" + error.content)
        }
    });
    goEasy.subscribe({
        channel: "yiban"+${emp.deptid},
        onMessage: function (message) {
            $.gritter.add({
                // (string | mandatory) the heading of the notification
                title:'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;'+ message.content.split("♈")[0]+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-----部门通知',
                // (string | mandatory) the text inside the notification
                text: message.content.split("♈")[1],
                // (string | optional) the image to display on the left

                // (bool | optional) if you want it to fade out on its own or just sit there
                sticky: true,
                // (int | optional) the time you want it to be alive for before fading out
                time: '',
                // (string | optional) the class name you want to apply to that specific message
                class_name: 'my-sticky-class'
            });

        },
        onSuccess: function () {
           // alert("Channel订阅成功。");
        },
        onFailed: function (error) {
            alert("Channel订阅失败, 错误编码：" + error.code + " 错误信息：" + error.content)
        }
    });


    ///接收信息
    goEasy.subscribe({

        channel: "channe"+${emp.empid},
        onMessage: function (message) {
            $('#chatAudio')[0].play();
         var uid= message.content.split("♈")[0].toString();
         $.ajax({
                url:'queryEmpById',
                type:'post',
                data:{"empid":uid},
                dataType:'json',
             async: false,
                success:function (data) {
                    emp=data;
                }
            })


            function getNow(s) {
                return s < 10 ? '0' + s: s;
            }
            var myDate = new Date();
            var h=myDate.getHours();       //获取当前小时数(0-23)
            var m=myDate.getMinutes();    //获取当前分钟数(0-59)
  var messagehistory= "<div class='chat-widget-left' style='word-wrap:break-word'>"+ message.content.split("♈")[1]+"</div>" +
                "<div class='chat-widget-name-left' style='margin-left:0px '>" +
                "<h4>"+emp.empname+"&nbsp;&nbsp;&nbsp;&nbsp;"+getNow(h)+"时"+getNow(m)+"分</h4> </div>" ;

            var inputa="<input id='a"+uid+"' >";
            var messagespan5t=message.content.split("♈")[1];
             if(messagespan5t.length>10){
               var str5t=  messagespan5t.substring(0,10)+"。。。。。。";
             }else {
                 var str5t=messagespan5t;
             }

            var showfriendstr= "<li>"+
                "<a href='javascript:;' onclick='showmessage("+uid+")'> "+
            "  <span class='photo'><img alt='avatar' src='../../assets/img/ui-zac.jpg'></span>"+
            " <span class='subject'><span>"+emp.empname+"</span>"+
            "  <span class='from' style='display: none' id='"+uid+"'>"+uid+"</span>"+
            "  <span class='time' id='totime"+uid+"'>"+getNow(h)+"时"+getNow(m)+"分</span>"+
            "  </span> "+
            "  <span class='message' id='messagespan"+uid+"'>"+str5t+
            "   </span>"+
            "   </a>"+
            "   </li>";
            $.gritter.add({
                // (string | mandatory) the heading of the notification
                title: emp.empname+'   发来的消息!',
                // (string | mandatory) the text inside the notification
    text:message.content.split("♈")[1]+ "<br/>&nbsp;<a href='javascript:;' onclick='showmessage("+uid+")' style='color:#FFD777'>立即查看</a>.",
                // (string | optional) the image to display on the left
                image: 'assets/img/ui-sam.jpg',
                // (bool | optional) if you want it to fade out on its own or just sit there
                sticky: false,
                // (int | optional) the time you want it to be alive for before fading out
                time: ''
            });

  if($("#"+uid).html()!=uid){
      $("#showfriend").append(showfriendstr);
      $("#zcmessage").append(inputa);
      $("#a"+uid).val(messagehistory);

  }else{
      $("#totime"+uid).html(getNow(h)+"时"+getNow(m)+"分");
      var shangmessagestr= $("#a"+uid).val();

      if(messagespan5t.length>10){
          var str5t=  messagespan5t.substring(0,10)+"。。。。。。";
          $("#messagespan"+uid).html(str5t);
      }else {
          //var str5t=messagespan5t;
          $("#messagespan"+uid).html(str5t);
      }
      //var ss=shangmessagestr+messagehistory;
      $("#a"+uid).val(shangmessagestr+messagehistory);
        if(motaistate==1){
          //  alert("模态未打开")
        }else{
           // alert("已经打开");
            var messagetexta= $("#a"+uid).val();
            $("#messagetext").html(messagetexta);
        }

  }
          //  alert("您有新消息渠道是：" + message.channel + " 消息内容：" + message.content);
        },
        onSuccess: function () {
         // alert("渠道订阅成功。");
        },
        onFailed: function (error) {
            alert("渠道订阅失败, 错误编码：" + error.code + " 错误信息：" + error.content)
        }
    });




    function showmessage(obj) {
        $.ajax({
            url:'queryEmpById',
            type:'post',
            data:{"empid":obj},
            dataType:'json',
            async: false,
            success:function (data) {
                emp=data;
            }
        })
       /// alert("showmessage");
          $("#toemp").html(emp.empname);//设置与谁谁聊天
          $("#uuid").html(obj);//设置uid
         ///alert(obj+"实时")
       var messagetexta= $("#a"+obj).val();

        $('#myModal').modal({backdrop: 'static', keyboard: false});
        $('#myModal').modal('show');
        $("#messagetext").html("  <center> <h4>暂无聊天记录</h4></center>");
        $("#messagetext").html(messagetexta);
        motaistate="2";
    }
    $('#myModal').on('hidden.bs.modal', function () {
        // 执行一些动作...
        motaistate=1;
    })

 function createtoemp() {
     $('#showemp').modal({backdrop: 'static', keyboard: false});
     $('#showemp').modal('show');
 }

 function openmessage(obj) {

     $('#showemp').modal('hide');
     showmessage(obj);
 }
    
    function sendmessage() {
         if($("#messagetextt").val()==""){
              alert("必须输入消息");
         }else{
          var uidd=$("#uuid").html();
             $.ajax({
                 url:'queryEmpById',
                 type:'post',
                 data:{"empid":uidd},
                 dataType:'json',
                 async: false,
                 success:function (data) {
                     emp=data;
                 }
             })

             var messagetextcc= $("#a"+uidd).val();
              if(messagetextcc==undefined){
                  function getNow(s) {
                      return s < 10 ? '0' + s: s;
                  }
                  var myDate = new Date();
                  var h=myDate.getHours();       //获取当前小时数(0-23)
                  var m=myDate.getMinutes();    //获取当前分钟数(0-59)
                  var showfriendstr= "<li>"+
                      "<a href='javascript:;' onclick='showmessage("+uidd+")'> "+
                      "  <span class='photo'><img alt='avatar' src='../../assets/img/ui-zac.jpg'></span>"+
                      " <span class='subject'><span>"+emp.empname+"</span>"+
                      "  <span class='from' style='display: none' id='"+uidd+"'>"+uidd+"</span>"+
                      "  <span class='time' id='totime"+uidd+"'>"+getNow(h)+"时"+getNow(m)+"分</span>"+
                      "  </span> "+
                      "  <span class='message' id='messagespan"+uidd+"'>"+$("#messagetextt").val()+
                      "   </span>"+
                      "   </a>"+
                      "   </li>";
                  var inputaa="<input id='a"+uidd+"' >";
                  $("#showfriend").append(showfriendstr);
                  $("#zcmessage").append(inputaa);


              }
             goEasy.publish({
            channel: "channe"+uidd,
            message: ${emp.empid}+"♈"+$("#messagetextt").val(),
            onSuccess:function(){
                function getNow(s) {
                    return s < 10 ? '0' + s: s;
                }
                var myDate = new Date();
                var h=myDate.getHours();       //获取当前小时数(0-23)
                var m=myDate.getMinutes();
                $("#totime"+uidd).html(getNow(h)+"时"+getNow(m)+"分");
                // alert("消息发布成功。");
                var shangmessagestr= $("#a"+uidd).val();
                var newsendmessagetext=  "<div class='chat-widget-right' style='word-wrap:break-word'>  "+$("#messagetextt").val()+"</div>"+
                              "<div class='chat-widget-name-right' style='margin-right:40px'><h4>"+'${emp.empname}'+"&nbsp;&nbsp;&nbsp;"+getNow(h)+"时"+getNow(m)+"分</h4> </div>";
                $("#a"+uidd).val(shangmessagestr+newsendmessagetext);
                var messagetextb= $("#a"+uidd).val();
                $("#messagetext").html(messagetextb);
                $("#messagespan"+uidd).html($("#messagetextt").val());
                $("#messagetextt").val("");


            },
            onFailed: function (error) {
                alert("消息发送失败，错误编码："+error.code+" 错误信息："+error.content);
            }
        });}
    }


</script>

</body>

</html>

