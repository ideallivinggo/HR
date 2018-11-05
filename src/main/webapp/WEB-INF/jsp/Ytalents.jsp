<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-10-19
  Time: 20:08
  To change this template use File | Settings | File Templates.
  简历库
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>简历库</title>
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
    <div class="layui-form" >
        <div class="layui-form-item">
            <div class="layui-inline" style="margin: 0px">
                <select id="education" >
                    <option value="">学历不限</option>
                    <option value="小学">小学</option>
                    <option value="初中">初中</option>
                    <option value="高中">高中</option>
                    <option value="大专">大专</option>
                    <option value="本科">本科</option>
                    <option value="博士">博士</option>
                </select>
            </div>
            <div class="layui-inline" style="margin: 0px">
                <select id="sex" >
                    <option value="">性别不限</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <div class="layui-inline" style="margin: 0px">
                <select id="resstate" >
                    <option value="1">已入库</option>
                    <option value="2">待面试</option>
                    <option value="3">回收站</option>
                </select>
            </div>
            <div class="layui-inline" style="margin: 0px" >
                <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="queryAllRes(1)"><i class="layui-icon">&#xe615;</i></button>
            </div>
        </div>
    </div>
</div>

<!--table表格-->
<div class="panel-body ">
    <div class="table-responsive">
        <table  class="layui-table">
           <%-- <colgroup>
                <col width="50">
            </colgroup>--%>
            <thead>
            <tr>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>手机号</th>
                <th>QQ邮箱</th>
                <th>学历</th>
                <th>专业</th>
                <th>心仪职位</th>
                <th>录入时间</th>
                <th>简历状态</th>
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


<!-- 模态框查询发送邮件（Modal） -->
<div class="modal fade" id="myModal" >
    <div class="modal-dialog" style="width: 700px;" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                    发送第一次面试邀请
                </h4>
            </div>
            <div class="modal-body">
                <div class="content">
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
                                    <textarea id="notice" placeholder="请输入通知信息" class="layui-textarea" rows="8">
你好，我这边是新乡睿智科技有限公司，在网上收到你投递的简历，现给你安排面试，请回复邮件，谢谢！
面试通知单
你好，经过初步简历筛选，你符合应聘的基本符合要求。如果对于岗位有兴趣，可以回复邮件，可以在规定时间内前报道，前往公司参加面试和笔试。携带个人简历一份。
公司地址：新乡红旗区北三环大学生创业园区
电话：8888888 徐酱酱 15837389710；
                                    </textarea>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">面试时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <input class="layui-input" id="test1" placeholder="yyyy-MM-dd HH:mm:ss">
                            </div>

                        </div>
                        <div style="display: none">
                            简历id<input name="resid" id="resid">
                        </div>

                        <input type="button" class="layui-btn layui-btn-fluid" onclick="sendmail()" value="发送邮件" style="letter-spacing:15px;"/>

                    </form>
                </div>
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
        //执行一个laydate实例
        //日期时间选择器
        laydate.render({
            elem: '#test1'
            ,type: 'datetime'
        });
    });
    //自动查询
    $(function(){
        queryAllRes(1);
        //$("#myModal").modal("show");//模态框开启
    });

    //查看所有简历
    function queryAllRes(pageNum) {
        var xueli=$("#education").val();
        var xingbie=$("#sex").val();
        var state=$("#resstate").val();
        $.ajax({
            url: "queryAllResYLP",
            type: "post",
            data:{resstate:state,education:xueli,sex:xingbie,pageNum:pageNum},
            dataType: "json",
            async:false,
            success: function (data) {
                $("#mytab").html("");
                for ( var i = 0; i < data.list.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data.list[i].resid+"</td>";
                    tr+="<td>"+data.list[i].resumename+"</td>";
                    tr+="<td>"+data.list[i].sex+"</td>";
                    tr+="<td>"+data.list[i].age+"</td>";
                    tr+="<td>"+data.list[i].phone+"</td>";
                    tr+="<td>"+data.list[i].emali+"</td>";
                    tr+="<td>"+data.list[i].education+"</td>";
                    tr+="<td>"+data.list[i].resmajor+"</td>";
                    tr+="<td>"+data.list[i].resposition+"</td>";
                    tr+="<td>"+data.list[i].resdate+"</td>";
                    if(+data.list[i].resstate==0){data.list[i].resstate="未筛选"}
                    if(+data.list[i].resstate==1){data.list[i].resstate="已入库"}

                    if(+data.list[i].resstate==3){data.list[i].resstate="回收站"}
                    if(+data.list[i].resstate==2){
                        tr+="<td>待面试</td>";
                        tr+="<td></td>";
                    }else {
                        tr+="<td>"+data.list[i].resstate+"</td>";
                        tr+="<td><button data-toggle='modal' data-target='#myModal' onclick='queryOneRes("+data.list[i].resid+")'>发送邮件</button></td>";
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
    //查看单个简历
    function queryOneRes(obj) {
        $.ajax({
            url: "queryOneRes",
            type: "post",
            data:{resid:obj},
            dataType: "json",
            success: function (data) {
                $("#resid").val(data[0].resid)
                $("#resumename").val(data[0].resumename)
                $("#emali").val(data[0].emali)
                $("#phone").val(data[0].phone)
            }
        })
    }
    //发邮件等待第一次面试
    function sendmail() {
        var resid=$("#resid").val();//id
        var emali=$("#emali").val();//邮箱
        var notice=$("#notice").val();//内容
        var senddate=$("#senddate").val();//发送时间
        var inodate=$("#test1").val();//面试时间
        if(inodate == "") {
            alert("请输入面试时间！")
        }else if(inodate <= senddate){
            alert("面试时间不能小于当前时间！")
        }else {
           $.ajax({
                url:"addIntoneYLP",
                type:"post",
                data:{resid:resid, inodate:inodate, inostate:0,//添加面试
                    resstate:2, s:resid,//修改简历状态
                    emali:emali, notice:notice},//发送邮件
                dataType: "text",
                success:function(data) {
                    if(data=="true"){alert("已发送邮件");}
                    queryAllRes(1);
                    $("#myModal").modal("hide");
                }
            })
        }
    }




    $("#prepage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllRes(nowPage-1);
    });
    $("#nextpage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllRes(nowPage+1);
    });

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
    var shijian=year+"-"+month+"-"+day+" "+hour+":"+min+":"+second;//当前时间
    $("#senddate").val(shijian);//通知时间


</script>
</html>
