<%--
  Created by IntelliJ IDEA.
  User: YLP
  Date: 2018-10-18
  Time: 11:33
  To change this template use File | Settings | File Templates.
  简历的筛选，添加，导入，加入简历库
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>简历筛选</title>
    <script type="text/javascript" src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../assets/css/bootstrap.css" type="text/css">
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
</head>
<style>
    .layui-input-block{
        width: 200px;
    }
    .layui-form-label{
        width: auto;
    }
    .content{
        border: 0px solid #000000;
        width: 1000px;
        margin: 0px auto;
    }
    #batchUpload {
        margin-left: 500px;
        margin-top: -57px;
    }
    #fy {
        height: 40px;
        margin-left: 20px;
        margin-top: -10px

    }
    .fy1 {
        width: 35px;
        height: 30px;
        text-align: center;
        cursor: pointer;
        float: left;
        line-height: 30px;
        border-radius:5px;
        margin-left: 10px;

    }
    .fy2 {
        width: 100px;
        height: 30px;
        text-align: center;
        float: left;
        line-height: 30px;
        border-radius:5px;
        letter-spacing: 5px;
    }
</style>
<body>
<div class="panel panel-default" style="margin:1%">
    <!-- 多条件查询  -->
    <div class="panel-heading" style="height: 60px">
        <div class="layui-form">
            <div class="layui-form-item">
                <div class="layui-inline" style="margin: 0px;width: 200px">
                    <select id="education" >
                        <option value="">学历不限</option>
                        <option value="小学">小学</option>
                        <option value="初中">初中</option>
                        <option value="高中">高中</option>
                        <option value="大专">大专</option>
                        <option value="本科">本科</option>
                        <option value="博士">博士</option>
                    </select>
                </div>
                <div class="layui-inline" style="margin: 0px;width: 200px">
                    <select id="sex" >
                        <option value="">性别不限</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
                <div class="layui-inline" style="margin: 0px" >
                    <button style="border: 1px solid #e6e6e6;width: 30px;height: 37px;margin-left:-6px;" onclick="queryAllRes(1)"><i class="layui-icon">&#xe615;</i></button>
                </div>

                <div class="layui-inline" style="float: right" >
                    <button class="layui-btn" data-toggle="modal" data-target="#myModal">
                        <i class="layui-icon">&#xe642;</i>录入简历</button>
                    <button class="layui-btn" onclick="updareRes(1)">
                        <i class="layui-icon">&#xe608;</i> 加入简历库</button>
                    <button class="layui-btn" onclick="updareRes(3)">
                        <i class="layui-icon">&#xe640;</i>加入回收站</button>
                </div>
            </div>
        </div>
        <form enctype="multipart/form-data" id="batchUpload">
             <div class="layui-inline" style="margin-left: 50px" >
                 <input type="file" name="file" style="width: 170px;height: 100%;border: 1px solid #969696" id="file">
             </div>
             <div class="layui-inline" style="margin-left: -5px" >
                 <input type="button" class="layui-btn" onclick="uploadBtn()" value="上传简历">
             </div>
        </form>
    </div>
<!--table表格-->
    <div class="panel-body ">
        <div class="table-responsive">
            <table class="layui-table">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>手机号</th>
                    <th>QQ邮箱</th>
                    <th>学历</th>
                    <th>专业</th>
                    <th>应聘职位</th>
                    <th>录入时间</th>
                    <th>筛选状态</th>
                    <th>
                        <input type="checkbox" onclick="selectAll(this);" />操作
                    </th>
                </tr>
                </thead>
                <tbody id="mytab">
                <!--数据-->
                </tbody>
            </table>
        </div>
    </div>
<!--分页-->
    <div id="fy">
        <div id="prepage" class="fy1"><i class="layui-icon">&#xe603;</i></div><!--上一页-->
        <div class="fy1" style="background-color: #009688; color: #FFFFFF"><span id="nowPage"></span></div><!--第几页-->
        <div id="nextpage" class="fy1"><i class="layui-icon">&#xe602;</i></div><!--下一页-->
        <div class="fy2">共<span id="total"></span>条</div><!--条数-->
        <div class="fy2">共<span id="pages"></span>页</div><!--页数-->
    </div>


  <!-- 模态框添加（Modal） -->
    <div class="modal fade" id="myModal" >
        <div class="modal-dialog" style="width: 700px;" >
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"  style="font-size:28px;font-weight:bold;font-family:'楷体';margin-left: 50px">
                       添加简历
                    </h4>
                </div>
                <div class="modal-body">
                <div class="content">
                    <form class="layui-form" id="updateResForm" >
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-block">
                                <input name="resumename" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <input name="sex" value="男"  title="男" type="radio" checked>
                                <input name="sex" value="女"  title="女" type="radio">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">年龄</label>
                            <div class="layui-input-block">
                                <input name="age" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input name="phone" class="layui-input" >
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">QQ邮箱</label>
                            <div class="layui-input-block">
                                <input name="emali" class="layui-input" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">应聘职位</label>
                            <div class="layui-input-block">
                                <input name="resposition" class="layui-input" >
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学历</label>
                            <div class="layui-input-block">
                                <input name="education" class="layui-input" placeholder="最高学历">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">专业</label>
                            <div class="layui-input-block">
                                <input name="resmajor" class="layui-input" >
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">录入时间</label>
                            <div class="layui-input-block">
                                <input name="resdate" id="resdate" class="layui-input" >
                            </div>
                        </div>
                    </div>
                        <div  style="display: none">
                            <label class="layui-form-label">简历状态</label>
                            <div class="layui-input-inline">
                                <input name="resstate" value="0" class="layui-input" >
                            </div>
                        </div>
                        <input type="button" class="layui-btn layui-btn-fluid" onclick="addRes()" value="录入"
                               style="width: 300px;margin-left: 200px;letter-spacing:15px;"/>

                    </form>
                </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</div>
