<%--
  Created by IntelliJ IDEA.
  User: SJP
  Date: 2018/10/15 0015
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="../../assets/js/jquery.js"></script>
    <script type="text/javascript" src="../../assets/layui/layui.js"></script>
    <link rel="stylesheet" href="../../assets/layui/css/layui.css">
    <style>
        #stable{
            position: absolute;
            left: 70px;
            top:30px;
        }
       .sinp{
           BORDER-TOP-STYLE: none;
           BORDER-RIGHT-STYLE: none;
           BORDER-LEFT-STYLE:none;
           BORDER-BOTTOM-STYLE:solid;
           text-align:center;
           width:30px;
       }
        input:focus{
            border-color:#009688;
        }
        .strs{
            position: relative;
            right: 20px;
        }
        .strs1{
            position: relative;
            right: 20px;
           top:550px;
        }
        #sdiv{
            position: relative;
            right: -90px;
        }
        #stab{
            position: relative;
            right: -250px;
        }
        #sbutn{
        position: fixed;
         bottom: 85px;
         left:470px;
        }
    </style>
</head>
<body>
<table id="stable">
    <form id="smyform">
    <tr class="strs"><td><span style="font-size:24px;color:#009688">薪资计算规则</span><hr style="width:1200px"/></td></tr>
       <tr><td id="stt">缺勤扣款 = 基本工资 × <input class="sinp" id="skk1"/>/<input class="sinp" id="skid1"/>× 缺勤天数</td></tr>
    <tr><td id="stt1">事假扣款 = 基本工资 × <input class="sinp" id="skk2"/>/<input class="sinp" id="skid2"/>/<input class="sinp" id="skidd2">× 事假折算出的小时数</td></tr>
    <tr><td id="stt2">病假扣款 = 基本工资 × <input class="sinp" id="skk3"/>/<input class="sinp" id="skid3" />/<input class="sinp" id="skidd3" />× 病假折算出的小时数</td></tr>
    <tr><td id="stt3">加班工资= 基本工资 × <input class="sinp" id="skk4"/>/<input class="sinp" id="skid4"/>/<input class="sinp" id="skidd4"/>× (平时加班 × <input class="sinp" id="ski4"/> + 周末加班×<input class="sinp" id="sk4"/> + 法定加班 × <input class="sinp" id="skd4" />)</td></tr>
    <tr><td id="stt4">绩效工资= 基本工资 × <input class="sinp" id="skk5"/> × 绩效考核结果<input class="sinp" id="skid5" /></tr>
    <tr class="strs1">
        <td><span style="font-size:24px;color:#009688">迟到扣款规则</span><hr style="width:1200px"/>
            <table id="stab">
                <tbody id="stabody"></tbody>
            </table>
            <div id="sdiv" style="background-color:#A6FFFF;width:800px;height:43px;text-align: center">
            <span style="font-size:24px;color:white" class="layui-icon">
             &#xe654 添加规则</span>
            </div>
        </td>
    </tr>
    </form>
