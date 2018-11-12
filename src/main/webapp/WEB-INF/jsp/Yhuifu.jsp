<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-10-24
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>录用回复</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../assets/css/bootstrap.css" type="text/css">
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
</head>
<style>
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
        <div class="layui-form" >
        <div class="layui-form-item">
            <div class="layui-inline" style="margin: 0px">
                <select id="intstate">
                    <option value="3">待回复</option>
                    <option value="4">待报道</option>

                </select>
            </div>
            <div class="layui-inline" style="margin: 0px" >
                <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="queryAllInteTwo(1)"><i class="layui-icon">&#xe615;</i></button>
            </div>
            <div class="layui-inline" style="margin-left: 750px" >
                <button class="layui-btn" onclick="inteTwoPash(4)">录取</button>
                <button class="layui-btn" onclick="inteTwoPash(0)">弃用</button>
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
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>学历</th>
                    <th>专业</th>
                    <th>应聘职位</th>
                    <th>面试时间</th>
                    <th>分数</th>
                    <th>面试官</th>
                    <th>面试备注</th>
                    <th>人员状态</th>
                    <th>
                        <input type="checkbox" onclick="selectAll(this);" title="全选" />操作
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

    <!-- 模态详情（Modal） -->
    <div class="modal fade" id="myModal" >
        <div class="modal-dialog"  style="width: 1000px;margin-bottom: 80px" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                        员工面试记录
                    </h4>
                </div>
                <div class="modal-body">

                    <form class="layui-form" id="TwoForm" >
                    <table border="1" style="margin: 10px auto;text-align: center; border-collapse:collapse;"  class="miantab">
                        <tr style="height: 45px;">
                            <td>姓名：</td>
                            <td><input class="inputss" id="resumename" readOnly></td>
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
    layui.use(['form', 'layedit', 'laydate','element'], function(){
        var element = layui.element;
    });
    //自动查询
    $(function(){
        queryAllInteTwo(1);
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
                    tr+="<td data-toggle='modal' data-target='#myModal' onclick='details("+data.list[i].intid+")'>"+data.list[i].intid+"</td>";
                    tr+="<td data-toggle='modal' data-target='#myModal' onclick='details("+data.list[i].intid+")'>"+data.list[i].resumename+"</td>";
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
                        tr+="<td>待回复</td>";
                        tr+="<td><input class='intid' type='checkbox' value='"+data.list[i].intid+"' /></td>";
                        tr+="</tr>";
                    }
                    if(data.list[i].intstate==4){
                        tr+="<td>待报到</td>";
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
    //全选
    function selectAll(checkbox) {
        $('input[type=checkbox]').prop('checked', $(checkbox).prop('checked'));
    }
    //筛选录用
    function inteTwoPash(obj) {
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
            data:{intstate:obj,s:str},
            dataType:"text",
            success:function(data){
                if(data=="true"){alert("回复成功！");}
                queryAllInteTwo(1);
            }
        });
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
            url: "queryAllInteTwoYLP",
            type: "post",
            data:{intid:obj,pageNum:1},
            dataType: "json",
            success: function (data) {
                var data = data.list;
                $("#resumename").val(data[0].resumename);
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


</script>
</html>