</body>
<script>

    //添加表单属性
    layui.use(['form', 'layedit', 'laydate'], function(){ });
    //自动查询
    $(function(){
        queryAllRes(1);
        //$("#myModal").modal("show");//模态框开启
    });
    //查看简历
    function queryAllRes(pageNum) {
        var xueli=$("#education").val();
        var xingbie=$("#sex").val();
        $.ajax({
            url: "queryAllResYLP",
            type: "post",
            data:{resstate:0,education:xueli,sex:xingbie,pageNum:pageNum},
            dataType: "json",
            async:false,
            success: function (data) {
               $("#mytab").html("");
                for ( var i = 0; i < data.list.length; i++) {
                    var tr="<tr>";
                    tr+="<td>"+data.list[i].resid+"</td>";
                    tr+="<td>"+data.list[i].resumename+"</td>";
                    tr+="<td>"+data.list[i].sex+"</td>";
                    tr+="<td>"+data.list[i].age+"</td>";
                    tr+="<td>"+data.list[i].phone+"</td>";
                    tr+="<td>"+data.list[i].emali+"</td>";
                    tr+="<td>"+data.list[i].education+"</td>";
                    tr+="<td>"+data.list[i].resmajor+"</td>";
                    tr+="<td>"+data.list[i].resposition+"</td>";
                    tr+="<td>"+data.list[i].resdate+"</td>";
                    if(+data.list[i].resstate==0){data.list[i].resstate="未筛选"}
                    if(+data.list[i].resstate==1){data.list[i].resstate="已入库"}
                    if(+data.list[i].resstate==2){data.list[i].resstate="待面试"}
                    if(+data.list[i].resstate==3){data.list[i].resstate="回收站"}
                    tr+="<td>"+data.list[i].resstate+"</td>";
                    tr+="<td><input class='resid' type='checkbox' value='"+data.list[i].resid+"' /></td>";
                    tr+="</tr>";
                    $("#mytab").append(tr);
                }
                $("#nowPage").html(data.pageNum);
                $("#total").html(data.total);//总条数
                $("#pages").html(data.pages);//总页数
            }
        })
    }



    $("#prepage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllRes(nowPage-1);
    });
    $("#nextpage").click(function(){
        //得到下一页的页码
        var nowPage=parseInt($("#nowPage").html());
        queryAllRes(nowPage+1);
    });

    //全选
    function selectAll(checkbox) {
        $('input[type=checkbox]').prop('checked', $(checkbox).prop('checked'));
    }


    //筛选加入简历库
    function updareRes(obj) {
        var str="";
        //获取到所有的被选中的复选框
        $(".resid").each(function(){
            if($(this).prop("checked")==true){
                var jsonStr=$(this).val();
                 str+=jsonStr+",";
            }
        });
        $.ajax({
            url:"updateResOneYLP",
            type:"post",
            data:{resstate:obj, s:str},
            dataType:"text",
            success:function(data){
                if(data=="true"){alert("执行成功");}
                queryAllRes(1);
            }
        });
    }

    //上传简历
    function uploadBtn() {
        var file = $("#file").val();
        if(file == ''){
            alert("请选择excel,再上传");
        }else if(file.lastIndexOf(".xls")<0){
            alert("只能上传Excel文件");
        }else {
            //获取form 表单内容
            var form = document.getElementById("batchUpload");
            //获取form表单中第一个 input type是file的的对象
            var file=$('input[type=file]')[0].files[0];
            var fm = new FormData(form);
            fm.append('file', file);
            $.ajax({
                url: "uploadYlp",
                type: "post",
                data: fm,
                contentType: false, //禁止设置请求类型
                processData: false, //禁止jquery对DAta数据的处理,默认会处理
                //禁止的原因是,FormData已经帮我们做了处理
                success: function (result) {
                    if (result=="true"){
                        $("#file").val("")
                        queryAllRes(1);
                        alert("导入简历成功");
                    }else {
                        alert("导入简历错误，请检查Excel文件是否正确");
                    }
                }
            });
        }
    }

    //录入简历
    function addRes() {
        $.ajax({
            url:"addResEnteringYlP",
            type:"post",
            data:$("#updateResForm").serialize(),
            dataType: "text",
            success:function(data) {
                if(data=="true"){alert("录入成功");}
                queryAllRes()
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
    if(month<=9){ month = "0"+month; }
    if(day<=9){ day = "0"+day; }
    if(hour<=9){ hour = "0"+hour; }
    if(min<10){ min="0"+min;}
    if(second<10){second="0"+second; }
    var recreachdate=year+"-"+month+"-"+day;
    $("#resdate").val(recreachdate);//简历时间


</script>
</html>
