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
    #miantab td{
        width: 130px;
    }
    .inputss{
        width: 90%;
        height: 99%;
        border: 0px solid ;
        padding-left: 10px;
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
            <p style="text-align: center;font-size: 28px;color: #000;margin-top: -45px;">第二轮面试人员 </p>
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
    <div class="modal-dialog"  style="width: 900px;margin-bottom: 80px" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                    第二次面试信息填写
                </h4>
            </div>
            <div class="modal-body">
                <form class="layui-form" id="TwoForm" >
                    <p style="text-align: center;font-size: 28px;color: #000;margin-top: 20px;">第二次面试表 </p>

                    <table border="1" style="margin: 10px auto;text-align: center; border-collapse:collapse;"  id="miantab">
                        <tr style="height: 45px;">
                            <td>姓名：</td>
                            <td><input class="inputss" id="resumename" readOnly></td>
                            <td>性别：</td>
                            <td><input class="inputss" id="sex" readOnly></td>
                            <td>年龄：</td>
                            <td><input class="inputss" id="age" readOnly></td>
                        </tr>
                        <tr style="height: 45px;">
                            <td>心仪职位：</td>
                            <td><input class="inputss" id="resposition" readOnly></td>
                            <td>学历：</td>
                            <td><input class="inputss" id="education" readOnly></td>
                            <td>所学专业：</td>
                            <td><input class="inputss" id="resmajor" readOnly></td>
                        </tr>
                        <tr style="height: 40px;">

                            <td colspan="3">评分标准（35分以上考虑）</td>
                            <td colspan="3">
                                5优秀&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                4很好&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                3较好&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                2一般&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                1较差
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td rowspan="10">相关的工作经验及专业知识</td>
                            <td colspan="2">1：工作经验</td>
                            <td colspan="3">
                                <input type="checkbox" class="one" value="5" title="5">
                                <input type="checkbox" class="one" value="4" title="4">
                                <input type="checkbox" class="one" value="3" title="3">
                                <input type="checkbox" class="one" value="2" title="2">
                                <input type="checkbox" class="one" value="1" title="1">
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td colspan="2">掌握的专业知识</td>
                            <td colspan="3">
                                <input type="checkbox" class="two" value="5" title="5">
                                <input type="checkbox" class="two" value="4" title="4">
                                <input type="checkbox" class="two" value="3" title="3">
                                <input type="checkbox" class="two" value="2" title="2">
                                <input type="checkbox" class="two" value="1" title="1">
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td colspan="2">3：对企业的价值</td>
                            <td colspan="3">
                                <input type="checkbox" class="three" value="5" title="5">
                                <input type="checkbox" class="three" value="4" title="4">
                                <input type="checkbox" class="three" value="3" title="3">
                                <input type="checkbox" class="three" value="2" title="2">
                                <input type="checkbox" class="three" value="1" title="1">
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td colspan="2">4：个人工作观念</td>
                            <td colspan="3">
                                <input type="checkbox" class="four" value="5" title="5">
                                <input type="checkbox" class="four" value="4" title="4">
                                <input type="checkbox" class="four" value="3" title="3">
                                <input type="checkbox" class="four" value="2" title="2">
                                <input type="checkbox" class="four" value="1" title="1">
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td colspan="2">5：学习能力</td>
                            <td colspan="3">
                                <input type="checkbox" class="five" value="5" title="5">
                                <input type="checkbox" class="five" value="4" title="4">
                                <input type="checkbox" class="five" value="3" title="3">
                                <input type="checkbox" class="five" value="2" title="2">
                                <input type="checkbox" class="five" value="1" title="1">
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td colspan="2">6：工作创造能力</td>
                            <td colspan="3">
                                <input type="checkbox" class="six" value="5" title="5">
                                <input type="checkbox" class="six" value="4" title="4">
                                <input type="checkbox" class="six" value="3" title="3">
                                <input type="checkbox" class="six" value="2" title="2">
                                <input type="checkbox" class="six" value="1" title="1">
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td colspan="2">7：对企业的忠诚度</td>
                            <td colspan="3">
                                <input type="checkbox" class="seven" value="5" title="5">
                                <input type="checkbox" class="seven" value="4" title="4">
                                <input type="checkbox" class="seven" value="3" title="3">
                                <input type="checkbox" class="seven" value="2" title="2">
                                <input type="checkbox" class="seven" value="1" title="1">
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td colspan="2">8：职位胜任能力</td>
                            <td colspan="3">
                                <input type="checkbox" class="eight" value="5" title="5">
                                <input type="checkbox" class="eight" value="4" title="4">
                                <input type="checkbox" class="eight" value="3" title="3">
                                <input type="checkbox" class="eight" value="2" title="2">
                                <input type="checkbox" class="eight" value="1" title="1">
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td colspan="2">9：个性特征与企业文化的相融性</td>
                            <td colspan="3">
                                <input type="checkbox" class="nine" value="5" title="5">
                                <input type="checkbox" class="nine" value="4" title="4">
                                <input type="checkbox" class="nine" value="3" title="3">
                                <input type="checkbox" class="nine" value="2" title="2">
                                <input type="checkbox" class="nine" value="1" title="1">
                            </td>
                        </tr>
                        <tr style="height: 40px;">
                            <td colspan="2">10：稳定性、发展潜力</td>
                            <td colspan="3">
                                <input type="checkbox" class="ten" value="5" title="5">
                                <input type="checkbox" class="ten" value="4" title="4">
                                <input type="checkbox" class="ten" value="3" title="3">
                                <input type="checkbox" class="ten" value="2" title="2">
                                <input type="checkbox" class="ten" value="1" title="1">
                            </td>
                        </tr>
                        <tr style="height: 45px;">
                            <td>点击计分：</td>
                            <td colspan="2">
                                <input name="intgrade" onfocus="dian()" class="inputss" id="intgrade" readonly >
                            </td>
                            <td>是否录取：</td>
                            <td colspan="2">
                                <input name="intstate" value="1" title="通过" type="radio">
                                <input name="intstate" value="2" title="不通过" type="radio">
                            </td>
                        </tr>

                        <tr style="height: 100px;">
                            <td colspan="2">面试批语</td>
                            <td colspan="4">
                                <textarea name="intnotes" id="intnotes" class="layui-textarea">
                                </textarea>
                            </td>
                        </tr>
                        <tr style="height: 45px;">
                            <td>面试时间</td>
                            <td colspan="2"><input name="intdate" class="inputss" id="intdate"></td>
                            <td>面试官</td>
                            <td colspan="2"><input name="intname" class="inputss" id="intname" style="border-bottom: 1px solid #000000"></td>
                        </tr>
                    </table>
                    <div style="display: none">
                        面试id<input name="intid" id="intid">
                        简历id<input name="resid" id="resid">
                    </div>
                    <input type="reset" class="layui-btn layui-btn-fluid" onclick="mianshi()" value="保存" style="letter-spacing:15px;"/>
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
                    tr+="<td>"+data.list[i].intdate+"</td>";
                    if(data.list[i].intgrade==undefined){data.list[i].intgrade=" ";}
                    tr+="<td>"+data.list[i].intgrade+"</td>";
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
                        tr+="<td>等待推送</td>";
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
                $("#resumename").val(data[0].resumename);
                $("#sex").val(data[0].sex);
                $("#age").val(data[0].age);
                $("#resposition").val(data[0].resposition);
                $("#education").val(data[0].education);
                $("#resmajor").val(data[0].resmajor);
                $("#intid").val(data[0].intid);
                $("#resid").val(data[0].resid);
                $("#intdate").val(data[0].intdate);
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
        $("#intgrade").val(fen);
    }

    //第二次面试记录
    function mianshi() {
        $.ajax({
            url:"updateInteTwoYLP",
            type:"post",
            data:$("#TwoForm").serialize(),
            dataType: "text",
            success:function(data) {
                if(data=="true"){alert("面试完成");}
                queryAllInteTwo(1);
                $("#myModal").modal("hide");
            }
        })
    }


    //发邮件等待录取
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
                data:{resid:resid,intdate:intdate,intstate:0,
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
