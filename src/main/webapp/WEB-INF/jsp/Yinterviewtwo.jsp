<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-10-22
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>第二次面试</title>
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
</style>
<body>
<!-- 多条件查询  -->
<div class="layui-form" 6 style=" height: 40px; float: left; margin-top: 10px; margin-bottom: 10px;  ">
    <div class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline" style="margin: 0px">
                <select id="intstate">
                    <option value="0">待面试</option>
                    <option value="1">已通过</option>
                    <option value="2">回收站</option>
                </select>
            </div>
            <div class="layui-inline" style="margin: 0px" >
                <input type="button" class="layui-btn" onclick="queryAllInteTwo(1)" value="查询" style="width: 100px">
            </div>
            <div class="layui-inline" style="margin-left: 850px" >
                <a href="Yinterview"><button class="layui-btn">查看第一次面试</button></a>
            </div>
        </div>
    </div>
</div>
<!--table表格-->
<table class="layui-table">
    <colgroup>
        <col width="100">
    </colgroup>
    <thead>
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>学历</th>
        <th>专业</th>
        <th>心仪职位</th>
        <th>面试轮次</th>
        <th>面试时间</th>
        <th>面试官</th>
        <th>面试备注</th>
        <th>面试状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytab">
    <!--数据-->
    </tbody>
</table>

<!--分页按钮-->
<div>
    <a id="prepage">上一页</a>
    <a id="nextpage">下一页
    </a>当前第<span id="nowPage"></span>页
    </a>共<span id="pages"></span>页
    </a>共<span id="total"></span>条
</div>


<!-- 模态框查询面试信息填写（Modal） -->
<div class="modal fade" id="myModal" >
    <div class="modal-dialog" style="width: 700px;" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                    第二次面试信息填写
                </h4>
            </div>
            <div class="modal-body">
                <form class="layui-form" id="TwoForm" >
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-block">
                                <input id="resumename" class="layui-input" disabled>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">学历</label>
                            <div class="layui-input-block">
                                <input id="education" class="layui-input" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">专业</label>
                            <div class="layui-input-block">
                                <input id="resmajor" class="layui-input" disabled>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">面试轮次</label>
                            <div class="layui-input-block">
                                <input id="intnumber" class="layui-input" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">面试时间</label>
                            <div class="layui-input-block">
                                <input id="intdate" class="layui-input" disabled>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">面试状态</label>
                            <div class="layui-input-block">
                                <input  name="intstate" value="1"  title="通过" type="radio" checked>
                                <input  name="intstate" value="2"  title="未通过" type="radio">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">面试官</label>
                            <div class="layui-input-block">
                                <input name="intname" class="layui-input" style="width: 520px;">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">面试备注</label>
                        <div class="layui-input-block" style="width: 520px">
                            <textarea name="intnotes"  placeholder="请输入面试信息" class="layui-textarea" ></textarea>
                        </div>
                    </div>
                    <div<%-- style="display: none"--%>>
                        面试id<input name="intid" id="intid">
                        简历id<input id="resid">
                    </div>
                    <input type="button" class="layui-btn layui-btn-fluid" onclick="mianshi2()" value="保存" style="letter-spacing:15px;"/>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框邀请入职信息填写（Modal） -->
