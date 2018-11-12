<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-11-09
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程审批</title>
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
                        <option value="1">待审批</option>
                        <option value="2">已通过</option>
                        <option value="3">未通过</option>
                    </select>
                </div>
                <div class="layui-inline" style="margin: 0px" >
                    <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="queryAllkecJSR(1)"><i class="layui-icon">&#xe615;</i></button>
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

    <!-- 模态详情（Modal） -->
    <div class="modal fade" id="myModal" >
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
                    <div class="layui-inline">
                        <button class="layui-btn" onclick="tongguo()" style="width: 300px">通过</button>
                        <button class="layui-btn" onclick="bohui()" style="width: 300px;margin-left: 50px">驳回</button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
</body>
<script>
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
                        tr+="<td><button type='button' data-toggle='modal' data-target='#myModal' onclick='details("+data.list[i].keid+")'>详情</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].kestate==2){
                        tr+="<td>已通过</td>";
                        tr+="<td><button>详情</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].kestate==3){
                        tr+="<td>未通过</td>";
                        tr+="<td><button>详情</button></td>";
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

    //通过
    function tongguo() {
        var keid = $("#keid").val();
        $.ajax({
            url:"updatekecYLP",
            type:"post",
            data:{keid:keid, kestate:2},
            dataType:"text",
            success:function(data){
                queryAllkecJSR(1);
                $("#myModal").modal("hide");
                if(data=="true"){alert("通过成功！");}
            }
        });
    }
    //驳回
    function bohui() {
        var keid = $("#keid").val();
        $.ajax({
            url:"updatekecYLP",
            type:"post",
            data:{keid:keid, kestate:3},
            dataType:"text",
            success:function(data){
                queryAllkecJSR(1);
                $("#myModal").modal("hide");
                if(data=="true"){alert("驳回成功！");}
            }
        });
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
</html>
