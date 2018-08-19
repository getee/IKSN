<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>

    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <base href="<%=basePath%>">

    <link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->

    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>


    <style type="text/css">
        .numbers{
            display: inline-block;
            width: 10%;
            text-align: center;
            background: #eee;
            color: #666;
            margin-right: 10%;
        }
        /*
  重置手机号
*/
        #bind-phone .col-xs-no{
            padding: 0;
        }
        .phone-code{
            display: inline-block;
            background-color: #FFFFFF;
            border: 1px solid #CA0C16;
            border-radius: 4px;
            width:100px;
            height: 36px;
            font-size: 14px;
            color: #CA0C16;
            letter-spacing: 0;
            cursor: pointer;
            line-height: 35px;
            text-align: center;
        }
        .code-gray{
            border: 1px solid #D6D6D6;
            color: #CCCCCC;
            cursor: default;
        }
        .code-message{
            display: inline-block;
            margin:0 0 0 10px;
            line-height: 36px;
            font-size: 14px;
            color: #999999;
            letter-spacing: 0;
            text-align: center;
        }
        .form-text{
            margin: 10px 0 0 0;
        }
        .btn-primary-set{
            font-size: 14px;
            color: #FFFFFF;
            letter-spacing: 0;
            text-align: center;
            border-radius: 4px;
        }
        .text-infos{
            display: inline-block;
            margin: 0 0 15px 0;
            font-size: 14px;
            color: #4D4D4D;
            letter-spacing: 0;
        }
        .text-success{
            font-size: 20px;
            color: #4D4D4D;
            line-height: 1.5;
        }
        .text-warin{
            font-size: 12px;
            margin-top: 80px;
        }
    </style>
</head>

