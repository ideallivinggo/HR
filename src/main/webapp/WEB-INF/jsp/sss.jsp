<%--
  Created by IntelliJ IDEA.
  User: 31830
  Date: 2018-10-12
  Time: 1:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <!-- Custom styles for this template -->
    <link href="../../assets/css/style.css" rel="stylesheet">
    <link href="../../assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<section id="container" >
    <!-- **********************************************************************************************************************************************************
    TOP BAR CONTENT & NOTIFICATIONS
    *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
        </div>
        <!--logo start-->
        <a href="index.html" class="logo"><b>DASHGUM FREE</b></a>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu">
            <!--  notification start -->
            <ul class="nav top-menu">
                <!-- settings start -->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <i class="fa fa-tasks"></i>
                        <span class="badge bg-theme">4</span>
                    </a>
                    <ul class="dropdown-menu extended tasks-bar">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">You have 4 pending tasks</p>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">DashGum Admin Panel</div>
                                    <div class="percent">40%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">40% Complete (success)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">Database Update</div>
                                    <div class="percent">60%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">Product Development</div>
                                    <div class="percent">80%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        <span class="sr-only">80% Complete</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <div class="task-info">
                                    <div class="desc">Payments Sent</div>
                                    <div class="percent">70%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                                        <span class="sr-only">70% Complete (Important)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="external">
                            <a href="#">See All Tasks</a>
                        </li>
                    </ul>
                </li>
                <!-- settings end -->
                <!-- inbox dropdown start-->
                <li id="header_inbox_bar" class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-theme">5</span>
                    </a>
                    <ul class="dropdown-menu extended inbox">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">You have 5 new messages</p>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="../../assets/img/ui-zac.jpg"></span>
                                <span class="subject">
                                    <span class="from">Zac Snider</span>
                                    <span class="time">Just now</span>
                                    </span>
                                <span class="message">
                                        Hi mate, how is everything?
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="../../assets/img/ui-divya.jpg"></span>
                                <span class="subject">
                                    <span class="from">Divya Manian</span>
                                    <span class="time">40 mins.</span>
                                    </span>
                                <span class="message">
                                     Hi, I need your help with this.
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="../../assets/img/ui-danro.jpg"></span>
                                <span class="subject">
                                    <span class="from">Dan Rogers</span>
                                    <span class="time">2 hrs.</span>
                                    </span>
                                <span class="message">
                                        Love your new Dashboard.
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">
                                <span class="photo"><img alt="avatar" src="../../assets/img/ui-sherman.jpg"></span>
                                <span class="subject">
                                    <span class="from">Dj Sherman</span>
                                    <span class="time">4 hrs.</span>
                                    </span>
                                <span class="message">
                                        Please, answer asap.
                                    </span>
                            </a>
                        </li>
                        <li>
                            <a href="index.html#">See all messages</a>
                        </li>
                    </ul>
                </li>
                <!-- inbox dropdown end -->
            </ul>
            <!--  notification end -->
        </div>
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="login.html">Logout</a></li>
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

                <p class="centered"><a href="profile.html"><img src="../../assets/img/ui-sam.jpg" class="img-circle" width="60"></a></p>
                <h5 class="centered">员工</h5>

                <li class="mt">
                    <a href="index.html">
                        <i class="fa fa-dashboard"></i>
                        <span>全开面板</span>
                    </a>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-desktop"></i>
                        <span>员工管理</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="general.html">员工花名册</a></li>
                        <li><a  href="buttons.html">入职管理</a></li>
                        <li><a  href="panels.html">转正管理</a></li>
                        <li><a  href="general.html">合同记录</a></li>
                        <li><a  href="buttons.html">员工通讯录</a></li>
                    </ul>
                </li>

                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-cogs"></i>
                        <span>考勤管理</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="calendar.html">考勤月报</a></li>

                    </ul>
                </li>
                <li class="sub-menu">
                    <a class="active" href="javascript:;" >
                        <i class="fa fa-book"></i>
                        <span>薪资福利</span>
                    </a>
                    <ul class="sub">
                        <li ><a  href="blank.html">薪资台账</a></li>
                        <li class="active"><a  href="login.html">个税报表</a></li>
                        <li><a  href="lock_screen.html">员工薪资</a></li>
                        <li><a  href="lock_screen.html">薪资历史</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-tasks"></i>
                        <span>绩效考核</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="form_component.html">考核模板</a></li>
                        <li><a  href="form_component.html">考核列表</a></li>
                        <li><a  href="form_component.html">考核记录</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class="fa fa-th"></i>
                        <span>导航六</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="basic_table.html">六一</a></li>
                        <li><a  href="responsive_table.html">六二</a></li>
                    </ul>
                </li>
                <li class="sub-menu">
                    <a href="javascript:;" >
                        <i class=" fa fa-bar-chart-o"></i>
                        <span>导航七</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="javascript:;" onclick="qiyi()">七一</a></li>
                        <li><a  href="javascript:;">七二</a></li>
                    </ul>
                </li>

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

            <div class="row mt" >
            <div class="col-lg-12" style="margin-top:-25px;margin-left:-16px">
                <iframe src="me" height="660px" width="1320px" id="ifra">
                    <p>Your browser does not support iframes.</p>
                </iframe>
            </div>
        </div>

        </section><! --/wrapper -->
    </section><!-- /MAIN CONTENT -->

    <!--main content end-->
    <!--footer start-->
   <%-- <footer class="site-footer">

        <div class="text-center">
            2014 - Alvarez.is - More Templates <a href="#" target="_blank" title="睿智HR">睿智HR</a> - Collect from <a href="http://www.cssmoban.com/" title="睿智HR" target="_blank">睿智HR</a>
            <a href="blank.html#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>--%>
    <!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="../../assets/js/jquery.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script src="../../assets/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="../../assets/js/jquery.ui.touch-punch.min.js"></script>
<script class="include" type="text/javascript" src="../../assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="../../assets/js/jquery.scrollTo.min.js"></script>
<script src="../../assets/js/jquery.nicescroll.js" type="text/javascript"></script>


<!--common script for all pages-->
<script src="../../assets/js/common-scripts.js"></script>

<!--script for this page-->

<script>
    //custom select box

    $(function(){

        $('select.styled').customSelect();


    });


    function  qiyi() {
         alert("aaa");
        $("#ifra").attr("src","you");
    }

</script>

</body>
</html>

