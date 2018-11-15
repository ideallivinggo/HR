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
                    <div class="layui-inline" >
                        <label class="layui-form-label">员工类型</label>
                        <div class="layui-input-inline">
                            <select name="emptypeid" ]>
                                <option value="${list.emptypeid}">${list.emptype}</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">部门</label>
                        <div class="layui-input-inline">
                            <input value="${list.deptid}" id="did" style="display: none;">
                            <select id="ByDype" name="deptid">
                                <%--<option >${list.deptname}</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline" >
                        <label class="layui-form-label">职务</label>
                        <div class="layui-input-inline">
                            <input value="${list.poid}" id="pid" style="display: none;">
                            <select id="ByPoid" name="poid">
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
                                <input value="${list.email}" type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                <div class="layui-form-item">
                    <div class="layui-inline" >
                        <label class="layui-form-label">证件类型</label>
                        <div class="layui-input-inline">
                            <select name="typeid" disabled="disabled;">
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
                    <div class="layui-form-item" style="display: none;">
                        <div class="layui-inline" >
                            <label class="layui-form-label">入职状态</label>
                            <div class="layui-input-inline">
                                <select name="empstateid" id="empstateid">
                                    <option value="${list.empstateid}">${list.statename}</option>
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
                        <input name="empid" value="${list.empid}" style="display: none;">
                        <button  class="layui-btn" lay-submit="" lay-filter="SubmitEmp">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
                </form>
            </div>
                   <%--合同信息--%>
            <div class="layui-tab-item">
                <form class="layui-form" action="" id="ContractForm">
                    <%--实习合同--%>
                    <div id="IdOne">
                    <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label" style="color: #009688;">实习合同:</label>
                            <div class="layui-input-inline">
                                <a href="/upload/实习合同.doc" download="实习合同.doc" class="layui-btn">实习合同</a>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" id="aab">
                        <div class="layui-inline" >
                            <label class="layui-form-label">甲方</label>
                            <div class="layui-input-inline">
                                <input value="睿智集团" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">乙方</label>
                            <div class="layui-input-inline">
                                <input value="${list.empname}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" id="aac">
                        <div class="layui-inline" >
                            <label class="layui-form-label">入职时间</label>
                            <div class="layui-input-inline">
                                <input value="${list.empstatedate}" disabled="disabled" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">试用期到期时间</label>
                            <div class="layui-input-inline">
                                <input value="${list.conexpire}" type="text" name="conexpire" id="date7" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                        <div class="layui-form-item" style="margin-top: 50px;">
                            <div class="layui-inline">
                                <label class="layui-form-label">合同预览:</label>
                                <div class="layui-input-inline" style="width: 630px;color: #919191;">
                                    <h4 style="text-align: center;">员工实习合同</h4>
                                    甲方(用人单位):代理人:<br>
                                乙方(实习生):<br>
                                为明确实习学生与实习单位的责任与义务,根据《民法通则》、《中华人民共和国劳动法》、《中华人民共和国劳动合同法》及有关规定,甲乙双方在平等自愿的基础上签订本协议。<br> 　
                                一、协议期限<br> 　　
                                本协议自_________年_______月_______日起至_________年_______月_______日止。<br> 　　
                                二、实习岗位<br>
                                甲方根据乙方的实际情况和工作需要,安排实习学生到规划实习生岗位实<br>
                                习,乙方应按学校的教学内容及实习要求,努力完成实习任务。<br> 　　
                                三、实习津贴<br>
                                依照按劳取酬的原则,按甲方现行制度确定实习生的实习津贴。具体支付<br>
                                方法如下:<br>
                                实习津贴:_______元/月,其他补贴:根据实习生在岗工作表现,以奖金形式发放。<br>
                                　　 四、工作时间及休息假日 <br>　　
                                1、甲方实行每日8小时工作制,保证乙方按照国家和本市有关规定享受各种休息、休假; <br>　　
                                2、甲乙双方具体约定:如有项目需要,本着自愿原则加班。<br> 　　
                                加班补助细则如下:<br> 　
                                1、法定假日加班,伙食补贴30元/天,报销交通费用(凭地铁卡充值发票和出租车发票)<br> 　
                                2、工作日晚上加班,晚餐补助15元,报销交通费用(凭地铁卡充值发票和出租车发票)<br> 　　
                                五、保险福利待遇<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1、甲方应对乙方进行安全教育和岗位技能培训,实习学生不得从事特种作业;<br> 　　
                                2、甲方根据实习学生岗位实际情况,按国家规定向其提供必需的劳动防护用品;<br> 　　
                                3、实习学生患职业病、工伤事故的按《工伤保险条例》规定执行。<br> 　　
                                六、合同解除、变更、终止<br> 　　
                                1、经甲乙双方协商同意,本协议可以变更或解除。<br> 　　
                                2、乙方在本合同履行期间可以在说明原因的情况下向甲方提出终止实习合同,但必须提前7天通知甲方,并作好工作交接,否则应承担相关责任。<br> 　　
                                3、实习期间,甲方如发现乙方对甲方项目造成损失或乙方无法达到项目要求的,可以向乙方提出终止实习,在为实习生履行实习津贴支付手续后,解除本合同。<br> 　　
                                七、法律效力<br> 　　
                                本合同正本一式两份,双方各执一份,经甲乙双方签字后生效。<br> 　　
                                甲方签章<br> 　　
                                乙方签字<br> 　　
                                签订日期____年__月__日 <br>　
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        $(function () {
                            var aad=$("#empstateid").val();
                            alert(aad+"ddddddddddddd")
                            if(aad==1){
                                $("#IdOne").show();//显示
                                $("#IdTwo").hide();//隐藏

                            }else{
                                $("#IdOne").hide();//隐藏
                                $("#IdTwo").show();//显示
                            }
                        })
                    </script>
                        <%--劳动合同--%>
                    <div id="IdTwo">
                        <div class="layui-form-item" style="margin-top: 15px;">
                            <div class="layui-inline" >
                                <label class="layui-form-label" style="color: #009688;">劳动合同:</label>
                                <div class="layui-input-inline">
                                    <a href="/upload/劳动合同书.docx" download="劳动合同书.docx" class="layui-btn">劳动合同书下载</a>
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline" >
                                <label class="layui-form-label">甲方</label>
                                <div class="layui-input-inline">
                                    <input value="睿智集团" disabled="disabled" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline" >
                                <label class="layui-form-label">乙方</label>
                                <div class="layui-input-inline">
                                    <input value="${list.empname}" disabled="disabled" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline" >
                                <label class="layui-form-label">入职时间</label>
                                <div class="layui-input-inline">
                                    <input value="${list.empstatedate}" disabled="disabled" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline" >
                                <label class="layui-form-label">试用期到期时间</label>
                                <div class="layui-input-inline">
                                    <input value="${list.conexpire}" disabled="disabled" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                        <div class="layui-inline" >
                            <label class="layui-form-label">合同开始时间</label>
                            <div class="layui-input-inline">
                                <input value="${list.constart}" type="text" name="constart" id="date1"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline" >
                            <label class="layui-form-label">合同结束时间</label>
                            <div class="layui-input-inline">
                                <input value="${list.conover}" type="text" name="conover" id="date2"  placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                        <div class="layui-form-item" style="margin-top: 30px;">
                            <div class="layui-inline">
                                <label class="layui-form-label">合同预览:</label>
                                <div class="layui-input-inline" style="width: 630px;color: #919191;">
                                    <h4 style="text-align: center;">劳动合同</h4>
                                    甲方(用人单位):代理人:<br>
                                    乙方(实习生):<br>
                                    根据《中华人民共和国劳动法》和有关规定，甲乙双方经平等协商一致，自愿签订本合同，共同遵守本合同所列条款。<br>
                                    一、劳动合同期限第一条本合同为______________期限劳动合同。<br>
                                    二、工作内容<br>
                                    第二条乙方同意根据甲方工作需要，担任 岗位(工种)工作。<br>
                                    第三条乙方工作应达到甲方规定的技术标准。<br>
                                    三、劳动保护和劳动条件第四条甲方安排乙方执行八小时工时制度。<br>
                                    第五条甲方为乙方提供必要的劳动条件和劳动工具。<br>
                                    第六条甲方负责对乙方进行职业道德、业务技术、劳动安全、劳动纪律和甲方规章制度的教育。<br>
                                    四、劳动报酬第七条甲方每月以货币形式支付乙方工资。<br>
                                    第八条甲方生产工作任务不足使乙方待工的，甲方无需支付乙方的月生活费。<br>
                                    第九条有下列情形之一的，甲乙双方应变更劳动合同并及时办理变更合同手续：<br>
                                    (一)甲乙双方协商一致的;<br>
                                    (二)订立本合同所依据的客观情况发生重大变化，致使本合同无法履行的<br>
                                    第十条乙方有下列情形之一，甲方可以解除本合同：<br>
                                    (一)在试用期间被证明不符合录用条件的;<br>
                                    (二)严重违反劳动纪律或者甲方规章制度，按照甲方单位规定或者本合同约定可以解除劳动合同。<br>
                                    第十一条有下列情形之一的，甲方解除本合同：<br>
                                    (一)乙方患病或者非因工负伤，不能从事原工作也不能从事甲方另行安排的工作的;<br>
                                    (二)本合同订立时所依据的客观情况发生重大变化，致使合同无法履行，经甲乙双方协商不能就变更本合同达成协议的;<br>
                                    五、当事人约定的其他内容第十二条甲乙双方约定本合同增加以下内容：<br>
                                    第一十三条乙方有下列情形之一，甲方可以解除本合同：<br>
                                    1、在试用期间，被证明不符合录用条件的;<br>
                                    2、严重违反劳动纪律或甲方规章制度的;<br>
                                    3、严重失职、营私舞弊，对甲方利益造成重大损害的;<br>
                                    4、被依法追究刑事责任的。<br>
                                    甲方签章<br> 　　
                                    乙方签字<br> 　　
                                    签订日期____年__月__日 <br>　　
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <%--<div class="layui-upload">
                            <button type="button" id="Qupload" name="file" style="margin-left: 120px;" class="layui-btn" >上传图片</button>
                            <div class="layui-upload-list" style="margin-top:-40px;margin-left: 230px;width: 620px;height: 400px;">
                                <img class="layui-upload-img" src="${list.concontent}" id="demo1" style="width: 620px;height: 400px;">
                                <p id="demoText"></p>
                            </div>
                        </div>--%>
                    </div>
                    <div class="layui-form-item" style="padding-left:300px; ">
                        <div class="layui-input-block">
                            <input name="conid" value="${list.conid}" id="ByConid"  style="display: none;">
                            <input name="empid" value="${list.empid}"  style="display: none;">
                            <button class="layui-btn" lay-submit="" lay-filter="SubmitContract">立即提交</button>
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
                            <input name="expid" value="${list.expid}" id="ByExpid" style="display: none;">
                            <input name="empid" value="${list.empid}" style="display: none;">
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
                            <input name="workid" value="${list.workid}" id="ByWorkid"  style="display: none;">
                            <input name="empid" value="${list.empid}"  style="display: none;">
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
                            <input name="socid" value="${list.socid}" id="BySocid"  style="display: none;">
                            <input name="empid" value="${list.empid}" style="display: none;">
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
              laydate.render({
                  elem: '#date7'
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
                      $.ajax({
                          url:'UpdateEmpYu',
                          type:'post',
                          data:con,
                          dataType:'text',
                          success:function (data) {
                              $(".layui-tab-item").load(location.href+".layui-tab-item");
                              alert("操作成功！");
                          }
                      })
                  return false;//禁止跳转，否则会提交两次，且页面会刷新
              });
              //监听提交（合同）
              form.on('submit(SubmitContract)', function(data){
                  var con = $("#ContractForm").serialize();
                  var img=$("#demo1").attr('src');
                  var a = $("#ByConid").val();
                  if(a ==""){
                      $.ajax({
                          url:'AddContractYqx?qsrc='+qsrc,
                          type:'post',
                          data:con,
                          dataType:'text',
                          success:function (data) {
                              $(".layui-tab-item").load(location.href+".layui-tab-item");
                              alert("操作成功！");
                          }
                      })
                      return false;//禁止跳转，否则会提交两次，且页面会刷新
                  }else{
                      $.ajax({
                          url:'UpdateContractYqx?qsrc='+img,
                          type:'post',
                          data:con,
                          dataType:'text',
                          success:function (data) {
                              $(".layui-tab-item").load(location.href+".layui-tab-item");
                              alert("操作成功！");
                          }
                      })
                      return false;//禁止跳转，否则会提交两次，且页面会刷新
                  }
              });
              //监听提交（教育经历）
              form.on('submit(SubmitEducation)', function(data){
                  var edu = $("#EducationForm").serialize();
                  var img=$("#demo2").attr('src');
                  var a = $("#ByExpid").val();
                  if(a ==""){
                      $.ajax({
                          url:'AddEducationYqx?Uedu='+Uedu,
                          type:'post',
                          data:edu,
                          dataType:'text',
                          success:function (data) {
                              $(".layui-tab-item").load(location.href+".layui-tab-item");
                              alert("操作成功！");
                          }
                      })
                      return false;//禁止跳转，否则会提交两次，且页面会刷新
                  }else{
                      $.ajax({
                          url:'UpdateEducationYqx?Uedu='+img,
                          type:'post',
                          data:edu,
                          dataType:'text',
                          success:function (data) {
                              $(".layui-tab-item").load(location.href+".layui-tab-item");
                              alert("操作成功！");
                          }
                      })
                      return false;//禁止跳转，否则会提交两次，且页面会刷新
                  }
              });
              //监听提交（工作经历）
              form.on('submit(SubmitWork)', function(data){
                  var work = $("#WorkForm").serialize();
                  var a = $("#ByWorkid").val();
                  if(a ==""){
                      $.ajax({
                          url:'AddWorkYqx',
                          type:'post',
                          data:work,
                          dataType:'text',
                          success:function (data) {
                              $(".layui-tab-item").load(location.href+".layui-tab-item");
                              alert("操作成功！");
                          }
                      });
                      return false;//禁止跳转，否则会提交两次，且页面会刷新
                  }else{
                      $.ajax({
                          url:'UpdateWorkYqx',
                          type:'post',
                          data:work,
                          dataType:'text',
                          success:function (data) {
                              $(".layui-tab-item").load(location.href+".layui-tab-item");
                              alert("操作成功！");
                          }
                      });
                      return false;//禁止跳转，否则会提交两次，且页面会刷新
                  }
              });
              //监听提交（社保福利经历）
              form.on('submit(SubmitSocial)', function(data){
                  var social = $("#SocialForm").serialize();
                  var a = $("#BySocid").val();
                  if(a ==""){
                      $.ajax({
                          url:'AddSocialYqx',
                          type:'post',
                          data:social,
                          dataType:'text',
                          success:function (data) {
                              $(".layui-tab-item").load(location.href+".layui-tab-item");
                              alert("操作成功！");
                          }
                      });
                      return false;//禁止跳转，否则会提交两次，且页面会刷新
                  }else{
                      $.ajax({
                          url:'UpdateSociaYqx',
                          type:'post',
                          data:social,
                          dataType:'text',
                          success:function (data) {
                              $(".layui-tab-item").load(location.href+".layui-tab-item");
                              alert("操作成功！");
                          }
                      });
                      return false;//禁止跳转，否则会提交两次，且页面会刷新
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
    QuerySelect();
    QueryPosition();
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
                var did = $("#did").val();
                $("#ByDype option[value='"+did+"']").attr("selected","selected");
            }
        })
    }
/**
 * 下拉职位
 * */
function QueryPosition(){
    $.ajax({
        url:'QueryPosition',
        type:'post',
        data:{},
        dataType:'json',
        success:function (data2) {
            for (var i=0;i<data2.length;i++){
                $("#ByPoid").append("<option value='"+data2[i].poid+"'>"+data2[i].posname+"</option>");
            }
            var pid = $("#pid").val();
            $("#ByPoid option[value='"+pid+"']").attr("selected","selected");
        }
    })
}

function ClickContract() {


}
</script>