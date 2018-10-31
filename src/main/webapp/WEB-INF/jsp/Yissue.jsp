<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-10-14
  Time: 22:26
  To change this template use File | Settings | File Templates.
  招聘信息发布
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>招聘信息发布</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../assets/css/bootstrap.css" type="text/css">
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
</head>
<style>
    .layui-inline{
        margin-left: 50px;
    }
    .layui-form-label{
        width: auto;
    }
    .content{
        border: 0px solid #000000;
        width: 1000px;
        margin: 0px auto;
    }
    .biaoti{
        height: 40px;
        text-align: center;
        line-height: 40px;
        font-size: 20px;
        letter-spacing:15px;
        color: #22AD91;
        background-color: #F4F4F4;
        margin: 5px;
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
                    <select id="recstate">
                        <option value="0">已申请</option>
                        <option value="1">已发布</option>
                        <option value="2">已撤除</option>
                        <option value="">所有申请</option>
                    </select>
                </div>
                <div class="layui-inline" style="margin: 0px" >
                    <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="queryAllRec(1)"><i class="layui-icon">&#xe615;</i></button>
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
                    <th>招聘部门</th>
                    <th>招聘职务</th>
                    <th>招聘人数</th>
                    <th>工作地址</th>
                    <th>发布时间</th>
                    <th>性别要求</th>
                    <th>学历要求</th>
                    <th>年龄要求</th>
                    <th>工作经验</th>
                    <th>专业要求</th>
                    <th>其他要求</th>
                    <th>审批状态</th>
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
    layui.use(['form', 'layedit', 'laydate'], function(){ });

    //自动查询
    $(function(){
        queryAllRec(1);
    });

    //查看招聘申请
    function queryAllRec(pageNum) {
        var recstate =  $("#recstate").val();
        $.ajax({
            url: "queryAllRecYLP",
            type: "post",
            data:{recstate:recstate, pageNum:pageNum},
            dataType: "json",
            success: function (data) {
                //alert(data);
                $("#mytab").html("");
                for ( var i = 0; i < data.list.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data.list[i].recid+"</td>";
                    tr+="<td>"+data.list[i].deptname+"</td>";
                    tr+="<td>"+data.list[i].posname+"</td>";
                    if(data.list[i].recnumber==undefined){   data.list[i].recnumber=" ";   }
                    tr+="<td>"+data.list[i].recnumber+"</td>";
                    tr+="<td>"+data.list[i].recaddress+"</td>";
                    tr+="<td>"+data.list[i].recreachdate+"</td>";
                    tr+="<td>"+data.list[i].recsex+"</td>";
                    tr+="<td>"+data.list[i].receducation+"</td>";
                    tr+="<td>"+data.list[i].recage+"</td>";
                    tr+="<td>"+data.list[i].recsuffer+"</td>";
                    tr+="<td>"+data.list[i].recmajor +"</td>";
                    tr+="<td>"+data.list[i].recrequire+"</td>";
                    if(+data.list[i].recstate==0){data.list[i].recstate="已申请"}
                    if(+data.list[i].recstate==1){data.list[i].recstate="已发布"}
                    if(+data.list[i].recstate==2){ data.list[i].recstate="已撤除"}
                    tr+="<td>"+data.list[i].recstate+"</td>";
                    tr+="<td>";
                    tr+="<button onclick='fabu("+data.list[i].recid+")'>发布</button>";
                    tr+="</td>";
                    tr+="</tr>";
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
        queryAllRec(nowPage-1);
    });
    $("#nextpage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllRec(nowPage+1);
    });



    //发布
    function fabu(obj) {
        $.ajax({
            url:"updateRecYLP",
            type:"post",
            data:{recid:obj, recstate:1},
            dataType: "text",
            success:function(data) {
                queryAllRec(1);
            }
        })
    }
    //添加招聘申请
    function addRec() {
        $.ajax({
            url:"addRecYLP",
            type:"post",
            data:$("#addRecForm").serialize(),
            dataType: "text",
            success:function(data) {
                if(data=="true"){alert("申请成功");}
                queryAllRec(1);
                $("#myModal").modal("hide");
            }
        })
    }






    //系统时间
    var date=new Date();
    var year=date.getFullYear();//年
    var month=date.getMonth()+1;//月
    var day=date.getDate();//日
    var hour=date.getHours();//时
    var min=date.getMinutes();//分
    var second=date.getSeconds();//秒
    if(min<10){ min="0"+min;}
    if(second<10){second="0"+second; }
    var recreachdate=year+"-"+month+"-"+day;
    $("#recreachdate1").val(recreachdate);//申请时间
    $("#recreachdate2").val(recreachdate)



</script>
</html>