<script>
    $(document).ready(function(){

        //标签页选项卡
        $('#myTabs1 a').click(function (e) {
            e.preventDefault()

            $(this).tab('show')
        });
        $('#myTabs2 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $('#myTabs3 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $('#myTabs4 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });



    });

</script>

<body  style="background-color:#F7F8F9">
<div class="container-fluid">
    <!--	导航栏-->
    <%@ include file="top.jsp"%>
    <!--	导航栏结束-->
    <!--二级导航开始-->

    <div class="row" style="background-color:#E9E9E9;margin-left: 15%;margin-right: 15%">
        <table class="table well" style="margin: 0px">
            <tr>
                <td style="cursor: pointer"><a class="text-muted" href="gerenzhongxin.jsp"><h4>个人中心</h4></a></td>
                <td style="cursor: pointer"><a class="text-muted" href="wodexiaoxi.jsp"><h4>我的消息</h4></a></td>
                <td style="cursor: pointer"><a class="text-muted" href="jifenzhongxin.jsp"><h4>C币</h4></a></td>
                <td style="cursor: pointer"><a class="text-muted" href="writingCenter.jsp"><h4>个人账号设置</h4></a></td>
                <td style="cursor: pointer"><a class="text-muted" href="#"><h4>我的博客</h4></a></td>
                <td style="cursor: pointer"><a class="text-muted" href="#"><h4>我的下载</h4></a></td>
                <td style="cursor: pointer"><a class="text-muted" href="#"><h4>我的论坛</h4></a></td>
                <td style="cursor: pointer"><a class="text-muted" href="#"><h4>我的问答</h4></a></td>
                <td style="cursor: pointer"><a class="text-muted" href="#"><h4>我的订单</h4></a></td>
            </tr>
        </table>

    </div>
    <!--二级导航结束-->

    <!--面板-->
    <div class="row well" style="margin-left: 15%;margin-right: 15%; background-color:#FFFFFF">

        <div style=" font-size:22px">
            <img src="img/shezhi.jpg" />
            <span> 个人账号设置</span>


        </div>

        <div style="margin-top:3%">

            <!-- Nav tabs -->


            <ul class="nav nav-tabs" role="tablist">
                <li id="myTabs1" role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">修改密码</a></li>
                <li id="myTabs2" role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">修改手机号</a></li>
                <li id="myTabs3" role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">修改邮箱</a></li>
                <li id="myTabs4" role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">登录日志</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">


                <!--    	修改密码-->
                <div role="tabpanel" class="tab-pane active" id="home" >

                        <form style="margin-top:4%; margin-left:6%" action="/user/updatePassword" method="post">

                            <div class="input-group">
                                <input type="hidden" name="uid" value="${sessionScope.loginresult.uid}"/>
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button"  style=" margin-left:20%" disabled >旧密码：</button>
                          </span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;

                                <input type="password" class="form-control" id="password" name="password" placeholder="旧密码"  value="" style=" width:50%;  margin-left:7%; background-color:#F8F8F8"><span id="userExtist"></span>

                            </div>

                            <div class="input-group">
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button"   style="margin-top:20%; margin-left:20%" disabled>新密码：</button>
                          </span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                <input type="password" class="form-control" id="newpassword" name="newpassword" placeholder="新密码" value="" style=" width:50%; background-color:#F8F8F8;
                           margin-top:2%; margin-left:7%">
                            </div>

                            <div class="input-group">
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button"    style="margin-top:11%" disabled>再次确认密码：</button>
                          </span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                <input type="password" class="form-control" id="equelspassword" name="equelspassword" placeholder="再次确认密码" value="" style=" width:53%; margin-top:2%; margin-left:2%; background-color:#F8F8F8" onkeyup="validate()"><span id="tishi"></span>
                            </div>
                            <input type="submit" class="form-control" id="submit" value="确认修改" style="width:12%; margin:2% 22%;background-color:#F4132F; color:#FFFFFF" onclick="click()">
                        </form>
                </div>
                <!--    	修改密码结束   -->


                <!--    	修改手机号-->
                <div role="tabpanel" class="tab-pane" id="profile">
               <form >
                   <div id="old">
                    <div >
                        <input id="oldphone" type="text" class="form-control" placeholder="请输入旧手机号" style="width:30%;margin:2% 15%; float:left">
                        <input id="getphone" type="button" class="form-control" value="获取验证码" style="width:12%;margin:2% -13%; float:left; background-color:#F4132F; color:#FFFFFF">
                    </div>
                    <div  style=" width:30%; margin:2% 15%">
                        <input id="phoneca" type="text" class="form-control" placeholder="短信验证码" >
                    </div>
                    <input id="next" type="button" class="form-control"  value="下一步" style="width:10%; margin:2% 22%; background-color:#F4132F; color:#FFFFFF">
                   </div>
               </form>
                    <div id="warning" class="alert alert-warning alert-dismissible" role="alert" style="display: none">
                        <button type="button" class="close" id="closebtn"><span aria-hidden="true">&times;</span></button>
                        <strong id="message"></strong>
                    </div>
                </div>

                <!--    修改邮箱-->
                <div role="tabpanel" class="tab-pane" id="messages">
                    <form style="margin-top:5%; margin-left:10%" action="/user/updateEmail" method="post">

                        <div class="input-group">
                            <input type="hidden" name="uid" value="${sessionScope.loginresult.uid}"/>
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button"  style=" margin-left:30%" disabled >旧邮箱：</button>
                          </span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <input type="" class="form-control" name="email" id="email" placeholder="旧邮箱"  value="" style=" width:50%;  margin-left:9%; background-color:#F8F8F8">
                        </div>

                        <div class="input-group">
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button"   style="margin-top:20%; margin-left:30%" disabled>新邮箱：</button>
                          </span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <input type="" class="form-control" name="newemail" id="newemail" placeholder="新邮箱" value="" style=" width:50%; background-color:#F8F8F8;
                           margin-top:2%; margin-left:9%"><span id="Extist">
                        </div>

                        <div class="input-group">
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button"   style="margin-top:15%; margin-left:20%" disabled>确定新邮箱：</button>
                          </span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <input type="" class="form-control" name="equelsemail"id="equelsemail" placeholder="确定新邮箱" value="" style=" width:50%; background-color:#F8F8F8;
                           margin-top:2%; margin-left:6%"onkeyup="valid()"><span id="ti"></span>
                        </div>


                        <input type="submit" class="form-control"  value="确认修改" style="width:12%; margin:2% 22%;background-color:#F4132F; color:#FFFFFF">
                    </form>

                </div>
                <!--    修改邮箱结束  -->


                <!--    登录日志-->
                <div role="tabpanel" class="tab-pane" id="settings">
                    <div style=" font-size:12px; margin:2% 7%">
                        <img src="img/rz.jpg" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <span>系统为您显示最近20次的登录活动。</span>

                        <table class="table" style=" margin:1% 1%" >
                            <tbody>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">1</span><span class="time">2018-08-09 11:09</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">2</span><span class="time">2018-08-07 15:00</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">3</span><span class="time">2018-08-05 15:40</span></td>
                                <td class="col-xs-9">中国湖北（117.136.23.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">4</span><span class="time">2018-07-25 15:50</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">5</span><span class="time">2018-07-25 15:46</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">6</span><span class="time">2018-06-20 17:21</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">7</span><span class="time">2018-03-26 12:13</span></td>
                                <td class="col-xs-9">中国湖北襄阳（27.29.150.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">8</span><span class="time">2018-03-18 16:57</span></td>
                                <td class="col-xs-9">中国湖北襄阳（27.29.152.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">9</span><span class="time">2018-01-07 17:14</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">10</span><span class="time">2017-12-07 19:24</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">11</span><span class="time">2017-11-03 20:35</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">12</span><span class="time">2017-09-17 00:29</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">13</span><span class="time">2017-06-18 21:41</span></td>
                                <td class="col-xs-9">中国湖北襄阳（116.208.99.*)</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>
