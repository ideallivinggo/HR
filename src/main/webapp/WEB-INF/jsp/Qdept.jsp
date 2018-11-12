<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/10/22
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
<style>
    .layui-table tr th{
        text-align: center;
        font-size: 16px;
    }
</style>
</head>
<body>
<div style="padding: 20px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card" style="height: 100%;">
                <div class="layui-card-header">
                    <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;float: right;padding-right: 60px;">
                        <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal">添加部门</button>
                    </div>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table">
                        <tr style="background-color: #f2f2f2;color: #009688">
                            <th>序号</th>
                            <th>deptid</th>
                            <th>empid</th>
                            <th>部门名称</th>
                            <th>部门经理</th>
                            <th>部门人数</th>
                            <th>以入职人数</th>
                            <th>操作</th>
                        </tr>
                        <tbody id="MyBody"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="addDept" style="display: none;">
    <form class="layui-form" action="" class="EmpForm">
        <div class="layui-form-item" >
            <div class="layui-inline" style="margin-top: 30px;margin-left: 20px;">
                <label class="layui-form-label">部门名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="deptname" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 30px;margin-left: 20px;">
                <label class="layui-form-label">部门经理</label>
                <div class="layui-input-inline">
                    <select class="ByEmp" id="bbb">
                        <option id="aaa"></option>
                    </select>
                </div>
            </div>
            <div class="layui-inline" style="margin-top: 30px;margin-left: 20px;">
                <label class="layui-form-label">部门人数</label>
                <div class="layui-input-inline">
                    <input type="text" id="deptnamenum"  autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
<script>
    $(function () {
        QueryDeptYqx();
        QueryEmpSelectYqx();
    })
    function QueryDeptYqx() {
        $.ajax({
            url:'QueryGroupYqx',
            type:'post',
            data:{},
            dataType:'json',
            success:function (data) {
                $("#MyBody").html("");
                for (var i=0;i<data.length;i++){
                    var name=data[i].empname;
                    if(name==null){
                        name="暂无";
                    }else {
                        name=data[i].empname
                    }
                    var deptid=data[i].deptid;
                    var roid = data[i].roid;
                    var tr="<tr>";
                    tr+="<th>"+(i+1)+"</th>";
                    tr+="<th>"+data[i].deptid+"</th>";
                    tr+="<th>"+data[i].empid+"</th>";
                    tr+="<th>"+data[i].deptname+"</th>";
                    tr+="<th>"+name+"</th>";
                    tr+="<th>"+data[i].deptnum+"</th>";
                    tr+="<th>"+data[i].roid+"</th>";
                    tr+="<th><button class='layui-btn layui-btn-sm' onclick='delDept("+data[i].deptid+")'><i class='layui-icon'>&#xe640;</i></button>" +
                        "<button class='layui-btn layui-btn-sm layui-btn-normal' onclick='UpdateDept("+data[i].deptid+")'><i class='layui-icon'>&#xe642;</i></th>";
                    tr+="</tr>";
                    $("#MyBody").append(tr);
                }
            }
        })
    }
    /**
     * 查询员工姓名
     * */
    function QueryEmpSelectYqx() {
        $.ajax({
            url:'QueryEmpSelectYqx',
            type:'post',
            data:{},
            dataType:'json',
            success:function (data) {
                for (var i=0;i<data.length;i++){
                    $(".ByEmp").append("<option value='"+data[i].empid+"'>"+data[i].empname+"</option>");
                }
            }
        })
    }
    /**
     * 修改部门人数
     * */
    function UpdateDept(a) {
        alert(a)
        $.ajax({
            url:'QueryGroupYqx',
            type:'post',
            data:{"deptid":a},
            dataType:'json',
            success:function (data) {
                $("#deptname").val(data[0].deptname);
                $("#aaa").val(data[0].empname);
                $("#deptnamenum").val(data[0].deptnum);
                layer.open({
                    type: 1
                    ,title:'修改部门'
                    ,area: ['400px', '360px']
                    ,content: $('.addDept')
                    ,btn:  ['提交', '关闭']
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes:function () {
                        alert("修改部门！");
                        var id=$("#bbb").val();
                        var deptid = data[0].deptid;
                        var empid = data[0].empid;
                        var name = $("#deptname").val();
                        var num = $("#deptnamenum").val();
                        UpdateDeptYqx(id,deptid,empid,name,num);
                    }
                });

            }
        })

    }
    function UpdateDeptYqx(id,deptid,empid,name,num) {
        alert(id+"==="+deptid+"==="+empid+"==="+name+"==="+num)
        $.ajax({
            url:'UpdateDeptYqx',
            type:'post',
            data:{"deptname":name,"deptnum":num,"deptid":deptid,"id":id,"empid":empid},
            dataType:'text',
            success:function (data) {
                QueryDeptYqx();
            }
        })
        layer.closeAll();
    }

    /**
     * 删除
     * */
    function delDept(obj) {
        alert(obj)
        $.ajax({
            url:'delDept',
            type:'post',
            data:{"deptId":obj},
            dataType:'text',
            success:function (data) {
                QueryDeptYqx();
            }
        })
    }

    layui.use(['form', 'layedit', 'laydate','layer'], function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery,
            layer = layui.layer; //独立版的layer无需执行这一句
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        form.render();
        //触发事件1
        var active = {
          offset: function(othis){
                var type = othis.data('type');
                layer.open({
                    type: 1
                    ,title:'添加部门'
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'layerDemo'+type //防止重复弹出
                    ,area: ['400px', '360px']
                    ,content: $('.addDept')
                    ,btn:  ['提交', '关闭']
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        /*layer.closeAll();*/
                        var name = $("#deptname").val();
                        var num = $("#deptnamenum").val();
                        var id=$("#ByEmp").val();
                        addDept(name,num,id);
                    }
                });
            }
        };
        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });
    function addDept(name,num,id){
        $.ajax({
            url:'AddDeptManageYqx',
            type:'post',
            data:{"deptName":name,"deptnum":num,"empid":id},
            dataType:'text',
            success:function (data) {
                QueryDeptYqx();
            }
        })
        layer.closeAll();
    }
</script>
