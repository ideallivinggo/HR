<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/11/1
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap-paginator.js"></script>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link  rel="stylesheet" href="../../assets/layui/css/layui.css">

    <style>
        .layui-form-label{
            width: 230px;
        }
    </style>
</head>
<body style="background-color: #f3f3f3">
<div id="head" style="margin:1%;width:100%;height: 50%;background-color: #19aa8d">
    <input type="button" value="返回" onclick="back()" style="width: 60px;height: 36px;">
    <div style="overflow:hidden;width:120px;height:120px;border: 1px solid #fff9ec;border-radius:60px;position: absolute;top:18%;left:15%;">
        <h1><%--${list.mppicture} --%><img src="../../assets/img/ui-zac.jpg"></h1>
    </div>
    <div style="width:440px;height:140px;position: absolute;top:13%;left:30%;">
        <span style="color: #FFFFFF;font-family:'黑体';"><h3>${list.empname}</h3></span>
        <hr style="color: #FFFFFF;width: 500px;">
        <span style="color: #FFFFFF;font-family:'黑体';font-size:16px;margin-top:100px;">部门:${list.deptname}</span><br>
        <span style="color: #FFFFFF;font-family:'黑体';font-size:16px;margin-top:100px;">入职日期:${list.empstatedate}</span>
    </div>
</div>
<div  id="body" style="border-radius:10px;position: absolute;top:40%;left:8%;width:84%;height: 1050px;background-color: #ffffff">

    <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
        <div class="layui-tab-content" style="height: 100px;">
            <%--基础信息--%>
            <div class="layui-tab-item layui-show">
                <form class="layui-form" action="" id="EmpForm">
                    <div class="layui-form-item" style="margin-top: 50px;">
                        <div class="layui-inline" >
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="empname" value="${list.actname}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">工号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="empnumber" value="${list.actnumber}" lay-verify="required" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">薪资</label>
                            <div class="layui-input-inline">
                                <input type="text" name="emppay"  lay-verify="required" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-inline">
                                <input value="${list.actpwd}" type="text" name="password"  autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">部门</label>
                            <div class="layui-input-inline">
                                <select id="ByDype">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">职位</label>
                            <div class="layui-input-inline">
                                <select id="ByPoid">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">手机</label>
                            <div class="layui-input-inline">
                                <input value="${list.phone}" type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">邮箱</label>
                            <div class="layui-input-inline">
                                <input value="${list.emali}" type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">证件类型</label>
                            <div class="layui-input-inline">
                                <select name="typeid">
                                    <option value="1">身份证</option>
                                    <option value="2">驾驶证</option>
                                    <option value="3">军官证</option>
                                    <option value="4">护照</option>
                                    <option value="5">其他</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">证件号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="idnumber" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sex" value="${list.sex}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">出生日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="birthdate" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">民族</label>
                            <div class="layui-input-inline">
                                <input type="text" name="nation" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">户口类型</label>
                            <div class="layui-input-inline">
                                <input type="text" name="accounttype" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">学历</label>
                            <div class="layui-input-inline">
                                <select name="eduid">
                                    <option value="2">大专</option>
                                    <option value="3">本科</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">政治面貌</label>
                            <div class="layui-input-inline">
                                <input type="text" name="politics" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">QQ</label>
                            <div class="layui-input-inline">
                                <input type="text" name="qqnumber" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">入职日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="empstatedate" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">紧急联系人</label>
                            <div class="layui-input-inline">
                                <input type="text" name="urgencyname" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">紧急联系人电话</label>
                            <div class="layui-input-inline">
                                <input type="tel" name="urgencyphone" lay-verify="required|phone" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                       <div class="layui-inline" >
                            <label class="layui-form-label">入职状态</label>
                            <div class="layui-input-inline">
                                <input value="1" name="empstateid">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">员工类型</label>
                            <div class="layui-input-inline">
                                <select name="emptypeid">
                                    <option value="">请选择</option>
                                    <option value="1">全职</option>
                                    <option value="2">兼职</option>
                                    <option value="3">外派</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">住址</label>
                            <div class="layui-input-inline">
                                <textarea name="address" placeholder="请输入内容" style="width: 200px;" class="layui-textarea"></textarea>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">备注</label>
                            <div class="layui-input-inline">
                                <textarea name="empnotes" placeholder="请输入内容" style="width: 200px;" class="layui-textarea"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" style="padding-left:300px; ">
                        <div class="layui-input-block">
                            <button  class="layui-btn" lay-submit="" lay-filter="SubmitEmp">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
            form.render();

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date2'
        });


        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });
        //监听提交
        form.on('submit(SubmitEmp)', function(data){
            var con = $("#EmpForm").serialize();
            alert(con)
            alert("添加员工")
            $.ajax({
                url:'AddEmpYqx',
                type:'post',
                data:con,
                dataType:'text',
                success:function (data) {
                    alert(true+"添加")
                    window.location.href="QoneEmp"
                }
            })
            alert("tiajia")
        });

    });
</script>
</body>
</html>
<script>
    $(function () {
        QuerySelect();
        QueryPosition();
    })
    /**
     * 下拉部门
     * */
    function QuerySelect(){
        $.ajax({
            url:'QueryDeptSelectYqx',
            type:'post',
            data:{},
            dataType:'json',
            success:function (data) {
                for (var i=0;i<data.length;i++){
                    $("#ByDype").append("<option value='"+data[i].deptid+"'>"+data[i].deptname+"</option>");
                }
            }
        })
    }
    /**
     * 下拉职位
     * */
    function QueryPosition(){
        alert("职位下拉")
        $.ajax({
            url:'QueryPosition',
            type:'post',
            data:{},
            dataType:'json',
            success:function (data2) {
                alert(data2.length)
                alert(data2[0].posname+"ssssssssssssssssss")
                for (var i=0;i<data2.length;i++){
                    $("#ByPoid").append("<option value='"+data2[i].poid+"'>"+data2[i].posname+"</option>");
                }
                alert("下拉==========================================================")
            }
        })
    }

</script>

