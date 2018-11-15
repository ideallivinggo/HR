<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-11-09
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>培训记录</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../assets/css/bootstrap.css" type="text/css">
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
</head>
<style>
    .layui-form-label{
        width: auto;
    }

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
<div class="panel panel-default" style="margin:1%">
    <!-- 多条件查询  -->
    <div class="panel-heading" style="height: 60px">
        <div class="layui-form" >
            <div class="layui-form-item">
                <div class="layui-inline" style="margin: 0px">
                    <select id="kestate">
                        <option value="2">未打分</option>
                        <option value="4">已完成</option>
                    </select>
                </div>
                <div class="layui-inline" style="margin: 0px" >
                    <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="queryAllkeeJSR(1)"><i class="layui-icon">&#xe615;</i></button>
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

    <!-- 模态未打分详情（Modal） -->
    <div class="modal fade" id="myModal" >
        <div class="modal-dialog"  style="width: 100%;margin-top: -2px" >
            <div class="modal-content">
                <div class="modal-body"style="height: 640px;overflow:auto" >
                    <div class="panel panel-default" style="margin: 1%;">
                        <!-- 多条件查询  -->
                        <div class="layui-form panel-heading" style="height: 60px">
                            <div class="layui-form-item">
                            <div class="layui-inline" style="margin: 0px;width: 200px">
                                <select id="keokstate" >
                                    <option value="0">未打分</option>
                                    <option value="1">已通过</option>
                                    <option value="2">未通过</option>
                                </select>
                            </div>
                            <div class="layui-inline" style="margin: 0px;width: 200px">
                                <input name="empnumber" id="empnumber" placeholder="请输入员工编号" class="layui-input">
                            </div>
                            <div class="layui-inline" style="margin: 0px" >
                                <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="details()"><i class="layui-icon">&#xe615;</i></button>
                            </div>
                            <div class="layui-inline" style="float: right" >
                                <div style="display: none"><input id="keid"></div>
                                未打分剩余：<span id="sheng"></span>&nbsp;人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="layui-btn" onclick="wancheng()">培训完成</button>
                                <button class="layui-btn" onclick="guanbi()">关闭</button>
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
                                        <th>员工姓名</th>
                                        <th>员工编号</th>
                                        <th>课程名称</th>
                                        <th>培训分数</th>
                                        <th>培训评语</th>
                                        <th>课评时间</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="mytab2">
                                    <!--数据-->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 模态已完成打分详情（Modal） -->
    <div class="modal fade" id="myModal3" >
        <div class="modal-dialog"  style="width: 100%;margin-top: -2px" >
            <div class="modal-content">
                <div class="modal-body"style="height: 625px;overflow:auto" >
                    <div class="panel panel-default" style="margin: 1%;">
                        <!-- 多条件查询  -->
                        <div class="layui-form panel-heading" style="height: 60px">
                            <div class="layui-form-item">
                                <div class="layui-inline" style="margin: 0px;width: 200px">
                                    <select id="keokstate3" >
                                        <option value="1">已通过</option>
                                        <option value="2">未通过</option>
                                    </select>
                                </div>
                                <div class="layui-inline" style="margin: 0px;width: 200px">
                                    <input  id="empnumber3" placeholder="请输入员工编号" class="layui-input">
                                </div>
                                <div class="layui-inline" style="margin: 0px" >
                                    <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="details2()"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                                <div class="layui-inline" style="float: right" >
                                    <button class="layui-btn" onclick="guanbi2()">关闭</button>
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
                                        <th>员工姓名</th>
                                        <th>员工编号</th>
                                        <th>课程名称</th>
                                        <th>培训分数</th>
                                        <th>培训评语</th>
                                        <th>课评时间</th>
                                        <th>状态</th>
                                    </tr>
                                    </thead>
                                    <tbody id="mytab3">
                                    <!--数据-->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- 模态打分（Modal） -->
    <div class="modal fade" id="myModal2" >
        <div class="modal-dialog"  style="width: 700px;margin-bottom: 80px" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                        培训员工打分
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="layui-form" id="dafenForm">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">员工姓名</label>
                                <div class="layui-input-block" style="width: 200px">
                                    <input id="empname"  class="layui-input" disabled>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">员工编号</label>
                                <div class="layui-input-block" style="width: 200px">
                                    <input id="empnumber2"  class="layui-input" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">课程名称</label>
                                <div class="layui-input-block" style="width: 200px">
                                    <input id="kename"  class="layui-input" disabled>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">课评时间</label>
                                <div class="layui-input-block" style="width: 200px">
                                    <input id="kebegintime" name="kepingjiatime" class="layui-input" >
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">培训打分</label>
                                <div class="layui-input-block" style="width: 200px">
                                    <input id="kefenshuo" name="kefenshuo" class="layui-input" >
                                </div>
                            </div>
                            <div class="layui-inline" >
                                <label class="layui-form-label">是否通过</label>
                                <div class="layui-input-block" style="width: 200px">
                                    <input name="keokstate" value="1" title="通过" type="radio">
                                    <input name="keokstate" value="2" title="未通过" type="radio">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">培训评语</label>
                                <div class="layui-input-block" style="width: 525px">
                                    <textarea id="kepingyu" name="kepingyu" class="layui-textarea"> </textarea>
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item" style="display: none">
                            <div class="layui-inline" >
                                <label class="layui-form-label">课评id</label>
                                <div class="layui-input-block" style="width: 200px">
                                    <input id="keempid" name="keempid" class="layui-input">
                                </div>
                            </div>
                        </div>

                        <input type="reset" class="layui-btn layui-btn-fluid" onclick="baocun()"  value="保存" style="letter-spacing:15px;"/>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>



