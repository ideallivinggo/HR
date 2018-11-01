<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-10-20
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>第一次面试</title>
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

    #miantab td{
        width: 150px;
    }
    #miantab tr{
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
    <div class="layui-form" >
        <div class="layui-form-item">
            <div class="layui-inline" style="margin: 0px">
                <select id="inostate">
                    <option value="0">待面试</option>
                    <option value="1">已通过</option>
                    <option value="2">回收站</option>
                </select>
            </div>
            <div class="layui-inline" style="margin: 0px" >
                <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="queryAllInte(1)"><i class="layui-icon">&#xe615;</i></button>
            </div>
            <div class="layui-inline" style="margin-left: 300px; font-size: 28px;color: #000;" >
                第一轮面试人员
            </div>
            <div class="layui-inline" style="margin-left: 350px;" >
                <a href="Yinterviewtwo"><button class="layui-btn">查看第二轮面试</button></a>
            </div>
        </div>
    </div>
</div>

<!--table表格-->
<div class="panel-body">
    <div class="table-responsive">
        <table class="layui-table">
            <%--<colgroup>
                <col width="100">
            </colgroup>--%>
            <thead>
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
                <th>面试状态</th>
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


<!-- 模态框查询面试信息填写（Modal） -->
<div class="modal fade" id="myModal" >
    <div class="modal-dialog" style="width: 1000px;margin-bottom: 80px" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                    第一次面试信息填写
                </h4>
            </div>
            <div class="modal-body">
                <form class="layui-form" id="inteForm" >

                    <p style="text-align: center;font-size: 28px;color: #000;margin-top: 20px;">第一次面试表 </p>

                    <table border="1" style="margin: 10px auto;text-align: center; border-collapse:collapse;"  id="miantab">
                        <tr>
                            <td>姓名：</td>
                            <td><input class="inputss" id="resumename" readOnly></td>
                            <td>性别：</td>
                            <td><input class="inputss" id="sex" readOnly></td>
                            <td>年龄：</td>
                            <td><input class="inputss" id="age" readOnly></td>
                        </tr>
                        <tr>
                            <td>心仪职位：</td>
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
                            <td colspan="3" onclick="dian()">
                                <input type="radio" class="one" value="5" title="优秀" name="one">
                                <input type="radio" class="one" value="4" title="很好" name="one">
                                <input type="radio" class="one" value="3" title="较好" name="one">
                                <input type="radio" class="one" value="2" title="一般" name="one">
                                <input type="radio" class="one" value="1" title="较差" name="one">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">2：语言表达能力</td>
                            <td colspan="3" onclick="dian()">
                                <input type="radio" class="two" value="5" title="优秀" name="two">
                                <input type="radio" class="two" value="4" title="很好" name="two">
                                <input type="radio" class="two" value="3" title="较好" name="two">
                                <input type="radio" class="two" value="2" title="一般" name="two">
                                <input type="radio" class="two" value="1" title="较差" name="two">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">3：亲和力</td>
                            <td colspan="3" onclick="dian()">
                                <input type="radio" class="three" value="5" title="优秀" name="three">
                                <input type="radio" class="three" value="4" title="很好" name="three">
                                <input type="radio" class="three" value="3" title="较好" name="three">
                                <input type="radio" class="three" value="2" title="一般" name="three">
                                <input type="radio" class="three" value="1" title="较差" name="three">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">4：诚实度</td>
                            <td colspan="3" onclick="dian()">
                                <input type="radio" class="four" value="5" title="优秀" name="four">
                                <input type="radio" class="four" value="4" title="很好" name="four">
                                <input type="radio" class="four" value="3" title="较好" name="four">
                                <input type="radio" class="four" value="2" title="一般" name="four">
                                <input type="radio" class="four" value="1" title="较差" name="four">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">5：时间观念</td>
                            <td colspan="3" onclick="dian()">
                                <input type="radio" class="five" value="5" title="优秀" name="five">
                                <input type="radio" class="five" value="4" title="很好" name="five">
                                <input type="radio" class="five" value="3" title="较好" name="five">
                                <input type="radio" class="five" value="2" title="一般" name="five">
                                <input type="radio" class="five" value="1" title="较差" name="five">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">6：逻辑思维</td>
                            <td colspan="3" onclick="dian()">
                                <input type="radio" class="six" value="5" title="优秀" name="six">
                                <input type="radio" class="six" value="4" title="很好" name="six">
                                <input type="radio" class="six" value="3" title="较好" name="six">
                                <input type="radio" class="six" value="2" title="一般" name="six">
                                <input type="radio" class="six" value="1" title="较差" name="six">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">7：应变能力</td>
                            <td colspan="3" onclick="dian()">
                                <input type="radio" class="seven" value="5" title="优秀" name="seven">
                                <input type="radio" class="seven" value="4" title="很好" name="seven">
                                <input type="radio" class="seven" value="3" title="较好" name="seven">
                                <input type="radio" class="seven" value="2" title="一般" name="seven">
                                <input type="radio" class="seven" value="1" title="较差" name="seven">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">8：人格成熟程度</td>
                            <td colspan="3" onclick="dian()">
                                <input type="radio" class="eight" value="5" title="优秀" name="eight">
                                <input type="radio" class="eight" value="4" title="很好" name="eight">
                                <input type="radio" class="eight" value="3" title="较好" name="eight">
                                <input type="radio" class="eight" value="2" title="一般" name="eight">
                                <input type="radio" class="eight" value="1" title="较差" name="eight">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">9：判断分析能力</td>
                            <td colspan="3" onclick="dian()">
                                <input type="radio" class="nine" value="5" title="优秀" name="nine">
                                <input type="radio" class="nine" value="4" title="很好" name="nine">
                                <input type="radio" class="nine" value="3" title="较好" name="nine">
                                <input type="radio" class="nine" value="2" title="一般" name="nine">
                                <input type="radio" class="nine" value="1" title="较差" name="nine">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">10：自我认识能力</td>
                            <td colspan="3" onclick="dian()">
                                <input type="radio" class="ten" value="5" title="优秀" name="ten">
                                <input type="radio" class="ten" value="4" title="很好" name="ten">
                                <input type="radio" class="ten" value="3" title="较好" name="ten">
                                <input type="radio" class="ten" value="2" title="一般" name="ten">
                                <input type="radio" class="ten" value="1" title="较差" name="ten">
                            </td>
                        </tr>
                        <tr>
                            <td>是否通过：</td>
                            <td colspan="2">
                                <input name="inostate" value="1" title="通过" type="radio">
                                <input name="inostate" value="2" title="不通过" type="radio">
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
                            <td colspan="2"><input name="inname" class="inputss" id="inname" style="border-bottom: 1px solid #000000"></td>
                        </tr>
                    </table>
                    <div style="display: none">
                        面试id<input name="inoid" id="inoid">
                        简历id<input id="resid">
                    </div>

                    <input type="reset" class="layui-btn layui-btn-fluid" onclick="mianshi()" value="保存" style="letter-spacing:15px;"/>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 模态框发送第二次面试邀请信息填写（Modal） -->
