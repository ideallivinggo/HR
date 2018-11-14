<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/6
  Time: 22:07
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

    <title>DASHGUM - Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="../../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="../../assets/css/style.css" rel="stylesheet">
    <link href="../../assets/css/style-responsive.css" rel="stylesheet">

    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../../assets/css/select2.css" />
    <link rel="stylesheet" href="../../assets/css/ace.min.css" />
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    #fy {
        height: 40px;
        margin-left: 20px;
        margin-top: -10px

    }
    .fy1 {
        width: 35px;
        height: 30px;
        text-align: center;
        cursor: pointer;
        float: left;
        line-height: 30px;
        border-radius:5px;
        margin-left: 10px;

    }
    .fy2 {
        width: 100px;
        height: 30px;
        text-align: center;
        float: left;
        line-height: 30px;
        border-radius:5px;
        letter-spacing: 5px;
    }
</style>
<body>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
     >
    <div class="modal-dialog" style="width:1000px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">新建培训课程</h4>
            </div>
            <div class="modal-body">

                <div class="row-fluid" >
                    <div class="span12">
                        <div class="widget-box">

                            <div class="widget-body">
                                <div class="widget-main">
                                    <div id="fuelux-wizard" class="row-fluid" data-target="#step-container">
                                        <ul class="wizard-steps">
                                            <li data-target="#step1" class="active">
                                                <span class="step">1</span>
                                                <span class="title">设置课程信息</span>
                                            </li>

                                            <li data-target="#step2">
                                                <span class="step">2</span>
                                                <span class="title">课程主要内容</span>
                                            </li>

                                            <li data-target="#step3">
                                                <span class="step">3</span>
                                                <span class="title">设置授课人员</span>
                                            </li>

                                            <li data-target="#step4">
                                                <span class="step">4</span>
                                                <span class="title">时间/地点安排</span>
                                            </li>
                                        </ul>
                                    </div>

                                    <hr />
                                    <div class="step-content row-fluid position-relative" id="step-container">
                                        <form class="form-horizontal" id="sample-form">
                                        <div class="step-pane active" id="step1">



                                                <div class="form-group has-warning">
                                                    <label for="inputWarning" class="col-xs-12 col-sm-3 control-label no-padding-right">课程名称</label>

                                                    <div class="col-xs-12 col-sm-5">
																		<span class="block input-icon input-icon-right">
																			<input type="text" id="inputWarning" class="width-100" name="kename" />

																		</span>
                                                    </div>

                                                </div>
                                                <div class="form-group has-warning">
                                                    <label for="inputWarninga" class="col-xs-12 col-sm-3 control-label no-padding-right">课程描述</label>

                                                    <div class="col-xs-12 col-sm-5">
																		<span class="block input-icon input-icon-right">
																			<input type="text" id="inputWarninga" class="width-100" name="kemiaoshu" />

																		</span>
                                                    </div>

                                                </div>









                                        </div>

                                        <div class="step-pane" id="step2">
                                              <center><h5>课程详细</h5></center>
                                        <textarea rows="13" cols="130" name="kexiangqing">

                                        </textarea>

                                            </div>


                                        <div class="step-pane" id="step3">
                                            <div class="tabbable tabs-left" style="border: 0px solid royalblue;width:900px ">
                                                <ul class="nav nav-tabs" id="myTab3">
                                                    <li class="active">
                                                        <a data-toggle="tab" href="#aa">
                                                            <i class="blue icon-user bigger-110"></i>
                                                            培训部门
                                                        </a>
                                                    </li>
                                                    <%-- <li>
                                                        <a data-toggle="tab" href="#profile3">
                                                            <i class="blue icon-user bigger-110"></i>
                                                            开发部门
                                                        </a>
                                                     </li>--%>



                                                </ul>

                                                <div class="tab-content" id="shwodeptemp" style="border: 1px solid #429ac6;height:300px ">
                                                    <div id="aa" class="tab-pane in active">

                                                        <span style="margin-left:350px; " ></span>
                                                           姓名：
                                                            <input id="empname" style="width:50px ">&nbsp;&nbsp;&nbsp;

                                                            工号：
                                                            <input  id="empnumber" style="width:100px ">&nbsp;&nbsp;&nbsp;
                                                            <button type="button" style="width:80px;height:28px;line-height:10px"
                                                                    class="btn btn-success" onclick="showEmpByEmp()">查询</button>
                                                        <div>
                                                            <table class="table table-hover">

                                                                <thead>
                                                                <tr>
                                                                    <th>选择</th>
                                                                    <th>员工工号</th>
                                                                    <th>员工姓名</th>
                                                                    <th>课程安排</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody id="emptr">


                                                                </tbody>
                                                            </table>

                                                        </div>


                                                    </div>

                                                    <%-- <div id="a2" class="tab-pane">
                                                        <p>222coffee squid.</p>
                                                        <p>222of them jean shorts Austin.</p>
                                                    </div>--%>




                                                </div>
                                            </div>
                                        </div>

                                        <div class="step-pane" id="step4">

                                            <div class="layui-form">

                                                     <div class="layui-inline">
                                                     课程报名时间
                                                        <div class="layui-input-inline">
                                                            <input type="text" class="layui-input" id="test6" placeholder=" - " name="kebaomingtimebegin">
                                                        </div>
                                                       培训时间
                                                        <div class="layui-input-inline">
                                                            <input type="text" class="layui-input" id="test7" placeholder=" - " name="kebegintime">
                                                        </div>
                                                    </div>
                                            </div><br/>
                                            上课地点:<input type="text" name="keaddress"><br/><br/>
                                             最大人数:<input type="text" name="kechengmaxren"><br/><br/>
                                            上课老师: &nbsp;&nbsp;<span id="showteacher"></span>
                                              <input name="kebaomingtimeend" style="display: none" id="empidaa">

                                        </div>
                                        </form>
                                    </div>
                                    <script>
                                        layui.use('laydate', function() {
                                            var laydate = layui.laydate;
                                            //日期范围
                                            laydate.render({
                                                elem: '#test6'
                                                , range: true
                                            });
                                            laydate.render({
                                                elem: '#test7'
                                                , range: true
                                            });

                                        })
                                        </script>

                                        <hr />
                                    <div class="row-fluid wizard-actions">
                                        <button class="btn btn-prev">
                                            <i class="icon-arrow-left"></i>
                                            上一步</button>

                                        <button class="btn btn-success btn-next" data-last="提交 ">
                                            下一布
                                            <i class="icon-arrow-right icon-on-right"></i>
                                        </button>
                                    </div>
                                </div><!-- /widget-main -->
                            </div><!-- /widget-body -->
                        </div>
                    </div>
                </div>


            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<section id="container" style="margin-top: -50px;" >

    <section class="wrapper">
        <div class="panel panel-default" style="margin:1%">
            <!-- 多条件查询  -->
            <div class="panel-heading" style="height: 60px">
                <div class="layui-form" >
                    <div class="layui-form-item">
                        <div class="layui-inline" style="margin: 0px">
                            <select id="kestate">
                                <option value="1">待审批</option>
                                <option value="2">已通过</option>
                                <option value="3">未通过</option>
                            </select>
                        </div>
                        <div class="layui-inline" style="margin: 0px" >
                            <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="queryAllkecJSR(1)"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                        <div class="layui-inline" style="float: right" >
                            <button class="layui-btn" data-toggle="modal"  data-target="#myModal">创建课程</button>
                        </div>


                    </div>
                </div>
            </div>
            <!--table表格-->
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>课程名称</th>
                            <th>课程开始/结束时间</th>
                            <th>报名开始/结束时间</th>
                            <th>课程最大人数</th>
                            <th>开课地点</th>
                            <th>开课老师</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="mytab">
                        <!--数据-->
                        </tbody>
                    </table>
                </div>
            </div>
            <!--分页-->
            <div id="fy">
                <div id="prepage" class="fy1"><i class="layui-icon">&#xe603;</i></div><!--上一页-->
                <div class="fy1" style="background-color: #009688; color: #FFFFFF"><span id="nowPage"></span></div><!--第几页-->
                <div id="nextpage" class="fy1"><i class="layui-icon">&#xe602;</i></div><!--下一页-->
                <div class="fy2">共<span id="total"></span>条</div><!--条数-->
                <div class="fy2">共<span id="pages"></span>页</div><!--页数-->
            </div>
        </div>

        <!-- 模态详情（Modal） -->
        <div class="modal fade" id="myModal2" >
            <div class="modal-dialog"  style="width: 700px;margin-bottom: 80px" >
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                            课程详情
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="layui-form" >
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">课程名称</label>
                                    <div class="layui-input-block" style="width: 525px">
                                        <input id="kename"  class="layui-input" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">课程描述</label>
                                    <div class="layui-input-block" style="width: 525px">
                                        <textarea id="kemiaoshu" class="layui-textarea" disabled> </textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">课程详情</label>
                                    <div class="layui-input-block" style="width: 525px">
                                        <textarea id="kexiangqing" class="layui-textarea" disabled> </textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">课程时间</label>
                                    <div class="layui-input-block" style="width: 200px">
                                        <input id="kebegintime" class="layui-input" disabled>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label" style="width: 60px">→</label>
                                    <div class="layui-input-block" style="width: 200px">
                                        <input id="keendtime" class="layui-input" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">报名时间</label>
                                    <div class="layui-input-block" style="width: 200px">
                                        <input id="kebaomingtimebegin" class="layui-input" disabled>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label" style="width: 60px">→</label>
                                    <div class="layui-input-block" style="width: 200px">
                                        <input id="kebaomingtimeend" class="layui-input" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                    <label class="layui-form-label">开课地点</label>
                                    <div class="layui-input-block" style="width: 525px">
                                        <input id="keaddress" class="layui-input" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item" style="display: none">
                                <div class="layui-inline" >
                                    <label class="layui-form-label">课id</label>
                                    <div class="layui-input-block" style="width: 200px">
                                        <input id="keid" class="layui-input">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>




    </section>

    <!--main content end-->
    <!--footer start-->

    <!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
