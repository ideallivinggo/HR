<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/10/21
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../../assets/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap-paginator.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
    <style>
        #head{

        }
        #body
        {
            text-align:center;
        }
        ul {
            margin-top: 60px;
        }
        ul li
        {
            list-style-type:none;
            display:inline;
            font-size: 17px;
            color: #7f8c9a;
            padding-left: 50px;

        }
        .div-lablel{
            font-size: 15px;
        }
       /* .div-span{
            font-size: 14px;
            color: #7f8c9a;
        }*/
        .form-left{
           /* border: 1px solid #000000;*/
            width: 400px;
            position: absolute;
            left: 100px;
            top: 120px;
        }
        .form-left div{
            width: 300px;
            margin:0 auto;
            margin-top:30px;
        }
        .form-left div label{
            width: 70px;
            text-align: right;
        }
        .form-right{
           /* border: 1px solid #000000;*/
            width: 400px;
            position: absolute;
            left: 520px;
            top: 120px;
            margin:0 auto
        }
        .form-right div{
            width: 360px;
            margin:0 auto;
            margin-top:30px;
        }
        .form-right div label{
            width: 110px;
            text-align: right;
        }
        #myform input{
            width: 200px;
            height: 30px;
            border:1px solid #cdcdcd;
        }
        #myform textarea{
            border:1px solid #cdcdcd;
        }
        #ByDype option{
            width: 100px;
        }
    </style>
</head>
<body style="background-color: #f3f3f3">

