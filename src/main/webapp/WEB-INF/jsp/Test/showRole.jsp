<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: XBJ
  Date: 2018-10-18
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>DASHGUM - Bootstrap Admin Template</title>

    <link href="../../../assets/css/bootstrap.css" rel="stylesheet">

    <link href="../../../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="../../../assets/css/style.css" rel="stylesheet">
    <link href="../../../assets/css/style-responsive.css" rel="stylesheet">
    <script type="text/javascript" src="../../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../../assets/layui/css/layui.css">

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>

<body>



<div class="showback">
    <h4></h4><br>
    <div class="btn-group btn-group-justified">
        <div class="btn-group">
            <a href="/config/permissionconfig"> <button type="button" class="btn btn-theme">员工管理</button></a>
        </div>
        <div class="btn-group">
            <button type="button" class="btn btn-theme">角色管理</button>
        </div>
        <div class="btn-group">
            <a href="/config/queryMenuX"><button type="button" class="btn btn-theme">菜单管理</button></a>
        </div>
    </div>
</div><!--/showback -->




<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#RoleModal" style="margin-left: 1200px" onclick="addRole()">
    <i class="layui-icon layui-icon-add-circle" style="font-size: 16px; color:#FFFFFF;">添加角色</i>
</button>

<div class="modal fade" id="RoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">添加角色</h4>


            </div>
            <div class="modal-body" >


                <form class="layui-form" action="">

                    <div class="layui-form-item">

                        <div class="layui-input-block" >
                            <i class="layui-icon layui-icon-face-smile" style="font-size: 15px; color: #1E9FFF;">角色名称</i>
                         <br/>  <br/>  <input id="rolename" required  lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
                            <br/>      <i class="layui-icon layui-icon-group" style="font-size: 15px; color: #1E9FFF;">配置权限</i>
                            <br/>    <div id="addrp">


                                      </div>
                        </div>
                    </div>


                </form>
                <script>
                    layui.use('form', function(){

                    });
                </script>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary"  onclick="saveaddRole()" >保存</button>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">拥有权限</h4>
            </div>
            <div class="modal-body" >
                编辑权限

                <form class="layui-form" action="">

                    <div class="layui-form-item">

                        <div class="layui-input-block" id="showrole">


                        </div>
                    </div>

                </form>
                <script>
                    layui.use('form', function(){

                    });
                </script>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary"  onclick="savePermission()" >保存</button>
            </div>
        </div>
    </div>
</div>

<div class="row mt">
    <div class="col-md-12">
        <div class="content-panel">

            <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i> 角色详情</h4>
                <hr>
                <thead>

                <tr>
                    <th><i class="fa fa-bullhorn"></i>角色id</th>
                    <th ><i class="fa fa-question-circle"></i> 角色名称</th>
                    <th><i class="fa fa-bookmark"></i>角色拥有权限</th>
                    <th><i class=" fa fa-edit"></i> 操作</th>

                </tr>
                </thead>
                <tbody>

            <c:forEach items="${role}" var="role">

                <tr>
                 <td>${role.roid}</td>
                    <td>${role.roname}</td>
                    <td>
                       <%-- <c:forEach items="${rm[role]}" var="rm" varStatus="status" >--%>
                            <div class="layui-form-item">

                                <div class="layui-input-block">
                                    <c:forEach items="${rm[role]}" var="rm" varStatus="status" >
<i  class="layui-icon layui-icon-auz" style="font-size:16px; color:#406762;">&nbsp;&nbsp; ${rm.name}&nbsp;&nbsp;</i>
                                        <c:if test="${status.count%8==0}">
                                       <br>
                                   </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        <%--    ${status.count} ${rm.name}--%>





                    </td>
                    <td><button class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal" onclick="editRole(${role.roid})" ><i class="fa fa-pencil"></i></button>
                    </td>

                </tr>

            </c:forEach>





                </tbody>
            </table>

        </div><!-- /content-panel -->
    </div><!-- /col-md-12 -->
</div><!-- /row -->



<!-- js placed at the end of the document so the pages load faster -->
<script src="../../../assets/js/jquery.js"></script>
<script src="../../../assets/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript" src="../../../assets/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="../../../assets/js/jquery.scrollTo.min.js"></script>
<script src="../../../assets/js/jquery.nicescroll.js" type="text/javascript"></script>


<!--common script for all pages-->
<script src="../../../assets/js/common-scripts.js"></script>

<!--script for this page-->

<script>
    //custom select box
     var roid="";
   function  editRole(obj){
       roid=obj;
       $.ajax({
          url:'/config/queryallPermissionX',
           type:'post',
           dataType:'json',
           async:false,
           success:function (data) {
               var input="";
               for(var i=0;i<data.length;i++){

                   input+="<input type='checkbox' value='"+data[i].pid+"' id='"+data[i].pid+"' class='rc' title='"+data[i].name+"'>";

               }
               $("#showrole").html(input);
               layui.use('form', function(){
                   var form=layui.form;
                   form.render();
               });
           }
       })
       $.ajax({
           url:'/config/queryRolePermissionByRoleIdX',
           type:'post',
           data:{
               'roid':obj
           },
           dataType:'json',
           success:function (data) {
               for(var i=0;i<data.length;i++){
                   $("#"+data[i].pid).prop('checked', true);
               }
               layui.use('form', function(){
                   var form=layui.form;
                   form.render();
               });

           }})

    }
   function savePermission() {

       var endpidstr="";

       $(".rc").each(function () {
           if($(this).prop("checked")==true){
               endpidstr+=$(this).val()+",";
           }
       })

       $.ajax({
           url:'/config/saveRolePermissionX',
           type:'post',
           data:{
               'endpidstr':endpidstr,
               'roid':roid
           },
           dataType:'text',
           success:function (data) {
               if(data=="ok"){
                  window.location.href="/config/showRole";
               }
           }})
   }

    function addRole() {
        $.ajax({
            url:'/config/queryallPermissionX',
            type:'post',
            dataType:'json',
            async:false,
            success:function (data) {
                var input="";
                for(var i=0;i<data.length;i++){
                    input+="<input type='checkbox' value='"+data[i].pid+"' id='"+data[i].pid+"' class='rcpp' title='"+data[i].name+"'>";
                }
               $("#addrp").html(input);
                layui.use('form', function(){
                    var form=layui.form;
                    form.render();
                });
            }
        })
    }
    function saveaddRole() {

         var addrolepid="";
        $(".rcpp").each(function () {
            if($(this).prop("checked")==true){
                addrolepid+=$(this).val()+",";
            }
        })

          $.ajax({
              url:'/config/addRoleX',
              data:{
                  'pidstr':addrolepid,
                   'roname':$("#rolename").val()
              },
              dataType:'text',
              success:function (data) {
                  if(data=="okokoko"){
                      window.location.href="/config/showRole";
                  }
              }


          })

    }

</script>

</body>
</html>
