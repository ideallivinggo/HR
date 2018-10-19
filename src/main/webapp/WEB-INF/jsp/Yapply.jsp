<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-10-14
  Time: 22:26
  To change this template use File | Settings | File Templates.
  招聘申请管理
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>招聘申请</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../assets/css/bootstrap.css" type="text/css">
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
</head>
<style>
    .layui-inline{
        margin-left: 50px;
    }
    .layui-form-label{
        width: auto;
    }
    .content{
        border: 0px solid #000000;
        width: 1000px;
        margin: 0px auto;
    }
    .biaoti{
        height: 40px;
        text-align: center;
        line-height: 40px;
        font-size: 20px;
        letter-spacing:15px;
        color: #22AD91;
        background-color: #F4F4F4;
        margin: 5px;
    }
</style>
<body>
    <button class="layui-btn" data-toggle="modal" data-target="#myModal">
        <i class="layui-icon">&#xe608;</i> 添加
    </button>
  <table class="layui-table">
     <colgroup>
         <col width="70">
    </colgroup>
    <thead>
    <tr>
        <th>编号</th>
        <th>招聘部门</th>
        <th>招聘职务</th>
        <th>招聘人数</th>
        <th>工作地址</th>
        <th>发布时间</th>
        <th>性别要求</th>
        <th>学历要求</th>
        <th>年龄要求</th>
        <th>工作经验</th>
        <th>专业要求</th>
        <th>其他要求</th>
        <th>审批状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="mytab">
      <!--数据-->
    </tbody>
  </table>



<!-- 模态框添加（Modal） -->
<div class="modal fade" id="myModal" >
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                    添加招聘申请
                </h4>
            </div>
            <div class="modal-body">
            <div class="content">
            <form class="layui-form" id="addRecForm" >
                <p class="biaoti">招聘申请</p>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label"> 招聘部门</label>
                        <div class="layui-input-block" style="width: 300px">
                            <select name="deptid" class="deptsel"></select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">汇报对象</label>
                        <div class="layui-input-block" style="width: 300px">
                            <select name="empid" class="empsel"></select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">招聘职务</label>
                        <div class="layui-input-block" style="width: 300px">
                            <select name="poid" class="possel"></select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">招聘人数</label>
                        <div class="layui-input-block" style="width: 300px">
                            <input name="recnumber" class="layui-input" >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">工作地点</label>
                        <div class="layui-input-block" style="width: 300px">
                            <input name="recaddress" class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">发布时间</label>
                        <div class="layui-input-block" style="width: 300px">
                            <input name="recreachdate" class="layui-input" id="recreachdate1" >
                        </div>
                    </div>
                </div>
                <p class="biaoti">招聘要求</p>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">学历要求</label>
                        <div class="layui-input-block" style="width: 300px">
                            <input name="receducation" class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">工作经验</label>
                        <div class="layui-input-block" style="width: 300px">
                            <input name="recsuffer" placeholder="多少年" class="layui-input" >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">年龄要求</label>
                        <div class="layui-input-block" style="width: 300px">
                            <input name="recage" placeholder="××～××" class="layui-input" >
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">性别要求</label>
                        <div class="layui-input-block" style="width: 300px">
                            <input name="recsex" value="不限" title="不限" checked type="radio">
                            <input name="recsex" value="男" title="男" type="radio">
                            <input name="recsex" value="女" title="女" type="radio">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">专业要求</label>
                        <div class="layui-input-block" style="width: 300px">
                            <input name="recmajor" class="layui-input" >
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-inline">
                        <label class="layui-form-label">其他要求</label>
                        <div class="layui-input-block" style="width: 770px;">
                            <input name="recrequire" class="layui-input" >
                        </div>
                    </div>

                </div>
                <div class="layui-form-item" style="display: none">
                    <div  style="display: none">
                        <label class="layui-form-label">申请状态</label>
                        <div class="layui-input-inline">
                            <input name="recstate" value="0" class="layui-input" >
                        </div>
                    </div>
                </div>
                <input type="button" class="layui-btn layui-btn-fluid" onclick="addRec()" value="添加"/>
            </form>
            </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- 模态框修改（Modal） -->