<script src="../../assets/js/jquery.js"></script>
<script src="../../assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="../../assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="../../assets/js/jquery.scrollTo.min.js"></script>
<script src="../../assets/js/jquery.nicescroll.js" type="text/javascript"></script>


<!--common script for all pages-->
<script src="../../assets/js/common-scripts.js"></script>

<script src="../../assets/js/aa.js"></script>

<script src="../../assets/js/fuelux/fuelux.wizard.min.js"></script>
<script src="../../assets/js/bootbox.min.js"></script>
<script src="../../assets/js/ace-elements.min.js"></script>
<!--script for this page-->

<script type="text/javascript">
    jQuery(function($) {
        var $validation = false;
        $('#fuelux-wizard').ace_wizard().on('change' , function(e, info){
            if(info.step == 1 && $validation) {
                if(!$('#validation-form').valid()) return false;
            }
        }).on('finished', function(e) {
                  //alert($("#test6").val());
          //  alert("之前");
            if(empid==""){
             alert("请选择培训教师");
             return false;
            }
            if($("#test6").val()==""){
                alert("请选择报名日期");
                return false;
            }
            if($("#test7").val()==""){
                alert("请选择培训日期");
                return false;
            }
             var aaa=$("#sample-form").serialize();
           //  alert(aaa);
                $.ajax({
                url: "/peixun/addkecheng",
                type: "post",
                 data:aaa,
                dataType: "text",
                success:function (data) {
                    window.location.href="/J200";
                }
                })

        });
        showEmpByEmp();




    })

    /*$(function(){
            $.ajax({
                url: "L_query_emp",
                type: "post",
                data: {deptid:"1"},
                dataType: "json",
                success: function (data) {

                    for (var i = 0; i < data.length; i++) {

                    }
                }
            });
    })*/
    
    
    function  showEmpByEmp() {
        $.ajax({
            url: "/peixun/queryEmpByEmp",
            type: "post",
            data:{
                empnumber:$("#empnumber").val(),
                empname:$("#empname").val()
            },
            dataType: "json",
            success: function (data) {

                $("#emptr").html("");
                for (var i = 0; i < data.length; i++) {
                    var tr="<tr>" +
                        "<td><input type='checkbox' class='empid' value='"+data[i].empid+"' onclick='getemp()'></td>" +
                        "<td>"+data[i].empnumber+"</td>"+
                        "<td>"+data[i].empname+"</td>"+
                        "<td><button type='button' onclick='getKecheng("+data[i].empid+")' class='btn btn-info' style='width:80px;height:28px;line-height:10px'>查看</button></td>" +
                        "</tr>";
                    $("#emptr").append(tr);
                }
            }
        });
    }
    var empid="";
    var  empname;
       function  getemp() {
           empid="";
           empname="";


           $(".empid").each(function () {
               if($(this).prop("checked")==true){
                   empid+=$(this).val()+",";
                       empname+=$(this).parent().next().next().html()+",&nbsp;&nbsp;";
               }
           });
          /* alert(empid);
           alert(empname)*/
          $("#showteacher").html(empname);
          $("#empidaa").val(empid);
       }

       function getKecheng(obj) {
            $.ajax({
               url:'peixun/getKechengbyEmpid',
               type:'post',
                data:{empid:obj},
               dataType:'json',
                success:function (data) {
                     var showke="";
                     for(var i=0;i<data.length;i++){
                         showke+="课程名称 "+data[i].kename+" 开始时间"+data[i].kebegintime+"结束时间"+data[i].keendtime ;
                     }
                     alert(showke)

                }


            })

       }

    //添加表单属性
    layui.use(['form', 'layedit', 'laydate','element'], function(){
        var element = layui.element;
    });
    //自动查询
    $(function(){
        queryAllkecJSR(1);
    });

    //查看课程
    function queryAllkecJSR(pageNum) {
        var kestate=$("#kestate").val();
        $.ajax({
            url: "queryAllkecJSR",
            type: "post",
            data:{kestate:kestate, pageNum:pageNum},
            dataType: "json",
            async:false,
            success: function (data) {
                $("#mytab").html("");
                for ( var i = 0; i < data.list.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data.list[i].keid+"</td>";
                    tr+="<td>"+data.list[i].kename+"</td>";
                    tr+="<td>"+data.list[i].kebegintime+"&nbsp;&nbsp;»&nbsp;&nbsp;"+data.list[i].keendtime+"</td>";
                    tr+="<td>"+data.list[i].kebaomingtimebegin+"&nbsp;&nbsp;»&nbsp;&nbsp;"+data.list[i].kebaomingtimeend+"</td>";
                    tr+="<td>"+data.list[i].kechengmaxren+"</td>";
                    tr+="<td>"+data.list[i].keaddress+"</td>";
                    $.ajax({
                        url: "queryAllketJSR",
                        type: "post",
                        data:{keid:data.list[i].keid},
                        dataType: "json",
                        async:false,
                        success: function (data) {
                            var tea="";
                            for (var i = 0; i < data.length; i++){
                                tea+=data[i].empname+",";
                            }
                            tr+="<td>"+tea+"</td>";
                        }
                    })
                    if(data.list[i].kestate==1){
                        tr+="<td>待审批</td>";
                        tr+="<td><button type='button' data-toggle='modal' data-target='#myModal2' onclick='details("+data.list[i].keid+")'>详情</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].kestate==2){
                        tr+="<td>已通过</td>";
                        tr+="<td><button type='button' data-toggle='modal' data-target='#myModal2' onclick='details("+data.list[i].keid+")'>详情</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].kestate==3){
                        tr+="<td>未通过</td>";
                        tr+="<td><button type='button' data-toggle='modal' data-target='#myModal2' onclick='details("+data.list[i].keid+")'>详情</button></td>";
                        tr+="</tr>";
                    }
                    $("#mytab").append(tr);
                }
                $("#nowPage").html(data.pageNum);
                $("#total").html(data.total);//总条数
                $("#pages").html(data.pages);//总页数
            }
        })
    }
    $("#prepage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllkecJSR(nowPage-1);
    });
    $("#nextpage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllkecJSR(nowPage+1);
    });
    //详情
    function details(obj) {
        $.ajax({
            url: "queryAllkecJSR",
            type: "post",
            data:{keid:obj, pageNum:1},
            dataType: "json",
            success: function (data) {
                var data = data.list;
                $("#kename").val(data[0].kename);
                $("#kemiaoshu").val(data[0].kemiaoshu);
                $("#kexiangqing").val(data[0].kexiangqing);
                $("#kebegintime").val(data[0].kebegintime);
                $("#keendtime").val(data[0].keendtime);
                $("#kebaomingtimebegin").val(data[0].kebaomingtimebegin);
                $("#kebaomingtimeend").val(data[0].kebaomingtimeend);
                $("#keaddress").val(data[0].keaddress);

                $("#keid").val(data[0].keid);
            }
        })
    }



</script>

</body>
</html>