</table>
<div id="sbutn"><button class="layui-btn" onclick="ssub()">保存</button></div>
</body>
</html>
<script>
    $(function(){

        sxinzi();
        sgeetda();
        sgetkoukuan();
        syanzheng();
    })
    function sgeetda(){
        $.ajax({
            url:'getpaysjp',
            type:'post',
            dataType:'json',
            success:function(data){
                for(var i=0;i<data.length;i++) {

                    if(i==0){
                        $("#skk1").val(data[i].payrbase);
                        $("#skid1").val(data[i].payrdays);
                    }else if(i==1){
                        $("#skk2").val(data[i].payrbase);
                        $("#skid2").val(data[i].payrdays);
                        $("#skidd2").val(data[i].payrhour);
                    }else if(i==2){
                        $("#skk3").val(data[i].payrbase);
                        $("#skid3").val(data[i].payrdays);
                        $("#skidd3").val(data[i].payrhour);
                    }else if(i==3){
                        $("#skk4").val(data[i].payrbase);
                        $("#skid4").val(data[i].payrdays);
                        $("#skidd4").val(data[i].payrhour);
                        $("#ski4").val(data[i].payrpacific);
                        $("#sk4").val(data[i].payrweekend);
                        $("#skd4").val(data[i].payrlegal);
                    }else if(i==4){
                        $("#skk5").val(data[i].payrbase);
                        $("#skid5").val(data[i].payjixiao);
                    }
                }}
        })
    }
    function sgetkoukuan() {
        $.ajax({
            url:'getlatesjp',
            type:'post',
            dataType:'json',
            success:function(data) {
                if(data!=null){
                    for (var i = 0; i < data.length; i++) {
var tr="<tr id='str'><td>迟到<input name='sinp' class='sinp' onkeyup=\"if(isNaN(value))execCommand('undo')\" onafterpaste=\"if(isNaN(value))execCommand('undo')\" id='sfz"+i+"'/></td> <td>分钟到<input name='sinput2' class='sinp' onkeyup=\"if(isNaN(value))execCommand('undo')\" onafterpaste=\"if(isNaN(value))execCommand('undo')\" id='sfzz"+i+"'/></td><td>分钟," +
     "每次扣款 <input name='sinput3' class='sinp' onkeyup=\"if(isNaN(value))execCommand('undo')\" onafterpaste=\"if(isNaN(value))execCommand('undo')\" id='sprice"+i+"'/> 元</td>" +
    " <td onclick='sdel(this)'><div class='layui-btn layui-btn-sm layui-btn-radius layui-btn-danger'> 删除 </div></td></tr>";
            $("#stabody").append(tr);
          $("#sfz"+i+"").val(data[i].latone);
          $("#sfzz"+i+"").val(data[i].lattwo);
          $("#sprice"+i+"").val(data[i].latpunish);
                    }
                }
                }
            })
    }

    function sxinzi(){
        $("#sdiv").hover(function(){
            $("#sdiv").css('background-color','#009688');
        },function () {
            $("#sdiv").css('background-color','#A6FFFF');
        })
    }
    function syanzheng(){
        $(".sinp").attr("onkeyup","if(isNaN(value))execCommand('undo')");
        $(".sinp").attr("onafterpaste","if(isNaN(value))execCommand('undo')");
    }
    $("#sdiv").click(function () {

        var tr="<tr id='str'><td>迟到 <input name='sinput1' class='sinp' onkeyup=\"if(isNaN(value))execCommand('undo')\" onafterpaste=\"if(isNaN(value))execCommand('undo')\" /></td> <td>分钟到<input name='sinput2' class='sinp' onkeyup=\"if(isNaN(value))execCommand('undo')\" onafterpaste=\"if(isNaN(value))execCommand('undo')\" /></td><td>分钟," +
            "每次扣款 <input name='sinput3' class='sinp' onkeyup=\"if(isNaN(value))execCommand('undo')\" onafterpaste=\"if(isNaN(value))execCommand('undo')\" /> 元</td>" +
            " <td onclick='sdel(this)'><div class='layui-btn layui-btn-sm layui-btn-radius layui-btn-danger'> 删除 </div></td></tr>";
        $("#stabody").append(tr);
    })
    function sdel(obj){
      $(obj).parents("#str").remove();
    }
    function ssub(){
        syanzheng11();
        saddpay();
        skkuan();

    }
function syanzheng11(){
    $("input").each(function() {
        var s=$(this).val();
        if(Number(s)==0){
            alert("不能有空")
        }
    })
    }
    function saddpay() {
       var shangone=new Array();
       var shangtwo=new Array();
       var shangthree=new Array();
       var shangfour=new Array();
       var shangfive=new Array();
       for(var i=0;i<2;i++){
           shangone[i]=$("#stt").find('input:eq("'+i+'")').val();
           shangfive[i]=$("#stt4").find('input:eq("'+i+'")').val();
        }
        for(var i=0;i<3;i++){
            shangtwo[i]=$("#stt1").find('input:eq("'+i+'")').val();
            shangthree[i]=$("#stt2").find('input:eq("'+i+'")').val();
        }
        for(var i=0;i<6;i++){
            shangfour[i]=$("#stt3").find('input:eq("'+i+'")').val();
        }
        $.ajax({
            url:'addlatesjp',
            type:'post',
            data:{shangone:shangone.toString(),
                shangtwo:shangtwo.toString(),
                shangthree:shangthree.toString(),
                shangfour:shangfour.toString(),
                shangfive:shangfive.toString()
            },
            dataType:'json',
            success:function(data){

            }
        })
    }
    function skkuan(){
        var latone=new Array();
        var lattwo=new Array();
        var latpunish=new Array();
        var i=0;
        $("#stab tr").each(function () {
           latone[i]=$(this).find('td:eq(0) input').val();
            lattwo[i]=$(this).find('td:eq(1) input').val();
            latpunish[i]=$(this).find('td:eq(2) input').val();
            i++;
        })
        $.ajax({
            url:'updlatesjp',
            type:'post',
            data:{lat1:latone.toString(),
                lat2:lattwo.toString(),
                latp:latpunish.toString()
            },
            dataType:'json',
            success:function(data){
               if(data==true){
               window.location.reload();
               }
            }
        })
    }
</script>