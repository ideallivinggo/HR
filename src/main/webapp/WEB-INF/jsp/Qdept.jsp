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
<div id="addDept" style="display: none;">
       <%-- 部门名称:<input id="deptname" style="margin-left:70px;margin-top:35px;width: 150px;height: 40px;border: 1px solid #cdcdcd"><br>
        部门人数:<input id="deptnamenum" style="margin-left:70px;margin-top:35px;width: 150px;height: 40px;border: 1px solid #cdcdcd">--%>
           <div style="padding-top: 40px;padding-left: 50px;">
               部门名称:<input id="deptname" style="width: 200px;height: 40px;border: 1px solid #cdcdcd"><br>
           </div>
           <div style="padding-top: 40px;padding-left: 50px;">
               部门人数:<input id="deptnamenum" style="width: 200px;height: 40px;border: 1px solid #cdcdcd">
           </div>
</div>

</body>
</html>
<script>
    $(function () {
        QueryDeptYqx();
    })
    function QueryDeptYqx() {

        $.ajax({
            url:'QueryDeptYqx',
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
                    var num=data[i].num;
                    if(deptid==null){
                        num=0;
                    }else {
                        num=data[i].num;
                    }
                    var tr="<tr>";
                    tr+="<th>"+(i+1)+"</th>";
                    tr+="<th>"+data[i].deptname+"</th>";
                    tr+="<th>"+name+"</th>";
                    tr+="<th>"+data[i].deptnum+"</th>";
                    tr+="<th>"+num+"</th>";
                    tr+="<th><button class='layui-btn layui-btn-sm' onclick='delDept("+data[i].deptid+")'><i class='layui-icon'></i></button></th>";
                    tr+="</tr>";
                    $("#MyBody").append(tr);
                }
            }
        })
    }
    function delDept(obj) {
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

    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        //触发事件1
        var active = {
          offset: function(othis){
                var type = othis.data('type');
                layer.open({
                    type: 1
                    ,title:'添加部门'
                    ,offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                    ,id: 'layerDemo'+type //防止重复弹出
                    ,area: ['400px', '300px']
                    ,content: $('#addDept')
                    ,btn:  ['提交', '关闭']
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        /*layer.closeAll();*/
                        var name = $("#deptname").val();
                        var num = $("#deptnamenum").val();
                        addDept(name,num);
                    }
                });
            }
        };
        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });
    function addDept(name,num){
        $.ajax({
            url:'addDept',
            type:'post',
            data:{"deptName":name,"deptnum":num},
            dataType:'text',
            success:function (data) {
                QueryDeptYqx();
            }
        })
        layer.closeAll();
    }
</script>
