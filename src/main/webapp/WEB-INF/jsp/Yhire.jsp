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
    .miantab td{
        width: 150px;
        height: 45px;
    }
    .inputss{
        width: 90%;
        height: 99%;
        border: 0px solid ;
        padding-left: 10px;
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
                                    <input name="actnmae" id="resumename" class="layui-input" disabled>
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
                            激活姓名<input name="actname" id="actname">
                        </div>
                        <input type="button" class="layui-btn layui-btn-fluid" onclick="sendAct()" value="发送邮件" style="letter-spacing:15px;"/>
                    </form>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 模态详情（Modal） -->
    <div class="modal fade" id="myModal2" >
        <div class="modal-dialog"  style="width: 1000px;margin-bottom: 80px" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                        员工面试记录
                    </h4>
                </div>
                <div class="modal-body">
                    <%--<form class="layui-form" id="OneForm" >
                    <table border="1" style="margin: 10px auto;text-align: center; border-collapse:collapse;"  class="miantab">
                        <tr>
                            <td>姓名：</td>
                            <td><input class="inputss" id="resumename" readOnly></td>
                            <td>性别：</td>
                            <td><input class="inputss" id="sex" readOnly></td>
                            <td>年龄：</td>
                            <td><input class="inputss" id="age" readOnly></td>
                        </tr>
                        <tr>
                            <td>面试职位：</td>
                            <td><input class="inputss" id="resposition" readOnly></td>
                            <td>学历：</td>
                            <td><input class="inputss" id="education" readOnly></td>
                            <td>所学专业：</td>
                            <td><input class="inputss" id="resmajor" readOnly></td>
                        </tr>
                        <tr>

                            <td colspan="3">评分项目</td>
                            <td colspan="3">
                                评分标准（35分以上考虑）
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="10">个人基本素质评价</td>
                            <td colspan="2">1：仪容外貌</td>
                            <td colspan="3">
                                <input class="inputss" id="inoone" readOnly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">2：语言表达能力</td>
                            <td colspan="3">
                                <input class="inputss" id="inotwo" readOnly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">3：亲和力</td>
                            <td colspan="3">
                                <input class="inputss" id="inothree" readOnly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">4：诚实度</td>
                            <td colspan="3">
                                <input class="inputss" id="inofour" readOnly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">5：时间观念</td>
                            <td colspan="3">
                                <input class="inputss" id="inofive" readOnly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">6：逻辑思维</td>
                            <td colspan="3">
                                <input class="inputss" id="inosix" readOnly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">7：应变能力</td>
                            <td colspan="3">
                                <input class="inputss" id="inoseven" readOnly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">8：人格成熟程度</td>
                            <td colspan="3">
                                <input class="inputss" id="inoeight" readOnly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">9：判断分析能力</td>
                            <td colspan="3">
                                <input class="inputss" id="inonine" readOnly>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">10：自我认识能力</td>
                            <td colspan="3">
                                <input class="inputss" id="inoten" readOnly>
                            </td>
                        </tr>
                        <tr>
                            <td>是否通过：</td>
                            <td colspan="2">
                                <input class="inputss" id="inostate" readOnly>
                            </td>
                            <td>点击计分：</td>
                            <td colspan="2">
                                <input name="inograde" class="inputss" id="inograde" readonly >
                            </td>
                        </tr>

                        <tr style="height: 100px;">
                            <td colspan="1">面试批语</td>
                            <td colspan="5">
                    <textarea  name="inonotes" id="inonotes" class="layui-textarea">
                    </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>面试时间</td>
                            <td colspan="2"><input name="inodate" class="inputss" id="inodate"></td>
                            <td>面试官</td>
                            <td colspan="2"><input name="inname" class="inputss" value="${emp.empname}" id="inname" style="border-bottom: 1px solid #000000"></td>
                        </tr>
                    </table>
                    </form>--%>
                    <form class="layui-form" id="TwoForm" >
                        <table border="1" style="margin: 10px auto;text-align: center; border-collapse:collapse;"  class="miantab">
                            <tr style="height: 45px;">
                                <td>姓名：</td>
                                <td><input class="inputss" id="resumename2" readOnly></td>
                                <td>性别：</td>
                                <td><input class="inputss" id="sex" readOnly></td>
                                <td>年龄：</td>
                                <td><input class="inputss" id="age" readOnly></td>
                            </tr>
                            <tr style="height: 45px;">
                                <td>面试职位：</td>
                                <td><input class="inputss" id="resposition" readOnly></td>
                                <td>学历：</td>
                                <td><input class="inputss" id="education" readOnly></td>
                                <td>所学专业：</td>
                                <td><input class="inputss" id="resmajor" readOnly></td>
                            </tr>
                            <tr style="height: 40px;">

                                <td colspan="3">评分项目</td>
                                <td colspan="3">
                                    评分标准（35分以上考虑）
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td rowspan="10">相关的工作经验及专业知识</td>
                                <td colspan="2">1：工作经验</td>
                                <td colspan="3">
                                    <input class="inputss" id="intone" readOnly style="width: 80px">分
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td colspan="2">掌握的专业知识</td>
                                <td colspan="3">
                                    <input class="inputss" id="inttwo" readOnly style="width: 80px">分
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td colspan="2">3：对企业的价值</td>
                                <td colspan="3">
                                    <input class="inputss" id="intthree" readOnly style="width: 80px">分
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td colspan="2">4：个人工作观念</td>
                                <td colspan="3">
                                    <input class="inputss" id="intfour" readOnly style="width: 80px">分
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td colspan="2">5：学习能力</td>
                                <td colspan="3">
                                    <input class="inputss" id="intfive" readOnly style="width: 80px">分
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td colspan="2">6：工作创造能力</td>
                                <td colspan="3">
                                    <input class="inputss" id="intsix" readOnly style="width: 80px">分
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td colspan="2">7：对企业的忠诚度</td>
                                <td colspan="3">
                                    <input class="inputss" id="intseven" readOnly style="width: 80px">分
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td colspan="2">8：职位胜任能力</td>
                                <td colspan="3">
                                    <input class="inputss" id="inteight" readOnly style="width: 80px">分
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td colspan="2">9：个性特征与企业文化的相融性</td>
                                <td colspan="3">
                                    <input class="inputss" id="intnine" readOnly style="width: 80px">分
                                </td>
                            </tr>
                            <tr style="height: 40px;">
                                <td colspan="2">10：稳定性、发展潜力</td>
                                <td colspan="3">
                                    <input class="inputss" id="intten" readOnly style="width: 80px">分
                                </td>
                            </tr>
                            <tr style="height: 45px;">
                                <td>是否通过：</td>
                                <td colspan="2">
                                    <input class="inputss" id="tgintstate" value="已通过" readOnly>
                                </td>
                                <td>点击计分：</td>
                                <td colspan="2">
                                    <input class="inputss" id="intgrade" readonly >
                                </td>
                            </tr>
                            <tr style="height: 100px;">
                                <td colspan="2">面试批语</td>
                                <td colspan="4">
                                    <textarea id="intnotes" class="layui-textarea" readOnly> </textarea>
                                </td>
                            </tr>
                            <tr style="height: 45px;">
                                <td>面试时间</td>
                                <td colspan="2"><input class="inputss" id="intdate" readOnly></td>
                                <td>面试官</td>
                                <td colspan="2"><input class="inputss" id="intname" style="border-bottom: 1px solid #000000" readOnly></td>
                            </tr>
                        </table>
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
                    tr+="<td data-toggle='modal' data-target='#myModal2' onclick='details("+data.list[i].intid+")'>"+data.list[i].intid+"</td>";
                    tr+="<td data-toggle='modal' data-target='#myModal2' onclick='details("+data.list[i].intid+")'>"+data.list[i].resumename+"</td>";
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
            async:false,
            success: function (data) {
                $("#resumename").val(data[0].resumename);
                $("#emali").val(data[0].emali);
                $("#phone").val(data[0].phone);
                $("#intid").val(data[0].intid);
                $("#intstate").val(data[0].intstate);
                $("#actname").val(data[0].resumename);
                $("#resid").val(data[0].resid);
                $("#emali2").val(data[0].emali);//发送的邮件
            }
        })
        //生成员工编号
        $.ajax({
            url: "queryActIDYLP",
            type: "post",
            dataType: "json",
            async:false,
            success: function(data) {
                    var actnumber = data.actid ;//员工编号
                    var qz =101;//开始号
                    var newbh = qz + data.actid
                    $("#actnumber").val("RZ"+newbh);
            }
        });
        $("#notice").html("                                 入职通知单：\n" +
            "你好，我这边是新乡睿智科技有限公司，经过多次面试，你符合本公司的基本符合要求。现给你安排入职，请在规定时间内前报道并且激活工号。\n" +
            "公司地址：新乡红旗区北三环大学生创业园区。\n" +
            "电话：8888888 徐酱酱 15837389710\n" +
            "激活地址：http://localhost:8080/jihuo?gh="+$("#actnumber").val()+"&name="+$("#actname").val()+"")
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
                    queryAllInteTwo(1);
                    $("#myModal").modal("hide");
                    if(data=="true"){alert("已发送邀请入职邮件");}
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

    //员工面试信息
    function details(obj) {
        //第二轮面试信息
        $.ajax({
            url: "queryOneInteTwoYLP",
            type: "post",
            data:{intid:obj},
            dataType: "json",
            success: function (data) {
                $("#resumename2").val(data[0].resumename);
                $("#sex").val(data[0].sex);
                $("#age").val(data[0].age);
                $("#resposition").val(data[0].resposition);
                $("#education").val(data[0].education);
                $("#resmajor").val(data[0].resmajor);

                $("#intone").val(data[0].intone);
                $("#inttwo").val(data[0].inttwo);
                $("#intthree").val(data[0].intthree);
                $("#intfour").val(data[0].intfour);
                $("#intfive").val(data[0].intfive);
                $("#intsix").val(data[0].intsix);
                $("#intseven").val(data[0].intseven);
                $("#inteight").val(data[0].inteight);
                $("#intnine").val(data[0].intnine);
                $("#intten").val(data[0].intten);
                $("#intgrade").val(data[0].intgrade);
                $("#intnotes").val(data[0].intnotes);
                $("#intname").val(data[0].intname);
                $("#intdate").val(data[0].intdate);
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
    if(month<=9){ month = "0"+month; }
    if(day<=9){ day = "0"+day; }
    if(hour<=9){ hour = "0"+hour; }
    if(min<10){ min="0"+min;}
    if(second<10){second="0"+second; }
    var senddate=year+"-"+month+"-"+day+" "+hour+":"+min+":"+second;//发送时间
    $("#senddate").val(senddate);//通知时间
</script>
</html>