</div>
</body>
<script>
    //添加表单属性
    layui.use(['form', 'layedit', 'laydate','element'], function(){

    });
    //自动查询
    $(function(){
        queryAllkeeJSR(1);

    });

    //查看课程
    function queryAllkeeJSR(pageNum) {
        var kestate=$("#kestate").val();
        $.ajax({
            url: "queryAllkeeJSR",
            type: "post",
            data:{empid:'${emp.empid}', kestate:kestate, pageNum:pageNum},
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
                    tr+="<td>"+data.list[i].empname+"</td>";
                    if(data.list[i].kebegintime <= sjijian &data.list[i].kestate==2){
                        tr+="<td>待打分</td>";
                        tr+="<td><button type='button' data-toggle='modal' data-target='#myModal' onclick='details("+data.list[i].keid+")'>员工详情</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].kebegintime > sjijian & data.list[i].kestate==2){
                        tr+="<td>未开始</td>";
                        tr+="<td><button type='button' data-toggle='modal' data-target='#myModal' onclick='details("+data.list[i].keid+")'>员工详情</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].kestate==4){
                        tr+="<td>已完成</td>";
                        tr+="<td><button type='button' data-toggle='modal' data-target='#myModal3' onclick='details2("+data.list[i].keid+")'>员工详情</button></td>";
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
        queryAllkeeJSR(nowPage-1);
    });
    $("#nextpage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllkeeJSR(nowPage+1);
    });
    //未完成打分的员工
    function details(obj) {
        var keid=$("#keid").val(obj);
        var keokstate=$("#keokstate").val();
        var empnumber=$("#empnumber").val();
        $.ajax({
            url: "queryAllkeempJSR",
            type: "post",
            data:{keid:obj, keokstate:keokstate,empnumber:empnumber},
            dataType: "json",
            async:false,
            success: function (data) {
                $("#mytab2").html("");
                for ( var i = 0; i < data.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data[i].keempid+"</td>";
                    tr+="<td>"+data[i].empname+"</td>";
                    tr+="<td>"+data[i].empnumber+"</td>";
                    tr+="<td>"+data[i].kename+"</td>";
                    if(data[i].kefenshuo==undefined){data[i].kefenshuo=""}
                    tr+="<td>"+data[i].kefenshuo+"</td>";
                    if(data[i].kepingyu==undefined){data[i].kepingyu=""}
                    tr+="<td>"+data[i].kepingyu+"</td>";
                    if(data[i].kepingjiatime==undefined){data[i].kepingjiatime=""}
                    tr+="<td>"+data[i].kepingjiatime+"</td>";
                    if(data[i].keokstate==0){
                        tr+="<td>未打分</td>";
                        tr+="<td><button type='button' data-toggle='modal' data-target='#myModal2' onclick='xiangqing("+data[i].keempid+")'>打分</button></td>";
                        tr+="</tr>";
                    }
                    if(data[i].keokstate==1){
                        tr+="<td>通过</td>";
                        tr+="<td></td>";
                        tr+="</tr>";
                    }
                    if(data[i].keokstate==2){
                        tr+="<td>未通过</td>";
                        tr+="<td></td>";
                        tr+="</tr>";
                    }
                    $("#mytab2").append(tr);
                }
            }
        })
        shengyu();//加载未打分剩余人数
    }
    //已完成的打分员工
    function details2(obj) {
        var keokstate=$("#keokstate3").val();
        var empnumber=$("#empnumber3").val();
        $.ajax({
            url: "queryAllkeempJSR",
            type: "post",
            data:{keid:obj, keokstate:keokstate,empnumber:empnumber},
            dataType: "json",
            async:false,
            success: function (data) {
                $("#mytab3").html("");
                for ( var i = 0; i < data.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data[i].keempid+"</td>";
                    tr+="<td>"+data[i].empname+"</td>";
                    tr+="<td>"+data[i].empnumber+"</td>";
                    tr+="<td>"+data[i].kename+"</td>";
                    tr+="<td>"+data[i].kefenshuo+"</td>";
                    tr+="<td>"+data[i].kepingyu+"</td>";
                    tr+="<td>"+data[i].kepingjiatime+"</td>";
                    if(data[i].keokstate==1){tr+="<td>通过</td>";}
                    if(data[i].keokstate==2){ tr+="<td>未通过</td>"; }
                    tr+="</tr>";
                    $("#mytab3").append(tr);
                }
            }
        })
    }
//员工打分详情
    function xiangqing(obj) {
        $.ajax({
            url: "queryAllkeempJSR",
            type: "post",
            data:{keempid:obj},
            dataType: "json",
            success: function (data) {

                $("#empname").val(data[0].empname);
                $("#empnumber2").val(data[0].empnumber);
                $("#kename").val(data[0].kename);
                $("#keempid").val(data[0].keempid);
                $("#kebegintime").val(kebegintime);//面试时间
            }
        })
    }

    //打分
     function baocun() {
         $.ajax({
             url:"dafenYLP",
             type:"post",
             data:$("#dafenForm").serialize(),
             dataType:"text",
             success:function(data){
                 var keid=$("#keid").val();//重新获取课程id，防止刷新丢失
                 details(keid);//查询待打分
                 $("#myModal2").modal("hide");
                 if(data=="true"){alert("打分完成！");}
             }
         });
     }

    //剩余
     function shengyu() {
         var keid=$("#keid").val();
        $.ajax({
             url: "shengyuYLP",
             type: "post",
             data:{keid:keid},
             dataType: "json",
             success: function (data) {
                 $("#sheng").html(data.sheng);
             }
         })
     }
     //完成
    function wancheng() {
        var keid=$("#keid").val();
        if($("#sheng").html()==0){
            $.ajax({
                url:"wanchengYLP",
                type:"post",
                data:{keid:keid},
                dataType:"text",
                success:function(data){
                    $("#myModal").modal("hide");
                    queryAllkeeJSR(1);
                    if(data=="true"){alert("本课程培训完成");}
                }
            });
        }else {
            alert("本课程员工打分未完成")
        }

    }






//关闭模态窗
    function guanbi() {
        $("#myModal").modal("hide");
    }
    function guanbi2() {
        $("#myModal3").modal("hide");
    }

    //系统时间
    var date=new Date();
    var year=date.getFullYear();//年
    var month=date.getMonth()+1;//月
    var day=date.getDate();//日
    var hour=date.getHours();//时
    var min=date.getMinutes();//分
    var second=date.getSeconds();//秒
    if(month<=9){ month = "0"+month; }
    if(day<=9){ day = "0"+day; }
    if(hour<=9){ hour = "0"+hour; }
    if(min<10){ min="0"+min;}
    if(second<10){second="0"+second; }
    var kebegintime=year+"-"+month+"-"+day;
    var sjijian=year+"-"+month+"-"+day;
</script>
</html>