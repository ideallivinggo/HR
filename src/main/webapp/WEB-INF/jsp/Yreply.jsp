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
<body>
<!-- 多条件查询  -->
<div class="layui-form" 6 style=" height: 40px; float: left; margin-top: 10px; margin-bottom: 10px;  ">
    <div class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline" style="margin: 0px">
                <select id="intstate">
                    <option value="3">待回复</option>
                    <option value="4">待报道</option>

                </select>
            </div>
            <div class="layui-inline" style="margin: 0px" >
                <input type="button" class="layui-btn" onclick="queryAllInteTwo(1)" value="查询" style="width: 100px">
            </div>
            <div class="layui-inline" style="margin-left: 800px" >
                <button class="layui-btn" onclick="inteTwoPash(4)">录取</button>
                <button class="layui-btn" onclick="inteTwoPash(0)">弃用</button>
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
        <th>面试时间</th>
        <th>分数</th>
        <th>面试官</th>
        <th>面试备注</th>
        <th>人员状态</th>
        <th>
            <input type="checkbox" onclick="selectAll(this);" title="全选" />
        </th>
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
</body>
<script>
    //添加表单属性
    layui.use(['form', 'layedit', 'laydate'], function(){ });
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
</script>
</html>