<div class="modal fade" id="myModal2" >
    <div class="modal-dialog" style="width: 800px;" >
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
                                    <textarea id="notice" placeholder="请输入通知信息" class="layui-textarea" rows="8">
你好，我这边是新乡睿智科技有限公司，在网上收到你投递的简历，现给你安排面试，请回复邮件，谢谢！
面试通知单
你好，经过初步面试筛选，你符合应聘的基本符合要求。如果对于岗位有兴趣，可以回复邮件，可以在规定时间内前报道，前往公司参加面试和笔试。携带个人简历一份。
公司地址：新乡红旗区北三环大学生创业园区
电话：8888888 徐酱酱 15837389710；
                                    </textarea>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">二面时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                            <input class="layui-input" id="test1" placeholder="yyyy-MM-dd HH:mm:ss">
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
</div>
</body>
<script>

    //添加表单属性
    layui.use(['form', 'layedit', 'laydate'], function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#test1'
            ,type: 'datetime'
        });
    });
    //自动查询
    $(function(){
        queryAllInte(1);
        //$("#myModal").modal("show");//模态框开启
    });

    //查看面试
    function queryAllInte(pageNum) {
        var inostate=$("#inostate").val();
        $.ajax({
            url: "queryAllInteYLP",
            type: "post",
            data:{inostate:inostate, pageNum:pageNum},
            dataType: "json",
            async:false,
            success: function (data) {
                $("#mytab").html("");
                for ( var i = 0; i < data.list.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data.list[i].inoid+"</td>";
                    tr+="<td>"+data.list[i].resumename+"</td>";
                    tr+="<td>"+data.list[i].sex+"</td>";
                    tr+="<td>"+data.list[i].age+"</td>";
                    tr+="<td>"+data.list[i].education+"</td>";
                    tr+="<td>"+data.list[i].resmajor+"</td>";
                    tr+="<td>"+data.list[i].resposition+"</td>";
                    tr+="<td>"+data.list[i].inodate+"</td>";
                    if(data.list[i].inograde==undefined){data.list[i].inograde=" ";}
                    tr+="<td>"+data.list[i].inograde+"</td>";
                    if(data.list[i].inname==undefined){data.list[i].inname=" ";}
                    tr+="<td>"+data.list[i].inname+"</td>";
                    if(data.list[i].inonotes==undefined){data.list[i].inonotes=" ";}
                    tr+="<td>"+data.list[i].inonotes+"</td>";
                    if(data.list[i].inodate < shijian & data.list[i].inostate==0){
                        tr+="<td style='color: red'>已过期</td>";
                        tr+="<td><button onclick='qingchu("+data.list[i].inoid+","+data.list[i].resid+")'>清除</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].inodate == shijian & data.list[i].inostate==0){
                        tr+="<td>待面试</td>";
                        tr+="<td><button data-toggle='modal' data-target='#myModal' onclick='queryOneInte("+data.list[i].inoid+")'>面试</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].inodate > shijian & data.list[i].inostate==0){
                        tr+="<td>时间未到</td>";
                        tr+="<td><button>操作</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].inostate==2){
                        tr+="<td>回收站</td>";
                        tr+="<td></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].inostate==1){
                        tr+="<td>已通过</td>";
                        tr+="<td><button data-toggle='modal' data-target='#myModal2' onclick='queryOneInte("+data.list[i].inoid+")'>面试邀请</button></td>";
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
    function qingchu(obj1,obj2) {
        var inostate=2;//已过期
        var resstate=3;//简历回收站
       $.ajax({
            url: "updateInteYLP",
            type: "post",
            data: {inoid:obj1,inostate:inostate, resstate:resstate, s:obj2},
            dataType: "text",
            success: function (data) {
                queryAllInte(1);
            }
        })
    }
    //单个信息
    function queryOneInte(obj) {

        $.ajax({
            url: "queryOneInteYLP",
            type: "post",
            data:{inoid:obj},
            dataType: "json",
            success: function (data) {
                $("#resumename").val(data[0].resumename);
                $("#sex").val(data[0].sex);
                $("#age").val(data[0].age);
                $("#resposition").val(data[0].resposition);
                $("#education").val(data[0].education);
                $("#resmajor").val(data[0].resmajor);
                $("#inoid").val(data[0].inoid);
                $("#resid").val(data[0].resid);
                $("#inodate").val(data[0].inodate);

                $("#resumename2").val(data[0].resumename);
                $("#emali").val(data[0].emali);
                $("#phone").val(data[0].phone);
                $("#inoid2").val(data[0].inoid);
                $("#resid2").val(data[0].resid);
            }
        })
    }


    //获取到所有的被选中的复选框计算分数
    function dian() {

        $(".one").each(function(){
            if($(this).prop("checked")==true){   one = $(this).val();  }
        });
        $(".two").each(function(){
            if($(this).prop("checked")==true){   two = $(this).val();  }
        });
       $(".three").each(function(){
            if($(this).prop("checked")==true){   three = $(this).val();  }
        });
        $(".four").each(function(){
            if($(this).prop("checked")==true){   four = $(this).val();  }
        });
        $(".five").each(function(){
            if($(this).prop("checked")==true){   five = $(this).val();  }
        });
        $(".six").each(function(){
            if($(this).prop("checked")==true){   six = $(this).val();  }
        });
        $(".seven").each(function(){
            if($(this).prop("checked")==true){   seven = $(this).val();  }
        });
        $(".eight").each(function(){
            if($(this).prop("checked")==true){   eight = $(this).val();  }
        });
        $(".nine").each(function(){
            if($(this).prop("checked")==true){   nine = $(this).val();  }
        });
        $(".ten").each(function(){
            if($(this).prop("checked")==true){   ten = $(this).val();  }
        });
       var fen = Number(one) + Number(two)+Number(three)+Number(four)+Number(five)+Number(six)+Number(seven)+Number(eight)+Number(nine)+Number(ten);
       $("#inograde").val(fen)
    }


    //面试记录
    function mianshi() {
        var resid=$("#resid").val();//id
        var resstate=3;//简历回收站
        $.ajax({
            url:"updateInteYLP?s="+resid+"&resstate="+resstate,
            type:"post",
            data:$("#inteForm").serialize(),
            dataType: "text",
            success:function(data) {


                queryAllInte(1);
                $("#myModal").modal("hide");
                if(data=="true"){alert("面试完成");}
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
        if(intdate == "") {
            alert("请输入面试时间！")
        }else if(intdate <= senddate){
            alert("面试时间不能小于当前时间！")
        }else {
            $.ajax({
                url:"addIntTwoYLP",
                type:"post",
                data:{resid:resid,intdate:intdate,intstate:0,//添加第二次面试
                    inoid:inoid,inostate:2,//第一次面试加入回收站
                    emali:emali, notice:notice},
                dataType: "text",
                success:function(data) {
                    if(data=="true"){alert("已发送邮件");}
                    queryAllInte(1);
                    $("#myModal2").modal("hide");
                }
            })
        }
    }





    $("#prepage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllInte(nowPage-1);
    });
    $("#nextpage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllInte(nowPage+1);
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
    var shijian=year+"-"+month+"-"+day;//面试对比当前时间
    var senddate=year+"-"+month+"-"+day+" "+hour+":"+min+":"+second;//发送时间
    $("#senddate").val(senddate);//面试时间


</script>
</html>