<!--修改用户密码-->
<script >
    $(document).ready(function(){
        $('#password').blur(function(){
            data={"uid":${sessionScope.loginresult.uid},"password":$("#password").val()};
            $.post("/user/checkPassword?uid=${sessionScope.loginresult.uid}&password="+$("#password").val(),function(data){
                if(data=='true'){
                    $("#userExtist").css("color","green");
                    $("#userExtist").html("密码与原密码一样");

                }else
                {
                    $("#userExtist").css("color","red");
                    $("#userExtist").html("密码与原密码不一样");

                }
            });
        });
    });
    function validate() {
        var pwd = $("#newpassword").val();
        var pwd1 = $("#equelspassword").val();
        <!-- 对比两次输入的密码 -->
        if(pwd == pwd1)
        {
            $("#tishi").html("两次密码相同");
            $("#tishi").css("color","green");
            $("#xiugai").removeAttr("disabled");
        }
        else {
            $("#tishi").html("两次密码不相同");
            $("#tishi").css("color","red")
            $("button").attr("disabled","disabled");
        }
    }
</script>

<!--修改用户邮箱-->
<script >

    $(document).ready(function(){
        /**
         登录用户mima的ajax代码
         **/
        $('#email').blur(function(){
            data={"uid":${sessionScope.loginresult.uid},"email":$("#email").val()};
            $.post("/user/checkEmail?uid=${sessionScope.loginresult.uid}&email="+$("#email").val(),function(data){
                if(data=='true'){
                    $("#Extist").css("color","green");
                    $("#Extist").html("邮箱与原邮箱一样");

                }else
                {
                    $("#Extist").css("color","red");
                    $("#Extist").html("邮箱与原邮箱不一样");

                }
            });
        });
    });

    function valid() {
        var pwd = $("#newemail").val();
        var pwd1 = $("#equelsemail").val();
        <!-- 对比两次输入的密码 -->
        if(pwd == pwd1)
        {
            $("#ti").html("两次输入的邮箱相同");
            $("#ti").css("color","green");
            $("#xiugai").removeAttr("disabled");
        }
        else {
            $("#ti").html("两次输入的邮箱不相同");
            $("#ti").css("color","red")
            $("button").attr("disabled","disabled");
        }
    }
</script>
<script>
    $("#closebtn").click(function () {
        $("#warning").css("display","none");
    })
    captcha="";//验证码
    $("#getphone").click(function () {
        //验证是否为11位手机号
        var myreg=/^[1][3,4,5,7,8,9][0-9]{9}$/;
        var p=$("#oldphone").val();
        if (myreg.test(p)){
                    t=60;
                    $.get("/user/captcha?to="+$("#oldphone").val(),function (msg) {
                        captcha=msg;
                    });
                    $("#getphone").attr("disabled",true);
                    //定时器
                    timeraaa=setInterval(timecount,1000);
        }
        else {
           $("#warning").css("display","block");
           $("#message").html("请输入正确的手机号！")
        }
    });
    function timecount() {
        $("#getphone").val(t);
        t=t-1;
        if(t==-1){
            clearInterval(timeraaa);
            $("#getphone").val("再次发送");
            $("#getphone").attr("disabled",false);
        }
    }
</script>
<script>
        $("#next").click(function () {
               //判断手机号
            if($("#oldphone").val()==''){
                $("#warning").css("display","block");
                $("#message").html("请输入手机号！");

            }
            else {
                //判断验证码
                if($("#phoneca").val().length ==0) {
                    $("#warning").css("display", "block");
                    $("#message").html("请输入验证码！")
                }
                else {
                    if($("#next").val()=="下一步"){
                        if(captcha==$("#phoneca").val()){
                            $("#oldphone").val("");
                            $("#phoneca").val("");
                            $("#oldphone").attr("placeholder","请输入新手机号");
                            $("#next").val("确定");
                            clearInterval(timeraaa);
                            $("#getphone").val("获取验证码");
                            $("#getphone").attr("disabled",false);
                        }
                    }
                    else {
                        if(captcha==$("#phoneca").val()){
                            $.post("/user/updatephone?phone="+$("#oldphone").val()+"&uid="+"${sessionScope.loginresult.uid}",function (msg) {
                                if(msg=="success"){
                                    alert("修改成功")
                                    $("#oldphone").val("");
                                    $("#phoneca").val("");
                                }
                                else
                                    alert("修改失败")
                            })
                        }
                    }

                }

            }






        })
</script>
