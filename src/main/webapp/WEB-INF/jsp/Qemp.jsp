<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/12
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../assets/js/layer.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link href="../../assets/layui/css/layui.css" rel="stylesheet">
    <script type="text/javascript" src="../../assets/js/bootstrap-paginator.js"></script>
    <style>
        table tr th{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="panel panel-default" style="margin:1%">
    <div class="panel-heading">
        <h3 class="panel-title">
            <button onclick="delemp()">批量删除</button>
            <button >添加</button>
                <select id="ByType">
                    <option value="">--请选择--</option>
                    <option value="4">招聘部</option>
                    <option value="2">销售部</option>
                </select><button onclick="clickDype()">部门</button>
                <input id="name"><button onclick="ClickByName()">姓名</button>
            <select>
                <option>总经理</option>
                <option>部门主管</option>
                <option>技术员</option>
            </select><button >公司职务</button>
            <select>
                <option>全职</option>
                <option>兼职</option>
                <option>实习生</option>
            </select>员工类型
        </h3>
    </div>
    <div class="panel-body " style="height: 80%">
        <div class="table-responsive">
            <table  class="layui-table">
                <tr style="background-color: #f5f5f5">
                    <th></th>
                    <th>姓名</th>
                    <th>工号</th>
                    <th>性别</th>
                    <th>手机号</th>
                    <th>部门</th>
                    <th>职务类型id</th>
                    <th>员工类型id</th>
                    <th>当前薪资</th>
                    <th>入职日期</th>
                    <th>操作</th>
                </tr>
                <tbody id="MyBody"> </tbody>
            </table>
        </div>
    </div>

    <div class="panel-footer">
        <ul class="pagination">
            <li><a id="prepage">上一页</a></li>
            <li class="active"><span id="nowPage"></span></li>
            <li><a id="nextpage">下一页</a></li>
            共<span id="total"></span>条
            每页<span id="pageSize"></span>条
        </ul>
    </div>

</div>
</body>
</html>
<script !src="text/javascript">
$(function(){
    QQueryEmp(1);
})
function clickDype(){
    var typeVale = $("#ByType").val();
    QQueryEmp(1,typeVale,'');
}
function ClickByName() {
    var name = $("#name").val();
    QQueryEmp(1,'',name);
}

function QQueryEmp(pageNum,typeVale,name){

    $.ajax({
        url:'QqueryEmp',
        type:'post',
        data:{"pageNum":pageNum,"deptid":typeVale,"empname":name},
        dataType:"json",
        success:function(data){
            $("#MyBody").html("");
            var datalist=data.list;
            for(var i=0;i<datalist.length;i++)
            {
                var tr="<tr>";
                tr+="<th><input type='checkbox' name='check' value='"+datalist[i].empid+"'></th>";
                tr+="<th><a onclick='QqueryOneEmp("+datalist[i].empid+")' >"+datalist[i].empname+"</a></th>";
                tr+="<th>"+datalist[i].empnumber+"</th>";
                tr+="<th>"+datalist[i].sex+"</th>";
                tr+="<th>"+datalist[i].phone+"</th>";
                tr+="<th>"+datalist[i].deptname+"</th>";
                tr+="<th>"+datalist[i].posname+"</th>";
                tr+="<th>"+datalist[i].emptype+"</th>";
                tr+="<th>"+datalist[i].emppay+"</th>";
                tr+="<th>"+datalist[i].empstatedate+"</th>";
                tr+="</tr>";
                    $("#MyBody").append(tr);
            }
            $("#nowPage").html(data.pageNum);
            var currentPage = data.total; //总条数
            var pageCount = data.pageSize; //总页数
            $("#total").html(currentPage);
            $("#pageSize").html(pageCount);
        }
})
}
function delemp() {
    var empid = document.getElementsByName("check");
    var ids = "";
    for(var i = 0;i<empid.length;i++){
        if(empid[i].checked){
            ids+=empid[i].value+",";
        }
    }
    deleteEmpById(ids);
}
function deleteEmpById(ids){
    alert(ids)
    $.ajax({
        url:'DelEmpYqx',
        type:'post',
        data:{"s":ids},
        dataType:'text',
        success:function (data) {
            alert(data)
            QQueryEmp(1);
        }
    })

}
$("#prepage").click(function(){
    //得到下一页的页码
    var nowPage=parseInt($("#nowPage").html());
    QQueryEmp(nowPage-1);
})
$("#nextpage").click(function(){
    //得到下一页的页码
    var nowPage=parseInt($("#nowPage").html());
    QQueryEmp(nowPage+1);
})
    function QqueryOneEmp(obj) {
        alert(obj)
        $.ajax({
            url:'QqueryEmpIf',
            type:'post',
            data:{"empid":obj},
            dataType:'json',
            success:function (data) {
                window.location.href="QoneEmp"
            }
        })
    }

</script>

