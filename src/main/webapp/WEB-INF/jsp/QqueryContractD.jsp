<%--
  Created by IntelliJ IDEA.
  User: YQX
  Date: 2018/11/14
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link  rel="stylesheet" href="../../assets/layui/css/layui.css">
    <style>
        .layui-form-label{
            width: 200px;
        }
        #tableY{
            margin-left: 110px;
            text-align: center;
        }
        #tableY td{
            border: 1px solid #818181;
            width: 150px;
            height: 50px;
        }
    </style>
</head>
<body>
<div id="head" style="margin:1%;width:100%;height: 50%;background-color: #19aa8d">
    <div style="overflow:hidden;width:120px;height:120px;border: 1px solid #fff9ec;border-radius:60px;position: absolute;top:10%;left:15%;">
        <h1><img src="../../assets/img/ui-zac.jpg"></h1>
    </div>
    <div style="width:440px;height:140px;position: absolute;top:13%;left:30%;">
        <span style="color: #FFFFFF;font-family:'黑体';"><h3>${list.empname}</h3></span>
        <hr style="color: #FFFFFF;width: 500px;">
        <span style="color: #FFFFFF;font-family:'黑体';font-size:16px;margin-top:100px;">部门:${list.deptname}</span><br>
        <span style="color: #FFFFFF;font-family:'黑体';font-size:16px;margin-top:100px;">入职日期:${list.empstatedate}</span>
        <input value="${list.empstateid}" id="empstateid" style="display: none;">
    </div>
</div>
<div id="body" style="border-radius:10px;position: absolute;top:35%;left:8%;width:84%;height: 1000px;background-color: #ffffff">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header" style="margin-top: 20px;">
                    <div  style="margin-left: 470px"><h1>合同查看</h1></div>
                </div>
                <div class="layui-card-body">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-form-item" style="margin-top: 20px;">
                            <form class="layui-form" action="" id="ContractForm">
                                <%--实习合同--%>
                                <div id="IdOne">
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
                                                甲方(用人单位):代理人&nbsp;:&nbsp;<span style="color: #000000;">睿智集团</span><br>
                                                乙方(实习生)&nbsp;:&nbsp;<span  style="color: #000000;">${list.empname}</span><br>
                                                为明确实习学生与实习单位的责任与义务,根据《民法通则》、《中华人民共和国劳动法》、《中华人民共和国劳动合同法》及有关规定,甲乙双方在平等自愿的基础上签订本协议。<br> 　
                                                一、协议期限<br> 　　
                                                本协议自&nbsp;&nbsp;<span  style="color: #000000;">${list.empstatedate}</span>&nbsp;&nbsp;起至&nbsp;&nbsp;<span  style="color: #000000;">${list.conexpire}</span>&nbsp;&nbsp;止。<br> 　　
                                                二、实习岗位<br>
                                                甲方根据乙方的实际情况和工作需要,安排实习学生到规划实习生岗位实<br>
                                                习,乙方应按学校的教学内容及实习要求,努力完成实习任务。<br> 　　
                                                三、实习津贴<br>
                                                依照按劳取酬的原则,按甲方现行制度确定实习生的实习津贴。具体支付<br>
                                                方法如下:<br>
                                                实习津贴:&nbsp;&nbsp;<span  style="color: #000000;">${list.emppay}</span>&nbsp;&nbsp;元/月,其他补贴:根据实习生在岗工作表现,以奖金形式发放。<br>
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
                                                甲方签章&nbsp;:&nbsp;<span style="color: #000000;">睿智集团</span><br> 　　
                                                乙方签字&nbsp;:&nbsp;<span  style="color: #000000;">${list.empname}</span><br> 　　
                                                签订日期&nbsp;:&nbsp;<span  style="color: #000000;">${list.empstatedate}</span><br>　
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    $(function () {
                                        var aad=$("#empstateid").val();
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
                                                甲方(用人单位):代理人&nbsp;:&nbsp;<span style="color: #000000;">睿智集团</span><br>
                                                乙方(正式员工)&nbsp;:&nbsp;<span  style="color: #000000;">${list.empname}</span><br>
                                                为明确实习学生与实习单位的责任与义务,根据《民法通则》、《中华人民共和国劳动法》、《中华人民共和国劳动合同法》及有关规定,甲乙双方在平等自愿的基础上签订本协议。<br> 　
                                                一、协议期限<br> 　　
                                                本协议自&nbsp;&nbsp;<span  style="color: #000000;">${list.constart}</span>&nbsp;&nbsp;起至&nbsp;&nbsp;<span  style="color: #000000;">${list.conover}</span>&nbsp;&nbsp;止。<br> 　　
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
                                                甲方签章&nbsp;:&nbsp;<span style="color: #000000;">睿智集团</span><br> 　　
                                                乙方签字&nbsp;:&nbsp;<span  style="color: #000000;">${list.empname}</span><br> 　　
                                                签订日期&nbsp;:&nbsp;<span  style="color: #000000;">${list.constart}</span><br>　　
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="demoTable layui-form">
                        <div class="layui-inline">
                            <button class="layui-btn layui-btn-primary"  style="margin-top:30px;margin-left: 500px;" onclick="TurnDown()">返回</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    function TurnDown() {
        window.history.back();//返回上一页
    }
</script>