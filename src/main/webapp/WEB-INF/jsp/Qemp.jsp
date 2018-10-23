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
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
    <script type="text/javascript" src="../../assets/js/bootstrap-paginator.js"></script>
    <style>
        table tr th{
            text-align: center;
        }
       .panel-heading div input{
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        }
    </style>
</head>
<body>

<div class="panel panel-default" style="margin:1%">
    <div class="panel-heading" style="height:50px;">
        <div class="layui-form">
            <div  class="layui-inline">
                <input id="name" style="width: 200px;height: 37px;border: 1px solid #e6e6e6;font-size: 16px;">
            </div>
            <div class="layui-inline">
                <button  style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="ClickByName()"><i class="layui-icon">&#xe615;</i></button>
            </div>
            <div class="layui-inline" style="padding-left: 50px;">
                <select id="ByType"  class="select">
                    <option value="">--部门--</option>
                    <%--<option value="4"><span id="aaa"></span></option>
                    <option value="2"><span id="bbb"></span></option>--%>
                </select>
            </div>
            <div class="layui-inline">
                <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="clickDype()"><i class="layui-icon">&#xe615;</i></button>
            </div>
            <div class="layui-inline" style="padding-left: 50px;">
                <select id="ByPoid"  class="select" >
                    <option value="">--公司职务--</option>
                </select>
            </div>
            <div class="layui-inline">
                <button  style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="QueryEmpPoid()"><i class="layui-icon">&#xe615;</i></button>
            </div>
            <div class="layui-inline" style="padding-left: 50px;">
                <select id="ByEmpTypeid"  class="select">
                    <option value="">--员工类型--</option>
                </select>
            </div>
            <div class="layui-inline">
                <button  style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="QueryEmptTypeid()"><i class="layui-icon">&#xe615;</i></button>
            </div>
            <div style="float:right;">
                <button onclick="shuaxin()">刷新</button>
            </div>
        </div>
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
        <button class="layui-btn layui-btn-sm" onclick="delemp()"><i class="layui-icon"></i></button>
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
    //添加表单属性
    layui.use(['form', 'layedit', 'laydate'], function(){ });
//自动查询
    $(function(){
        queryAllRes(1);
        //$("#myModal").modal("show");//模态框开启
    });

})
function shuaxin() {
   window.location.reload();
}
function clickDype(){
    var typeVale = $("#ByType").val();
    QQueryEmp(1,typeVale,'','','');
}
function ClickByName() {
    var name = $("#name").val();
    QQueryEmp(1,'',name,'','');
}
function  QueryEmpPoid() {
    var poid = $("#ByPoid").val();
    QQueryEmp(1,'','',poid,'');
}
function QueryEmptTypeid() {
    var emptypeid = $("#ByEmpTypeid").val();
    QQueryEmp(1,'','','',emptypeid);
}

function QQueryEmp(pageNum,typeVale,name,poid,emptypeid){

    $.ajax({
        url:'QqueryEmp',
        type:'post',
        data:{"pageNum":pageNum,"deptid":typeVale,"empname":name,"poid":poid,"emptypeid":emptypeid},
        dataType:"json",
        success:function(data){
            $("#MyBody").html("");
            var datalist=data.list;
            for(var i=0;i<datalist.length;i++)
            {
                var tr="<tr>";
                tr+="<th><input type='checkbox' name='check' value='"+datalist[i].empid+"'></th>";
                tr+="<th><a style='color: #19aa8d' onclick='QqueryOneEmp("+datalist[i].empid+")' >"+datalist[i].empname+"</a></th>";
                tr+="<th>"+datalist[i].empnumber+"</th>";
                tr+="<th>"+datalist[i].sex+"</th>";
                tr+="<th>"+datalist[i].phone+"</th>";
                tr+="<th>"+datalist[i].deptname+"</th>";
                tr+="<th>"+datalist[i].posname+"</th>";
                tr+="<th>"+datalist[i].emptype+"</th>";
                tr+="<th>"+datalist[i].emppay+"</th>";
                tr+="<th>"+datalist[i].empstatedate+"</th>";
                tr+="<th><a onclick='QupdateEmp("+datalist[i].empid+")' >修改</a></th>";
                tr+="</tr>";
                    $("#MyBody").append(tr);
            }
            $("#nowPage").html(data.pageNum);
            var currentPage = data.total; //总条数
            var pageCount = data.pageSize; //总页数
            $("#total").html(currentPage);
            $("#pageSize").html(pageCount);
            for (var i=0;i<datalist.length;i++){
                var o="<option value='"+datalist[i].deptid+"'>"+datalist[i].deptname+"</option>";
                $("#ByType").append(o);
            }
            for (var i=0;i<datalist.length;i++){
                var o="<option value='"+datalist[i].poid+"'>"+datalist[i].posname+"</option>";
                $("#ByPoid").append(o);
            }
            for (var i=0;i<datalist.length;i++){
                var o="<option value='"+datalist[i].emptypeid+"'>"+datalist[i].emptype+"</option>";
                $("#ByEmpTypeid").append(o);
            }
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
function QupdateEmp(obj) {
    alert(obj)
    $.ajax({
        url:'QqueryEmpIf',
        type:'post',
        data:{"empid":obj},
        dataType:'json',
        success:function (data) {
            window.location.href="QupdateEmp"
        }
    })
}


</script>

