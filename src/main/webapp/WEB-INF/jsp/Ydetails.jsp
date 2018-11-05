<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-11-05
  Time: 08:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>激活详情</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../assets/css/bootstrap.css" type="text/css">
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
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
<div class="panel panel-default" style="margin:1%">
    <!-- 多条件查询  -->
    <div class="panel-heading" style="height: 60px">
        <div class="layui-form" >
            <div class="layui-form-item">
                <div class="layui-inline" style="margin: 0px">
                    <select id="actstate">
                        <option value="0">未激活</option>
                        <option value="1">已激活</option>
                        <option value="2">回收站</option>
                    </select>
                </div>
                <div class="layui-inline" style="margin: 0px" >
                    <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="queryAllAct(1)"><i class="layui-icon">&#xe615;</i></button>
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
                    <th>激活姓名</th>
                    <th>激活工号</th>
                    <th>手机号</th>
                    <th>邮箱号</th>
                    <th>招聘职位</th>
                    <th>激活截止时间</th>
                    <th>激活状态</th>
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
</body>
<script>
    //添加表单属性
    layui.use(['form', 'layedit', 'laydate'], function(){});
    //自动查询
    $(function(){
        queryAllAct(1);

    });

    //查看面试
    function queryAllAct(pageNum) {
        var actstate=$("#actstate").val();
        $.ajax({
            url: "queryAllActYLP",
            type: "post",
            data:{actstate:actstate, pageNum:pageNum},
            dataType: "json",
            success: function (data) {
                $("#mytab").html("");
                for ( var i = 0; i < data.list.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data.list[i].actid+"</td>";
                    tr+="<td>"+data.list[i].actname+"</td>";
                    tr+="<td>"+data.list[i].actnumber+"</td>";
                    tr+="<td>"+data.list[i].phone+"</td>";
                    tr+="<td>"+data.list[i].emali+"</td>";
                    tr+="<td>"+data.list[i].resposition+"</td>";
                    tr+="<td>"+data.list[i].actdate+"</td>";
                    if(data.list[i].actstate==0){
                        tr+="<td>未激活</td>";
                        tr+="<td><button onclick='qingchu("+data.list[i].actid+")'>清除</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].actstate==1){
                        tr+="<td>待入职</td>";
                        tr+="<td></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].actstate==2){
                        tr+="<td>回收站</td>";
                        tr+="<td></td>";
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

    //过期清除
    function qingchu(obj) {
        $.ajax({
            url: "ccActYLP",
            type: "post",
            data: {actid:obj, actstate:2},
            dataType: "text",
            success: function (data) {
                if(data == "true"){
                    queryAllAct(1);
                }
            }
        })
    }

    $("#prepage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllAct(nowPage-1);
    });
    $("#nextpage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllAct(nowPage+1);
    });



</script>
</html>
