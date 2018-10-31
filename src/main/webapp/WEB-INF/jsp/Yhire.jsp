<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-10-24
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工录用推送</title>
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
    .layui-input{
        width: 200px;
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
    <div class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline" style="margin: 0px">
                <select id="intstate">
                    <option value="4">待录取</option>
                    <option value="1">待推送</option>
                    <option value="3">已推送</option>

                </select>
            </div>
            <div class="layui-inline" style="margin: 0px" >
                <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="queryAllInteTwo(1)"><i class="layui-icon">&#xe615;</i></button>
            </div>
            <div class="layui-inline" style="margin-left: 850px" >
                <button class="layui-btn" onclick="inteTwoPash()">推送给人事部</button>
            </div>
        </div>
    </div>
</div>
<!--table表格-->
<div class="panel-body ">
    <div class="table-responsive">
        <table class="layui-table">
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>学历</th>
                <th>专业</th>
                <th>心仪职位</th>
                <th>面试时间</th>
                <th>分数</th>
                <th>面试官</th>
                <th>面试备注</th>
                <th>人员状态</th>
                <th>
                    <input type="checkbox" onclick="selectAll(this);" />操作
                </th>
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

<!-- 模态框邀请入职信息填写（Modal） -->
<div class="modal fade" id="myModal" >
    <div class="modal-dialog" style="width: 700px;" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                    发送入职邀请
                </h4>
            </div>
            <div class="modal-body">
                <form class="layui-form" id="sendForm" >
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-block">
                                <input id="resumename" class="layui-input" disabled>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">QQ邮箱</label>
                            <div class="layui-input-block">
                                <input id="emali" class="layui-input" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input id="phone" class="layui-input" disabled>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">发送时间</label>
                            <div class="layui-input-block">
                                <input id="senddate" class="layui-input" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">通知信息</label>
                        <div class="layui-input-block" style="width: 520px">
                                    <textarea name="notice" id="notice" placeholder="请输入通知信息" class="layui-textarea" rows="6">
                                 入职通知单：
你好，我这边是新乡睿智科技有限公司，经过多次面试，你符合本公司的基本符合要求。现给你安排入职，请在规定时间内前报道并且激活工号。
公司地址：新乡红旗区北三环大学生创业园区。
电话：8888888 徐酱酱 15837389710
激活地址：http://localhost:8080/jihuo.jsp
                                    </textarea>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">报道时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input name="actdate" class="layui-input" id="actdate"  placeholder="yyyy-MM-dd HH:mm:ss">
                        </div>
                    </div>
                    <div style="display: none">
                        面试id<input name="intid" id="intid">
                        面试状态<input name="intstate" value="2"><br>
                        发送邮箱<input name="emali" id="emali2">
                        简历id<input name="resid" id="resid"><br>
                        员工激活编号<input name="actnumber" id="actnumber">
                        员工激活状态<input name="actstate" value="0">
                    </div>
                    <input type="button" class="layui-btn layui-btn-fluid" onclick="sendAct()" value="发送邮件" style="letter-spacing:15px;"/>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</div>
</body>
<script>
    //添加表单属性
    layui.use(['form', 'layedit', 'laydate'], function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#actdate'
            ,type: 'datetime'
        });
    });
    //自动查询
    $(function(){
        queryAllInteTwo(1);
        //$("#myModal").modal("show");//模态框开启
    });

    //查看面试
    function queryAllInteTwo(pageNum) {
        var intstate=$("#intstate").val();
        $.ajax({
            url: "queryAllInteTwoYLP",
            type: "post",
            data:{intstate:intstate, pageNum:pageNum},
            dataType: "json",
            async:false,
            success: function (data) {
                $("#mytab").html("");
                for ( var i = 0; i < data.list.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data.list[i].intid+"</td>";
                    tr+="<td>"+data.list[i].resumename+"</td>";
                    tr+="<td>"+data.list[i].sex+"</td>";
                    tr+="<td>"+data.list[i].age+"</td>";
                    tr+="<td>"+data.list[i].education+"</td>";
                    tr+="<td>"+data.list[i].resmajor+"</td>";
                    tr+="<td>"+data.list[i].resposition+"</td>";
                    tr+="<td>"+data.list[i].intdate+"</td>";
                    tr+="<td>"+data.list[i].intgrade+"</td>";
                    tr+="<td>"+data.list[i].intname+"</td>";
                    tr+="<td>"+data.list[i].intnotes+"</td>";
                    if(data.list[i].intstate==3){
                        tr+="<td>已推送</td>";
                        tr+="<td>等待回复</td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].intstate==1){
                        tr+="<td>已通过</td>";
                        tr+="<td><input class='intid' type='checkbox' value='"+data.list[i].intid+"'></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].intstate==4){
                        tr+="<td>待录取</td>";
                        tr+="<td><button data-toggle='modal' data-target='#myModal' onclick='queryOneInte("+data.list[i].intid+")'>录取邀请</button></td>";
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

    //全选
    function selectAll(checkbox) {
        $('input[type=checkbox]').prop('checked', $(checkbox).prop('checked'));
    }
    //全部推送到人事部
    function inteTwoPash() {
        var str="";
        //获取到所有的被选中的复选框
        $(".intid").each(function(){
            if($(this).prop("checked")==true){
                var jsonStr=$(this).val();
                str+=jsonStr+",";
            }
        });
       $.ajax({
            url:"inteTwoPashYLP",
            type:"post",
            data:{intstate:3,s:str},
            dataType:"text",
            success:function(data){
                if(data=="true"){alert("推送成功");}
                queryAllInteTwo(1);
            }
        });
    }

    //单个信息
    function queryOneInte(obj) {
        $.ajax({
            url: "queryOneInteTwoYLP",
            type: "post",
            data:{intid:obj},
            dataType: "json",
            success: function (data) {
                $("#resumename").val(data[0].resumename);
                $("#emali").val(data[0].emali);
                $("#phone").val(data[0].phone);
                $("#intid").val(data[0].intid);
                $("#intstate").val(data[0].intstate);
                $("#resid").val(data[0].resid);
                $("#emali2").val(data[0].emali);//发送的邮件
            }
        })
        //生成员工编号
        $.ajax({
            url: "queryActIDYLP",
            type: "post",
            dataType: "json",
            success: function(data) {
                    var actnumber = data.actid ;//员工编号
                    var qz =101;//开始号
                    var newbh = qz + data.actid
                    $("#actnumber").val("RZ"+newbh);
            }
        });
    }
    //添加员工激活
    function sendAct() {
        var senddate=$("#senddate").val();//发送时间
        var actdate=$("#actdate").val();//报道时间
        if(actdate == "") {
            alert("请输入报道时间！")
        }else if(actdate <= senddate){
            alert("报道不能小于当前时间！")
        }else {
            $.ajax({
                url:"addActYLP",
                type:"post",
                data:$("#sendForm").serialize(),//添加员工激活
                dataType: "text",
                success:function(data) {
                    if(data=="true"){alert("已发送邀请入职邮件");}
                    queryAllInteTwo(1);
                    $("#myModal").modal("hide");
                }
            })
        }
    }




    $("#prepage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllInteTwo(nowPage-1);
    });
    $("#nextpage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllInteTwo(nowPage+1);
    });



    //系统时间
    var date=new Date();
    var year=date.getFullYear();//年
    var month=date.getMonth()+1;//月
    var day=date.getDate();//日
    var hour=date.getHours();//时
    if(hour<=9){ hour = "0"+hour; }
    var min=date.getMinutes();//分
    var second=date.getSeconds();//秒
    if(min<10){ min="0"+min;}
    if(second<10){second="0"+second; }
    var senddate=year+"-"+month+"-"+day+" "+hour+":"+min+":"+second;//发送时间
    $("#senddate").val(senddate);//通知时间
</script>
</html>