<div class="modal fade" id="myModal2" >
    <div class="modal-dialog" style="width: 700px;" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                    发送第二次面试邀请
                </h4>
            </div>
            <div class="modal-body">
                <form class="layui-form" id="sendForm" >
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-block">
                                <input id="resumename2" class="layui-input" disabled>
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
                                    <textarea id="notice" placeholder="请输入通知信息" class="layui-textarea" >
                                        面试通知单
                                    </textarea>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">二面时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input class="layui-input" id="test1">
                        </div>
                    </div>
                    <div style="display: none">
                        简历id<input name="resid" id="resid2">
                        面试id<input name="inoid" id="inoid2">
                    </div>
                    <input type="button" class="layui-btn layui-btn-fluid" onclick="sendmail()" value="发送邮件" style="letter-spacing:15px;"/>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>

    //添加表单属性
    layui.use(['form', 'layedit', 'laydate'], function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
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
                    tr+="<td>"+data.list[i].intnumber+"</td>";
                    tr+="<td>"+data.list[i].intdate+"</td>";
                    if(data.list[i].intname==undefined){data.list[i].intname=" ";}
                    tr+="<td>"+data.list[i].intname+"</td>";
                    if(data.list[i].intnotes==undefined){data.list[i].intnotes=" ";}
                    tr+="<td>"+data.list[i].intnotes+"</td>";
                    if(data.list[i].intdate < shijian & data.list[i].intstate==0){
                        tr+="<td style='color: red'>已过期</td>";
                        tr+="<td><button onclick='qingchu("+data.list[i].intid+")'>清除</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].intdate == shijian & data.list[i].intstate==0){
                        tr+="<td>待面试</td>";
                        tr+="<td><button data-toggle='modal' data-target='#myModal' onclick='queryOneInte("+data.list[i].intid+")'>操作</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].intdate > shijian & data.list[i].intstate==0){
                        tr+="<td>时间未到</td>";
                        tr+="<td><button>操作</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].intstate==2){
                        tr+="<td>回收站</td>";
                        tr+="<td></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].intstate==1){
                        tr+="<td>已通过</td>";
                        tr+="<td>等待审批</td>";
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
        alert(obj);
        var intstate=2;//已过期
        $.ajax({
            url: "updateInteTwoYLP",
            type: "post",
            data: {intid:obj,intstate:intstate},
            dataType: "text",
            success: function (data) {
                queryAllInteTwo(1);
            }
        })
    }
    //单个信息
    function queryOneInte(obj) {
        $.ajax({
            url: "queryOneInteTwoYLP",
            type: "post",
            data:{intid:obj},
            dataType: "json",
            success: function (data) {

                $("#intid").val(data[0].intid);
                $("#resid").val(data[0].resid);
                $("#resid2").val(data[0].resid);
                $("#intnumber").val(data[0].intnumber);
                $("#resumename").val(data[0].resumename);
                $("#resumename2").val(data[0].resumename);
                $("#phone").val(data[0].phone);
                $("#emali").val(data[0].emali);
                $("#intdate").val(data[0].intdate);
                $("#education").val(data[0].education);
                $("#resmajor").val(data[0].resmajor);
                $("#inname").val(data[0].inname);
                $("#inonotes").val(data[0].inonotes);
            }
        })
    }
    //第二次面试记录
    function mianshi2() {
        $.ajax({
            url:"updateInteTwoYLP",
            type:"post",
            data:$("#TwoForm").serialize(),
            dataType: "text",
            success:function(data) {
                if(data=="true"){alert("面试完成");}
                queryAllInteTwo(1);
                $("#myModal").modal("hide");
               // $("#TwoForm").reset();
            }
        })
    }


    //发邮件等待第二次面试
    function sendmail() {
        var inoid=$("#inoid2").val();//面试1id
        var resid=$("#resid2").val();//简历id
        var emali=$("#emali").val();//邮箱
        var notice=$("#notice").val();//内容
        var senddate=$("#senddate").val();//发送时间
        var intdate=$("#test1").val();//面试时间
        if(intdate != "" & intdate >= senddate){
            $.ajax({
                url:"addIntTwoYLP",
                type:"post",
                data:{resid:resid,intdate:intdate,intnumber:2,intstate:0,
                    inoid:inoid,inostate:2,
                    emali:emali, notice:notice},
                dataType: "text",
                success:function(data) {
                    if(data=="true"){alert("已发送邮件");}
                    queryAllInte(1);
                    $("#myModal2").modal("hide");
                }
            })
        }else {
            alert("请输入面试时间！")
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
    var min=date.getMinutes();//分
    var second=date.getSeconds();//秒
    if(min<10){ min="0"+min;}
    if(second<10){second="0"+second; }
    var shijian=year+"-"+month+"-"+day;
    $("#senddate").val(shijian);//通知时间


</script>
</html>
