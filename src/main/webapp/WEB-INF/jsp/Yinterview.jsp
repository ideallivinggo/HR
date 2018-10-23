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
    <title>面试</title>
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
                <select id="inostate">
                    <option value="0">待面试</option>
                    <option value="1">已通过</option>
                    <option value="2">未通过</option>
                    <option value="3">已过期</option>
                </select>
            </div>
            <div class="layui-inline" style="margin: 0px" >
                <input type="button" class="layui-btn" onclick="queryAllInte(1)" value="查询" style="width: 100px">
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


<!-- 模态框查询发送邮件（Modal） -->
<div class="modal fade" id="myModal" >
    <div class="modal-dialog" style="width: 700px;" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                    面试信息填写
                </h4>
            </div>
            <div class="modal-body">
                <form class="layui-form" id="inteForm" >
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
                                <input id="inonumber" class="layui-input" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">面试时间</label>
                            <div class="layui-input-block">
                                <input id="inodate" class="layui-input" disabled>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">面试状态</label>
                            <div class="layui-input-block">
                                <input  name="inostate" value="1"  title="通过" type="radio" checked>
                                <input  name="inostate" value="2"  title="未通过" type="radio">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">面试官</label>
                            <div class="layui-input-block">
                                <input name="inname" class="layui-input" style="width: 520px;">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">面试备注</label>
                        <div class="layui-input-block" style="width: 520px">
                                    <textarea name="inonotes"  placeholder="请输入面试信息" class="layui-textarea" ></textarea>
                        </div>
                    </div>
                    <div <%--style="display: none"--%>>
                        面试id<input name="inoid" id="inoid">
                        简历id<input id="resid">
                    </div>

                    <input type="button" class="layui-btn layui-btn-fluid" onclick="mianshi()" value="保存" style="letter-spacing:15px;"/>
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
                    tr+="<td>"+data.list[i].inonumber+"</td>";
                    tr+="<td>"+data.list[i].inodate+"</td>";
                    if(data.list[i].inonotes==undefined){data.list[i].inonotes=" ";}
                    tr+="<td>"+data.list[i].inonotes+"</td>";
                    if(data.list[i].inname==undefined){data.list[i].inname=" ";}
                    tr+="<td>"+data.list[i].inname+"</td>";
                    if(data.list[i].inodate < shijian & data.list[i].inostate==0){
                        tr+="<td style='color: red'>已过期</td>";
                        tr+="<td><button onclick='qingchu("+data.list[i].inoid+","+data.list[i].resid+")'>清除</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].inodate == shijian & data.list[i].inostate==0){
                        tr+="<td>待面试</td>";
                        tr+="<td><button data-toggle='modal' data-target='#myModal' onclick='queryOneInte("+data.list[i].inoid+")'>操作</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].inodate > shijian & data.list[i].inostate==0){
                        tr+="<td>时间未到</td>";
                        tr+="<td><button>操作</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].inostate==2) {
                        tr+="<td>未通过</td>";
                        tr+="<td><button onclick='gua("+data.list[i].inoid+")'>清除1</button></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].inostate==3){
                        tr+="<td>已过期</td>";
                        tr+="<td></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].inostate==1){
                        tr+="<td>已通过</td>";
                        tr+="<td><button data-toggle='modal' data-target='#myModal' onclick='queryOneRes("+data.list[i].inoid+")'>操作</button></td>";
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
        var inostate=3;//已过期
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
                $("#inoid").val(data[0].inoid);
                $("#resid").val(data[0].resid);
                $("#inonumber").val(data[0].inonumber);
                $("#resumename").val(data[0].resumename);
                $("#inodate").val(data[0].inodate);
                $("#education").val(data[0].education);
                $("#resmajor").val(data[0].resmajor);
                $("#inname").val(data[0].inname);
                $("#inonotes").val(data[0].inonotes);

            }
        })
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
                if(data=="true"){alert("面试成功");}
                queryAllInte(1);
                $("#myModal").modal("hide");
            }
        })

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
    if(min<10){ min="0"+min;}
    if(second<10){second="0"+second; }
    var shijian=year+"-"+month+"-"+day;
    $("#senddate").val(shijian);//通知时间


</script>
</html>

