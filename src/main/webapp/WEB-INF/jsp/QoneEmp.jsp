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
        .body-tab-item-div-left{
            /*border: 1px solid #000000;*/
            width: 300px;
            position: absolute;
            left: 220px;
            top: 120px;
        }
        .body-tab-item-div-left div{
            margin:0 auto;
            margin-top:30px;
        }
        .div-lablel{
            font-size: 15px;
        }
        .div-span{
            font-size: 14px;
            color: #7f8c9a;
        }
        .body-tab-item-div-right{
           /*border: 1px solid #000000;*/
            width: 300px;
            position: absolute;
            left: 620px;
            top: 120px;
            margin:0 auto
        }
        .body-tab-item-div-right div{
            margin:0 auto;
            margin-top:30px;
        }
        .div-span input{
            height: 30px;
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
        <div  id="body" style="border-radius:10px;position: absolute;top:40%;left:8%;width:84%;height: 800px;background-color: #ffffff">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title" style=" margin-top:40px ;margin-left: 20%;">
                    <li class="layui-this">基础信息</li>
                    <li>合同信息</li>
                    <li>教育经历</li>
                    <li>工作经历</li>
                    <li>社保福利</li>
                </ul>
                <div class="layui-tab-content" style="height: 100px;">
                    <div class="layui-tab-item layui-show">
                        <div class="body-tab-item-div-left">
                            <div style="width: 300px;">
                                <label class="div-lablel">姓名:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.empname}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">工号:</label>&nbsp;&nbsp;&nbsp;
                                <span  class="div-span">${list.empnumber}</span>
                            </div>
                            <div style="width: 300px;">
                                <label class="div-lablel">薪资:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.emppay}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">证件类型:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.typename}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">证件号:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.idnumber}</span>
                            </div>
                            <div style="width: 300px;">
                                <label class="div-lablel">性别:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.sex}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">出生日期:</label>&nbsp;&nbsp;&nbsp;
                                <span  class="div-span">${list.birthdate}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">民族:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.nation}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">户口类型:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.accounttype}</span>
                            </div>
                            <div style="width: 300px;">
                                <label class="div-lablel">学历:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.eduname}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">住址:</label>&nbsp;&nbsp;&nbsp;
                                <span  class="div-span">${list.address}</span>
                            </div>
                            <div style="width: 300px;">
                                <label class="div-lablel">备注:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.empnotes}</span>
                            </div>

                        </div>
                        <div class="body-tab-item-div-right">
                            <div style="width: 300px;">
                                <label  class="div-lablel">政治面貌:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.politics}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">QQ:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.qqnumber}</span>
                            </div>
                            <div style="width: 300px;">
                                <label class="div-lablel">电话:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.phone}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">邮箱:</label>&nbsp;&nbsp;&nbsp;
                                <span  class="div-span">${list.email}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">紧急联系人:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.urgencyname}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">紧急联系人电话:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.urgencyphone}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">部门:</label>&nbsp;&nbsp;&nbsp;
                                <span  class="div-span">${list.deptname}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">职务:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.posname}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">员工类型:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.emptype}</span>
                            </div>
                            <div style="width: 300px;">
                                <label  class="div-lablel">入职日期:</label>&nbsp;&nbsp;&nbsp;
                                <span class="div-span">${list.empstatedate}</span>
                            </div>
                        </div>
                    </div>
                    <div class="layui-tab-item">内容2</div>
                    <div class="layui-tab-item">内容3</div>
                    <div class="layui-tab-item">内容4</div>
                    <div class="layui-tab-item">内容5</div>
                    </div>
                </div>
            </div>
            <script>
                layui.use('element', function(){
                    var $ = layui.jquery
                        ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
                });
            </script>


    </div>

</body>
</html>