<div >
    <div id="head" style="margin:1%;width:100%;height: 50%;background-color: #19aa8d">
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
    <div  id="body" style="border-radius:10px;position: absolute;top:40%;left:8%;width:84%;height: 900px;background-color: #ffffff">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title" style=" margin-top:40px ;margin-left: 20%;">
                <li class="layui-this">基础信息</li>
                <li>合同信息</li>
                <li>教育经历</li>
                <li>工作经历</li>
                <li>社保福利</li>
            </ul>
            <div class="layui-tab-content" style="height: 100px;">
                <%--员工基础--%>
                <div class="layui-tab-item layui-show">
                    <%--<div class="layui-form">--%>
                    <form id="MyForm">
                    <div class="form-left">
                        <div>
                            <label class="div-lablel">姓名:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="empname" value="${list.empname}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">工号:</label>&nbsp;&nbsp;&nbsp;
                            <span  class="div-span"><input name="empnumber" value="${list.empnumber}"></span>
                        </div>
                        <div>
                            <label class="div-lablel">薪资:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="emppay" value="${list.emppay}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">证件类型:</label>&nbsp;&nbsp;&nbsp;
                           <span class="div-span">
                               <select>
                                   <option >身份证</option>
                               </select>
                            </span>
                        </div>
                        <div>
                            <label  class="div-lablel">证件号:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="idnumber" value="${list.idnumber}"></span>
                        </div>
                        <div>
                            <label class="div-lablel">性别:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="sex" value="${list.sex}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">出生日期:</label>&nbsp;&nbsp;&nbsp;
                            <span  class="div-span"><input name="birthdate" value="${list.birthdate}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">民族:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="nation" value="${list.nation}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">户口类型:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="accounttype" value="${list.accounttype}"></span>
                        </div>
                        <div>
                            <label class="div-lablel">学历:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="eduid" value="${list.eduid}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">住址:</label>&nbsp;&nbsp;&nbsp;
                            <span  class="div-span">
                                <textarea name="address" style="width:200px;height:60px;">${list.address}</textarea>
                                <%--<input name="address" value="${list.address}">--%></span>
                        </div>
                    </div>
                    <div class="form-right">
                        <div>
                            <label  class="div-lablel">政治面貌:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="politics" value="${list.politics}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">QQ:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="qqnumber" value="${list.qqnumber}"></span>
                        </div>
                        <div>
                            <label class="div-lablel">电话:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="phone" value="${list.phone}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">邮箱:</label>&nbsp;&nbsp;&nbsp;
                            <span  class="div-span"><input name="email" value="${list.email}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">紧急联系人:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="urgencyname" value="${list.urgencyname}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">紧急联系人电话:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="urgencyphone" value="${list.urgencyphone}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">部门:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span">
                                <select id="ByDype">
                                </select>
                            </span>
                        </div>
                        <div>
                            <label  class="div-lablel">职务:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="poid" value="${list.poid}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">员工类型:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="emptypeid" value="${list.emptypeid}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">入职状态:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="empstateid" value="${list.empstateid}"></span>
                        </div>
                        <div>
                            <label  class="div-lablel">入职日期:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span"><input name="empstatedate" value="${list.empstatedate}"></span>
                        </div>
                        <div>
                            <label class="div-lablel">备注:</label>&nbsp;&nbsp;&nbsp;
                            <span class="div-span">
                                <textarea name="empnotes" style="width:200px;height:60px;">${list.empnotes}</textarea>
                                <%--<input name="empnotes" value="${list.empnotes}">--%></span>
                        </div>
                    </div>
                        <div style="margin-top: 780px;padding-left: 40%;">
                            <input name="empid" value="${list.empid}" hidden>
                            <input type="button" value="保存"  style="background-color: #1e9fff;width: 60px;height: 36px;">
                            <input type="button" value="返回" onclick="back()" style="width: 60px;height: 36px;">
                        </div>
                    </form>
                </div>
                <%--合同信息--%>
                <div class="layui-tab-item">
                            <form id="MyFormCon">
                                <div class="form-left">
                                    <div>
                                        <label  class="div-lablel">合同类型id:</label>&nbsp;&nbsp;&nbsp;
                                        <span  class="div-span"><input name="contypeid" value="${list.contypeid}"></span>
                                    </div>
                                    <div>
                                        <label class="div-lablel">合同内容:</label>&nbsp;&nbsp;&nbsp;
                                        <span class="div-span"><input name="concontent" value="${list.concontent}"></span>
                                    </div>

                                </div>
                                <div class="form-right">
                                    <div>
                                        <label  class="div-lablel">合同开始时间:</label>&nbsp;&nbsp;&nbsp;
                                        <span class="div-span"><input name="constart" value="${list.constart}"></span>
                                    </div>
                                    <div>
                                        <label  class="div-lablel">合同结束时间:</label>&nbsp;&nbsp;&nbsp;
                                        <span class="div-span"><input name="conover" value="${list.conover}"></span>
                                    </div>
                                    <div>
                                        <label class="div-lablel">试用期到期时间:</label>&nbsp;&nbsp;&nbsp;
                                        <span class="div-span"><input name="conexpire" value="${list.conexpire}"></span>
                                    </div>
                                </div>
                                <div style="margin-top: 230px;padding-left: 40%;">
                                    <input name="conid" value="${list.conid}" id="ByConid">
                                    <input name="empid" value="${list.empid}" >
                                    <input type="button" value="保存" onclick="ClickContract()" style="background-color: #1e9fff;width: 60px;height: 36px;">
                                    <input type="button" value="返回" onclick="back()" style="width: 60px;height: 36px;">
                                </div>
                            </form>
                </div>
                <%--教育经历--%>
                <div class="layui-tab-item" id="MyDivEdu">
                    <form id="MyFormEdu">
                        <div class="form-left">
                            <div>
                                <label  class="div-lablel">毕业院校:</label>&nbsp;&nbsp;&nbsp;
                                <span  class="div-span"><input name="expshool" value="${list.expshool}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">专业名称:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="expmajon" value="${list.expmajon}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">入校时间:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="enterdate" value="${list.enterdate}"></span>
                            </div>
                        </div>
                        <div class="form-right">
                            <div>
                                <label  class="div-lablel">毕业时间:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="graduatedate" value="${list.graduatedate}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">学历:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="expeducation" value="${list.expeducation}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">是否取得学位:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="degree" value="${list.degree}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">毕业证书:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="certificate" value="${list.certificate}"></span>
                            </div>
                        </div>
                        <div style="margin-top: 280px;padding-left: 40%;">
                            <input name="expid" id="ByExpid" value="${list.expid}" >
                            <input name="empid" value="${list.empid}" >
                            <input type="button" value="保存" onclick="ClickEducation()" style="background-color: #1e9fff;width: 60px;height: 36px;">
                            <input type="button" value="返回" onclick="back()" style="width: 60px;height: 36px;">
                        </div>
                    </form>
                </div>
                    <%--工作经历--%>
                <div class="layui-tab-item">
                    <form id="MyFormWork">
                        <div class="form-left">
                            <div>
                                <label  class="div-lablel">公司名称:</label>&nbsp;&nbsp;&nbsp;
                                <span  class="div-span"><input name="worcompany" value="${list.worcompany}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">担任职务:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="worposition" value="${list.worposition}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">入职日期:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="worentrydate" value="${list.worentrydate}"></span>
                            </div>
                        </div>
                        <div class="form-right">
                            <div>
                                <label  class="div-lablel">离职日期:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="woroverdate" value="${list.woroverdate}"></span>
                            </div>
                            <div>
                                <label  class="div-lablel">离职原因:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="wordescribe" value="${list.wordescribe}"></span>
                            </div>
                        </div>
                        <div style="margin-top: 230px;padding-left: 40%;">
                            <input name="workid" id="ByWorkid" value="${list.workid}" >
                            <input name="empid" value="${list.empid}" >
                            <input type="button" value="保存" onclick="ClickWork()" style="background-color: #1e9fff;width: 60px;height: 36px;">
                            <input type="button" value="返回" onclick="back()" style="width: 60px;height: 36px;">
                        </div>
                    </form>
                </div>
                    <%--社保福利--%>
                <div class="layui-tab-item">
                    <form id="MyFormSb">
                        <div class="form-left">
                            <div>
                                <label  class="div-lablel">银行:</label>&nbsp;&nbsp;&nbsp;
                                <span  class="div-span"><input name="socbank" value="${list.socbank}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">银行卡号:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="soccardno" value="${list.soccardno}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">银行开户名:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="soccardname" value="${list.soccardname}"></span>
                            </div>
                        </div>
                        <div class="form-right">
                            <div>
                                <label  class="div-lablel">公积金账号:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="fundaccount" value="${list.fundaccount}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">公积金缴纳地:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="payto" value="${list.payto}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">社保账号:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="securityaccount" value="${list.securityaccount}"></span>
                            </div>
                            <div>
                                <label class="div-lablel">社保缴纳地:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span"><input name="place_payment" value="${list.place_payment}"></span>
                            </div>
                        </div>
                        <div style="margin-top: 280px;padding-left: 40%;">
                            <input name="socid" id="BySocid" value="${list.socid}" >
                            <input name="empid" value="${list.empid}" >
                            <input type="button" value="保存" onclick="ClickSocial()" style="background-color: #1e9fff;width: 60px;height: 36px;">
                            <input type="button" value="返回" onclick="back()" style="width: 60px;height: 36px;">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        layui.use('element', function(){
            var $ = layui.jquery
                ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
        });
        function back() {
            window.history.back();//返回上一页
        }
        function prent() {
            alert(1)
            $.ajax({
                url:"UpdateEmpYqx",
                type:"post",
                data:$("#MyForm").serialize(),
                dataType:"text",
                success:function(data){
                    alert(data)
                    window.location.href="Qemp"
                }
            });
        }

    </script>


