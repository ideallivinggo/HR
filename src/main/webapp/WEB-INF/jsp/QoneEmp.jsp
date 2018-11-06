<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/10/15
  Time: 18:59
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
    <ul class="layui-tab-title" style=" margin-top:30px ;margin-left: 30%;">
        <li class="layui-this">基础信息</li>
        <li>合同信息</li>
        <li>教育经历</li>
        <li>工作经历</li>
        <li>社保福利</li>
    </ul>
    <div class="layui-tab-content" style="height: 100px;">
                  <%--基础信息--%>
            <div class="layui-tab-item layui-show">
                <form class="layui-form" action="" id="EmpForm">
                <div class="layui-form-item" style="margin-top: 50px;">
                    <div class="layui-inline" >
                        <label class="layui-form-label">姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="empname" value="${list.empname}" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline" >
                        <label class="layui-form-label">工号</label>
                        <div class="layui-input-inline">
                            <input type="text" name="empnumber" value="${list.empnumber}" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline" >
                        <label class="layui-form-label">薪资</label>
                        <div class="layui-input-inline">
                            <input type="text" name="emppay" value="${list.emppay}" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <%--<div class="layui-inline" >
                        <label class="layui-form-label">验证邮箱</label>
                        <div class="layui-input-inline">
                            <input value="${list.email}" type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
                        </div>
                    </div>--%>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">部门</label>
                        <div class="layui-input-inline">
                            <select id="ByDype">
                                <option value="${list.deptid}">${list.deptname}</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline" >
                        <label class="layui-form-label">职务</label>
                        <div class="layui-input-inline">
                            <input value="${list.poid}" type="text" name="poid"  autocomplete="off" class="layui-input">
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
                                <input value="${list.email}" type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
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
                            <input value="${list.idnumber}" type="text" name="idnumber" autocomplete="off" class="layui-input">
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
                                <input type="text" name="birthdate" value="${list.birthdate}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">民族</label>
                            <div class="layui-input-inline">
                                <input type="text" name="nation" value="${list.nation}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">户口类型</label>
                            <div class="layui-input-inline">
                                <input type="text" name="accounttype" value="${list.accounttype}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">学历</label>
                            <div class="layui-input-inline">
                                <select name="eduid">
                                    <option value="${list.eduid}">${list.eduname}</option>
                                    <option value="2">大专</option>
                                    <option value="3">本科</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">政治面貌</label>
                            <div class="layui-input-inline">
                                <input type="text" name="politics" value="${list.politics}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">QQ</label>
                            <div class="layui-input-inline">
                                <input type="text" name="qqnumber" value="${list.qqnumber}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">入职日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="empstatedate" value="${list.empstatedate}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">紧急联系人</label>
                            <div class="layui-input-inline">
                                <input type="text" name="urgencyname" value="${list.urgencyname}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">紧急联系人电话</label>
                            <div class="layui-input-inline">
                                <input value="${list.urgencyphone}" type="tel" name="urgencyphone" lay-verify="required|phone" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <%--<div class="layui-inline" >
                            <label class="layui-form-label">入职状态</label>
                            <div class="layui-input-inline">
                                <select name="empstateid">
                                    <option value="${list.empstateid}">${list.statename}</option>
                                    <option value="2">待入职</option>
                                    <option value="3">已离职</option>
                                </select>
                            </div>
                        </div>--%>
                        <div class="layui-inline" >
                            <label class="layui-form-label">员工类型</label>
                            <div class="layui-input-inline">
                                <select name="empstateid">
                                    <option value="${list.emptypeid}">${list.emptype}</option>
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
                                <textarea name="address" placeholder="请输入内容" style="width: 200px;" class="layui-textarea">${list.address}</textarea>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">备注</label>
                            <div class="layui-input-inline">
                                <textarea name="empnotes" placeholder="请输入内容" style="width: 200px;" class="layui-textarea">${list.empnotes}</textarea>
                            </div>
                        </div>
                    </div>
                <div class="layui-form-item" style="padding-left:300px; ">
                    <div class="layui-input-block">
                        <input name="empid" value="${list.empid}">
                        <button  class="layui-btn" lay-submit="" lay-filter="SubmitEmp">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
                </form>
            </div>
                   <%--合同信息--%>
            <div class="layui-tab-item">
                <form class="layui-form" action="" id="ContractForm">
                    <div class="layui-form-item" style="margin-top: 50px;">
                        <div class="layui-inline" >
                            <label class="layui-form-label">合同类型</label>
                            <div class="layui-input-inline">
                                <select name="contypeid">
                                    <option value="${list.contypeid}">${list.contypeid}</option>
                                    <option value="1">劳动合同</option>
                                    <option value="2">劳务合同</option>
                                    <option value="3">实习合同</option>
                                    <option value="4">其他合同</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">试用期到期时间</label>
                            <div class="layui-input-inline">
                                <input value="${list.conexpire}" type="text" name="conexpire" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">合同开始时间</label>
                            <div class="layui-input-inline">
                                <input value="${list.constart}" type="text" name="constart" id="date1" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">合同结束时间</label>
                            <div class="layui-input-inline">
                                <input value="${list.conover}" type="text" name="conover" id="date2" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-upload">
                            <button type="button" id="Qupload" name="file" style="margin-left: 120px;" class="layui-btn" >上传图片</button>
                            <div class="layui-upload-list" style="margin-top:-40px;margin-left: 230px;width: 620px;height: 400px;">
                                <img class="layui-upload-img" src="${list.concontent}" id="demo1" style="width: 620px;height: 400px;">
                                <p id="demoText"></p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" style="padding-left:300px; ">
                        <div class="layui-input-block">
                            <input name="conid" value="${list.conid}" id="ByConid">
                            <input name="empid" value="${list.empid}" >
                            <button  class="layui-btn" lay-submit="" lay-filter="SubmitContract">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
                   <%--教育经历--%>
            <div class="layui-tab-item">
                <form class="layui-form" action="" id="EducationForm">
                    <div class="layui-form-item" style="margin-top: 50px;">
                        <div class="layui-inline" >
                            <label class="layui-form-label">毕业院校</label>
                            <div class="layui-input-inline">
                                <input type="text" name="expshool" value="${list.expshool}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">专业名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="expmajon" value="${list.expmajon}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">入校时间</label>
                            <div class="layui-input-inline">
                                <input value="${list.enterdate}" type="text" name="enterdate" id="date3" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">毕业时间</label>
                            <div class="layui-input-inline">
                                <input value="${list.graduatedate}" type="text" name="graduatedate" id="date4" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">学历</label>
                            <div class="layui-input-inline">
                                <select name="expeducation">
                                    <option value="${list.expeducation}">${list.expeducation}</option>
                                    <option value="本科">本科</option>
                                    <option value="大专">大专</option>
                                    <option value="研究生">研究生</option>
                                    <option value="博士">博士</option>
                                    <option value="其他">其他</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">是否取得学位</label>
                            <div class="layui-input-inline">
                                <select name="degree">
                                    <option value="${list.degree}">${list.degree}</option>
                                    <option value="1">是</option>
                                    <option value="0">否</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-upload">
                            <button type="button" id="QuploadEdu" name="file" style="margin-left: 120px;" class="layui-btn" >毕业证书</button>
                            <div class="layui-upload-list" style="margin-top:-40px;margin-left: 230px;width: 620px;height: 400px;">
                                <img class="layui-upload-img" src="${list.certificate}" id="demo2" style="width: 620px;height: 400px;">
                                <p id="demoText2"></p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" style="padding-left:300px; ">
                        <div class="layui-input-block">
                            <input name="expid" value="${list.expid}" id="ByExpid">
                            <input name="empid" value="${list.empid}" >
                            <button  class="layui-btn" lay-submit="" lay-filter="SubmitEducation">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
                   <%--工作经历--%>
            <div class="layui-tab-item">
                <form class="layui-form" action="" id="WorkForm">
                    <div class="layui-form-item" style="margin-top: 50px;">
                        <div class="layui-inline" >
                            <label class="layui-form-label">公司名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="worcompany" value="${list.worcompany}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">担任职务</label>
                            <div class="layui-input-inline">
                                <input type="text" name="worposition" value="${list.worposition}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">入职日期</label>
                            <div class="layui-input-inline">
                                <input value="${list.worentrydate}" type="text" name="worentrydate" id="date5" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">离职日期</label>
                            <div class="layui-input-inline">
                                <input value="${list.woroverdate}" type="text" name="woroverdate" id="date6" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">离职原因</label>
                            <div class="layui-input-inline">
                                <div class="layui-input-inline">
                                    <textarea name="wordescribe" placeholder="请输入内容" style="width: 635px;" class="layui-textarea">${list.wordescribe}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" style="padding-left:300px; ">
                        <div class="layui-input-block">
                            <input name="workid" value="${list.workid}" id="ByWorkid">
                            <input name="empid" value="${list.empid}" >
                            <button  class="layui-btn" lay-submit="" lay-filter="SubmitWork">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
                   <%--社保福利--%>
            <div class="layui-tab-item">
                <form class="layui-form" action="" id="SocialForm">
                    <div class="layui-form-item" style="margin-top: 50px;">
                        <div class="layui-inline" >
                            <label class="layui-form-label">银行名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="socbank" value="${list.socbank}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">公积金账号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="fundaccount" value="${list.fundaccount}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">银行开户名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="soccardname" value="${list.soccardname}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">社保账号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="securityaccount" value="${list.securityaccount}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">银行卡号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="soccardno" value="${list.soccardno}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">缴纳地</label>
                            <div class="layui-input-inline">
                                <input type="text" name="payto" value="${list.payto}" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" style="padding-left:300px; ">
                        <div class="layui-input-block">
                            <input name="socid" value="${list.socid}" id="BySocid">
                            <input name="empid" value="${list.empid}" >
                            <button  class="layui-btn" lay-submit="" lay-filter="SubmitSocial">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
    </div>