<div class="modal fade" id="myModal2" >
    <div class="modal-dialog" style="width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                    修改招聘申请
                </h4>
            </div>
            <div class="modal-body">
                <div class="content">
                    <form class="layui-form" id="updateRecForm" >
                        <p class="biaoti">招聘申请</p>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label"> 招聘部门</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input id="deptname" class="layui-input" disabled="disabled" >
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">汇报对象</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input id="empname" class="layui-input" disabled="disabled" >
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">招聘职务</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input id="posname" class="layui-input" disabled="disabled" >
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">招聘人数</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input class="layui-input" id="recnumber" disabled="disabled" >
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">工作地点</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input class="layui-input" id="recaddress" disabled="disabled" >
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">发布时间</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input name="recreachdate" class="layui-input" id="recreachdate2" disabled="disabled">
                                </div>
                            </div>
                        </div>
                        <p class="biaoti">招聘要求</p>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">学历要求</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input name="receducation" class="layui-input" id="receducation">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">工作经验</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input name="recsuffer" placeholder="多少年" class="layui-input" id="recsuffer">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">年龄要求</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input name="recage" placeholder="××～××" class="layui-input" id="recage">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">性别要求</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input name="recsex" class="aa" value="不限" id="buxian" title="不限"  type="radio" >
                                    <input name="recsex" class="aa"  value="男" id="nan" title="男" type="radio">
                                    <input name="recsex" class="aa" value="女" id="nv" title="女"   type="radio">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">专业要求</label>
                                <div class="layui-input-block" style="width: 300px">
                                    <input name="recmajor" class="layui-input" id="recmajor">
                                </div>
                            </div>
                        </div>
                        <div class="layui-form-item layui-form-text">
                            <div class="layui-inline">
                                <label class="layui-form-label">其他要求</label>
                                <div class="layui-input-block" style="width: 770px;">
                                    <input name="recrequire" class="layui-input"id="recrequire" >
                                </div>
                            </div>

                        </div>
                        <div class="layui-form-item" style="display: none">
                            id<input name="recid" id="recid">
                        </div>
                        <input type="button" class="layui-btn layui-btn-fluid" onclick="updateRec()" value="修改"/>
                    </form>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    //添加表单属性
    layui.use(['form', 'layedit', 'laydate'], function(){ });

    //自动查询
    $(function(){
        AllForeignKey();
        queryAllRec();
       //$("#myModal").modal("show");//模态框开启
    });
    //申请招聘的所有外键
    function AllForeignKey() {
        //查看要招聘的职位
        $.ajax({
            url: "queryAllPosYLP",
            type: "post",
            dataType: "json",
            success: function(data) {
                $(".possel").html("");
                for ( var i = 0; i < data.length; i++) {
                    var op = "<option value="+data[i].poid+">" +data[i].posname+ "</option>";
                    $(".possel").append(op);
                }
            }
        });
        //查看部门
        $.ajax({
            url: "queryAllDeptYLP",
            type: "post",
            dataType: "json",
            success: function(data) {
                $(".deptsel").html("");
                for ( var i = 0; i < data.length; i++) {
                    var op = "<option value="+data[i].deptid+">" +data[i].deptname+ "</option>";
                    $(".deptsel").append(op);
                }
            }
        });
        //查看汇报人
        $.ajax({
            url: "queryAllEmpYLP",
            type: "post",
            dataType: "json",
            success:function(data) {
                $(".empsel").html("");
                for ( var i = 0; i < data.length; i++) {
                    var op = "<option value="+data[i].empid+">" +data[i].empname+ "</option>";
                    $(".empsel").append(op);
                }
            }
        });

    }

    //查看招聘申请
    function queryAllRec() {
        $.ajax({
            url: "queryAllRecYLP",
            type: "post",
            dataType: "json",
            success: function (data) {
               // alert(data);
                $("#mytab").html("");
                for ( var i = 0; i < data.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data[i].recid+"</td>";
                    tr+="<td>"+data[i].deptname+"</td>";
                    tr+="<td>"+data[i].posname+"</td>";
                    if(data[i].recnumber==undefined){   data[i].recnumber=" ";   }
                    tr+="<td>"+data[i].recnumber+"</td>";
                    tr+="<td>"+data[i].recaddress+"</td>";
                    tr+="<td>"+data[i].recreachdate+"</td>";
                    tr+="<td>"+data[i].recsex+"</td>";
                    tr+="<td>"+data[i].receducation+"</td>";
                    tr+="<td>"+data[i].recage+"</td>";
                    tr+="<td>"+data[i].recsuffer+"</td>";
                    tr+="<td>"+data[i].recmajor +"</td>";
                    tr+="<td>"+data[i].recrequire+"</td>";
                    if(+data[i].recstate==0){data[i].recstate="未审核"}
                    if(+data[i].recstate==1){data[i].recstate="已审核"}
                    if(+data[i].recstate==2){ data[i].recstate="撤除"}
                    tr+="<td>"+data[i].recstate+"</td>";
                    tr+="<td>";
                    tr+="<button onclick='delRec("+data[i].recid+")'>删除</button>&nbsp;&nbsp;";
                    tr+="<button data-toggle='modal' data-target='#myModal2' onclick='queryOneRec("+data[i].recid+")'>修改</button>";
                    tr+="</td>";
                    tr+="</tr>";
                    $("#mytab").append(tr);
                }

            }
        })
    }

    //查看单个详情
    function queryOneRec(obj) {
        $.ajax({
            url: "queryAllRecYLP",
            data:{recid:obj},
            type: "post",
            dataType: "json",
            success: function (data) {
                $("#recid").val(data[0].recid)
                $("#deptname").val(data[0].deptname)
                $("#empname").val(data[0].empname)
                $("#posname").val(data[0].posname)
                $("#recnumber").val(data[0].recnumber)
                $("#recaddress").val(data[0].recaddress)
                $("#recreachdate").val(data[0].recreachdate)
                $("#recsex").val(data[0].recsex)
                $("#receducation").val(data[0].receducation)
                $("#recage").val(data[0].recage)
                $("#recmajor").val(data[0].recmajor)
                $("#recsuffer").val(data[0].recsuffer)
                $("#recrequire").val(data[0].recrequire)
                $("#recstate").val(data[0].recstate)

                //$("input[value=sexylp]").attr('checked','true');
               // $("input[value='女']").attr('checked','true');
                //var xb=data[0].recsex;
                //$("input:radio[value='"+xb+"']").attr('checked','true');
            }
        })
    }



    //修改招聘需求
    function updateRec() {
        $.ajax({
            url:"updateRecYLP",
            type:"post",
            data:$("#updateRecForm").serialize(),
            dataType: "text",
            success:function(data) {
                if(data=="true"){alert("修改成功");}
                queryAllRec();
                $("#myModal2").modal("hide");
            }
        })
    }
    //添加招聘申请
    function addRec() {
        $.ajax({
            url:"addRecYLP",
            type:"post",
            data:$("#addRecForm").serialize(),
            dataType: "text",
            success:function(data) {
                if(data=="true"){alert("申请成功");}
                queryAllRec();
                $("#myModal").modal("hide");
            }
        })
    }






    //系统时间
    var date=new Date();
    var year=date.getFullYear();//年
    var month=date.getMonth()+1;//月
    var day=date.getDate();//日
    var hour=date.getHours();//时
    var min=date.getMinutes();//分
    var second=date.getSeconds();//秒
    if(min<10){ min="0"+min;}
    if(second<10){second="0"+second; }
    var recreachdate=year+"-"+month+"-"+day;
    $("#recreachdate1").val(recreachdate);//申请时间
    $("#recreachdate2").val(recreachdate)



</script>
</html>