</div>

</body>
</html>
<script>
    $(function () {
        layui.use(['form', 'layedit', 'laydate'], function(){ });
        QuerySelect();
    })
    /**
     * 下拉
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
     * 添加修改合同
     * */
    function ClickContract() {
        var id = $("#ByConid").val();
        alert(id)
        if(id == ""){
            alert("添加合同")
            $.ajax({
                url:'AddContractYqx',
                type:'post',
                data:$("#MyFormCon").serialize(),
                dataType:'text',
                success:function (data) {
                    alert(true+"添加")
                }
            })
        }else {
            alert("修改合同")
            $.ajax({
                url:'UpdateContractYqx',
                type:'post',
                data:$("#MyFormCon").serialize(),
                dataType:'text',
                success:function (data) {
                    alert(true+"修改")
                }
            })
        }

    }
    /**
     * 添加修改教育经历
     * */
    function ClickEducation() {
        var id = $("#ByExpid").val();
        alert(id)
        if(id == ""){
            alert("添加教育")
            $.ajax({
                url:'AddEducationYqx',
                type:'post',
                data:$("#MyFormEdu").serialize(),
                dataType:'text',
                success:function (data) {
                    alert(true+"添加")
                    window.location.reload();
                }
            })
        }else {
            alert("修改教育")
            $.ajax({
                url:'UpdateEducationYqx',
                type:'post',
                data:$("#MyFormEdu").serialize(),
                dataType:'text',
                success:function (data) {
                    alert(true+"修改")
                    window.location.reload();
                }
            })
        }
    }
    /**
     * 添加修改工作经历
     * */
    function ClickWork() {
        var id = $("#ByWorkid").val();
        alert(id)
        if(id == ""){
            alert("添加教育")
            $.ajax({
                url:'AddWorkYqx',
                type:'post',
                data:$("#MyFormWork").serialize(),
                dataType:'text',
                success:function (data) {
                    alert(true+"添加")
                    window.location.reload();
                }
            })
        }else {
            alert("修改教育")
            $.ajax({
                url:'UpdateWorkYqx',
                type:'post',
                data:$("#MyFormWork").serialize(),
                dataType:'text',
                success:function (data) {
                    alert(true+"修改")
                    window.location.reload();
                }
            })
        }
    }
    /**
     * 添加修改社保福利
     * */
    function ClickSocial() {
        var id = $("#BySocid").val();
        alert(id)
        if(id == ""){
            alert("添加改社保福利")
            $.ajax({
                url:'AddSocialYqx',
                type:'post',
                data:$("#MyFormSb").serialize(),
                dataType:'text',
                success:function (data) {
                    alert(true+"添加")
                    window.location.reload();
                }
            })
        }else {
            alert("修改改社保福利")
            $.ajax({
                url:'UpdateSociaYqx',
                type:'post',
                data:$("#MyFormSb").serialize(),
                dataType:'text',
                success:function (data) {
                    alert(true+"修改")
                    window.location.reload();
                }
            })
        }
    }
</script>