</div>

<script>
    var qsrc=null;//合同
    var Uedu=null;//毕业
          layui.use(['form', 'layedit', 'laydate','element','upload'], function(){
              var form = layui.form
                  ,layer = layui.layer
                  ,layedit = layui.layedit
                  ,laydate = layui.laydate;
                   form.render();
              var $ = layui.jquery
                  ,element = layui.element
                  ,upload = layui.upload;
              //日期
              laydate.render({
                  elem: '#date'
              });
              laydate.render({
                  elem: '#date1'
              });
              laydate.render({
                  elem: '#date2'
              });
              laydate.render({
                  elem: '#date3'
              });
              laydate.render({
                  elem: '#date4'
              });
              laydate.render({
                  elem: '#date5'
              });
              laydate.render({
                  elem: '#date6'
              });

              //创建一个编辑器
              var editIndex = layedit.build('LAY_demo_editor');

              //自定义验证规则
              form.verify({
                  empname: function(value){
                      if(value.length < 5){
                          return '标题至少得5个字符啊';
                      }
                  }
                  ,pass: [/(.+){6,12}$/, '密码必须6到12位']
                  ,content: function(value){
                      layedit.sync(editIndex);
                  }
              });

              //监听指定开关
              form.on('switch(switchTest)', function(data){
                  layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                      offset: '6px'
                  });
                  layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
              });
              //监听提交（员工）
              form.on('submit(SubmitEmp)', function(data){
                  var con = $("#EmpForm").serialize();
                  alert(con)
                      alert("修改员工")
                      $.ajax({
                          url:'UpdateEmpYu',
                          type:'post',
                          data:con,
                          dataType:'text',
                          success:function (data) {
                              alert(true+"修改")
                          }
                      })
                  alert("xiuyg")
              });
              //监听提交（合同）
              form.on('submit(SubmitContract)', function(data){
                  var con = $("#ContractForm").serialize();
                  var img=$("#demo1").attr('src');
                  var a = $("#ByConid").val();
                  if(a ==""){
                      alert("添加合同")
                      $.ajax({
                          url:'AddContractYqx?qsrc='+qsrc,
                          type:'post',
                          data:con,
                          dataType:'text',
                          success:function (data) {
                              alert(true+"添加")
                          }
                      })
                  }else{
                      alert("修改合同")
                      $.ajax({
                          url:'UpdateContractYqx?qsrc='+img,
                          type:'post',
                          data:con,
                          dataType:'text',
                          success:function (data) {
                              alert(true+"修改")
                          }
                      })
                      alert("xiugai")
                  }
                  /*layer.alert(JSON.stringify(data.field), {
                      title: '最终的提交信息'
                  })
                  return false;*/
              });
              //监听提交（教育经历）
              form.on('submit(SubmitEducation)', function(data){
                  var edu = $("#EducationForm").serialize();
                  var img=$("#demo2").attr('src');
                  var a = $("#ByExpid").val();
                  if(a ==""){
                      alert("添加教育")
                      $.ajax({
                          url:'AddEducationYqx?Uedu='+Uedu,
                          type:'post',
                          data:edu,
                          dataType:'text',
                          success:function (data) {
                              alert(true+"添加")
                          }
                      })
                      alert("教育添加")
                  }else{
                      alert("修改教育")
                      $.ajax({
                          url:'UpdateEducationYqx?Uedu='+img,
                          type:'post',
                          data:edu,
                          dataType:'text',
                          success:function (data) {
                              alert(true+"修改")

                          }
                      })
                      alert("xiugai")
                  }
              });
              //监听提交（工作经历）
              form.on('submit(SubmitWork)', function(data){
                  var work = $("#WorkForm").serialize();
                  var a = $("#ByWorkid").val();
                  if(a ==""){
                      alert("添加教育")
                      $.ajax({
                          url:'AddWorkYqx',
                          type:'post',
                          data:work,
                          dataType:'text',
                          success:function (data) {
                              alert(true+"添加")
                          }
                      })
                      alert("添加")
                  }else{
                      alert("修改教育")
                      $.ajax({
                          url:'UpdateWorkYqx',
                          type:'post',
                          data:work,
                          dataType:'text',
                          success:function (data) {
                              alert(true+"修改")
                          }
                      })
                      alert("xiugai")
                  }
              });
              //监听提交（社保福利经历）
              form.on('submit(SubmitSocial)', function(data){
                  var social = $("#SocialForm").serialize();
                  var a = $("#BySocid").val();
                  if(a ==""){
                      alert("添加教育")
                      $.ajax({
                          url:'AddSocialYqx',
                          type:'post',
                          data:social,
                          dataType:'text',
                          success:function (data) {
                              alert(true+"添加")
                          }
                      })
                      alert("添加")
                  }else{
                      alert("修改教育")
                      $.ajax({
                          url:'UpdateSociaYqx',
                          type:'post',
                          data:social,
                          dataType:'text',
                          success:function (data) {
                              alert(true+"修改")
                          }
                      })
                      alert("xiugai")
                  }
              });

              //普通图片上传（合同图片）
              var uploadInst = upload.render({
                  elem: '#Qupload'
                  ,url: '/uploadContractYqx/'
                  ,before: function(obj){
                      //预读本地文件示例，不支持ie8
                      obj.preview(function(index, file, result){
                          $('#demo1').attr('src', result); //图片链接（base64）

                      });
                  }
                  ,done: function(res){
                      qsrc=res.data.src;
                      //如果上传失败
                      if(res.code > 0){
                          return layer.msg('上传失败');
                      }
                      //上传成功
                      if(res.code == 0){
                          return layer.msg('上传成功');
                      }
                  }
                  ,error: function(){
                      //演示失败状态，并实现重传
                      var demoText = $('#demoText');
                      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                      demoText.find('.demo-reload').on('click', function(){
                          uploadInst.upload();
                      });
                  }
              });
              //普通图片上传（毕业证书图片）
              var uploadInst = upload.render({
                  elem: '#QuploadEdu'
                  ,url: '/uploadContractYqx/'
                  ,before: function(obj){
                      //预读本地文件示例，不支持ie8
                      obj.preview(function(index, file, result){
                          $('#demo2').attr('src', result); //图片链接（base64）
                      });
                  }
                  ,done: function(res){
                      Uedu=res.data.src;
                      //如果上传失败
                      if(res.code > 0){
                          return layer.msg('上传失败');
                      }
                      //上传成功
                      if(res.code == 0){
                          return layer.msg('上传成功');
                      }
                  }
                  ,error: function(){
                      //演示失败状态，并实现重传
                      var demoText = $('#demoText2');
                      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                      demoText.find('.demo-reload').on('click', function(){
                          uploadInst.upload();
                      });
                  }
              });


          });
</script>
</div>
</body>
</html>
<script>
$(function () {
    QuerySelect()
})

function back() {
    window.history.back();//返回上一页
}
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

function ClickContract() {


}
</script>