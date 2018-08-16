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
                    <form id="password_protect" role="form" class="form-horizontal hide">
                            <div class="step-verify-code_pp step"  style="display:none;">
                                <input type="hidden" name="type" value="valid">
                                <div style="display: none" class="alert alert-danger"></div>
                                <div class="form-group">
                                    <p class="tips"><span class="icon-warning"></span>系统已经向您的手机********0973发送了验证码，请于5分钟内完成验证</p>
                                    <div class="col-xs-7"> </div>
                                </div>
                                <div class="form-group">
                                    <label for="verify_code" class="col-xs-2 control-label">验证码：</label>
                                    <div class="col-xs-3">
                                        <input id="verify_code" type="text" maxlength="6" name="sms_code" class="form-control" >
                                    </div>
                                    <div class="col-xs-7" style="display: none" >
                                        <div class="timeout">验证码已发送，<b>60</b>秒后可以再次发送。</div><a href="javascript:void 0" style="display: none" class="send-verify-code">再次发送</a>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-offset-2 col-xs-9">
                                        <button type="button" class="btn btn-default btn-lg" onclick="window.location='/my/account/secureqa'" >返回</button>
                                        <button class="btn btn-primary btn-lg  check_sms_code" type="button">确认</button>
                                    </div>
                                </div>
                            </div>
                    </form>

                            <form id="bind-phone" role="form" class="form-horizontal" style="margin-top:3%">
                    <div class="step-phone-number">
                        <input type="hidden" name="type" value="chgmob">
                        <div class="alert alert-danger hide js_alert_message"></div>
                        <div class="form-group form-process step">
                            <div class="row">
                                <label for="phone_old_number" class="col-xs-2 control-label"></label>
                                <div class="col-xs-5"><span class="text-infos js_text_infos">请输入原始手机号验证你的身份：</span></div>
                            </div>
                            <div class="row js_validate_step">
                                <label for="phone_number" class="col-xs-2 control-label"></label>
                                <div class="col-xs-3">
                                    <input id="phone_number" type="text" class="form-control js_phone_number" placeholder = "请输入旧手机号">
                                </div>
                                <div class="col-xs-7 col-xs-no">
                                    <span class="phone-code js_get_code">获取验证码</span>
                                    <span class="code-message hide js_code_message">短信验证码已发送，请查收手机</span>
                                </div>
                            </div>
                            <div class="row js_validate_step">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-3"><input type="text" class="form-text form-control js_validate_code" placeholder="短信验证码"></div>
                            </div>
                        </div>
                        <div class="form-group form-process step">
                            <div class="col-xs-offset-2 col-xs-9">
                                <button class="btn btn-primary btn-lg btn-primary-set js_bind_subimit" type="submit" style="background-color:#F13B3E; border:hidden">下一步</button>
                                <p class="text-warin">如果验证身份出现问题，请联系客服</p>
                            </div>
                        </div>
                    </div>
                    </form>






                  <%--  <div class="step-phone-number">
                        <input type="hidden" name="type" value="chgmob">
                        <div class="alert alert-danger hide js_alert_message"></div>
                        <div class="form-group form-process step">

                            <div class="row" >
                                &lt;%&ndash;@declare id="phone_old_number"&ndash;%&gt;<label for="phone_old_number" class="col-xs-2 control-label"></label>
                                <div class="col-xs-5" style="margin:1% ">
                                    <span class="text-infos js_text_infos" >请输入手机号验证你的身份：</span>
                                </div>
                            </div>

                            <div class="row js_validate_step">
                                <label for="phone_number" class="col-xs-2 control-label"></label>
                                <div class="col-xs-3">
                                    <input id="phone_number" type="text" class="form-control js_phone_number" placeholder = "请输入旧手机号">
                                </div>
                                <div class="col-xs-7 col-xs-no">
                                    <span class="phone-code js_get_code">获取验证码</span>
                                    <span class="code-message hide js_code_message">短信验证码已发送，请查收手机</span>
                                </div>
                            </div>

                            <div class="row js_validate_step">
                                <div class="col-xs-2"></div>
                                <div class="col-xs-3"><input type="text" class="form-text form-control js_validate_code" placeholder="短信验证码"></div>
                            </div>
                        </div>

                        <div class="form-group form-process step">
                            <div class="col-xs-offset-2 col-xs-9">
                                <button class="btn btn-primary btn-lg btn-primary-set js_bind_subimit" type="submit" style="background-color:#F13B3E; border:hidden">下一步</button>
                                <p class="text-warin"> <a href="#">如果验证身份出现问题，请联系客服</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="step-init">
                        <div style="display: none" class="alert alert-danger"></div>
                        <div class="form-group">
                            <label class="col-xs-2 control-label">手机号：</label>
                            <div class="col-xs-9"><span class="phone_number">
                      <!-- TODO 需要后端将用户的原始手机号输出到这里-->********0973</span><a href="javascript:void 0" class="change js_btn_resetphone">修改手机号</a></div>
                        </div>
                        <div style="display: none" class="alert alert-success">
                        </div>
                    </div>
--%>


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

<!--修改手机号-->
<script>
    /*
   * @Author: TimLie.yaoleixia
   * @Date: 2018-05-31 15:40:28
   * @LastEditors: TimLie.yaoleixia
   * @LastEditTime: 2018-06-27 9:34
   * @Description: 手机号码变更修改操作
   * @Email: yaolx@csdn.net
   * @Company: CSDN
   * @GitHub: https://github.com/TimYao
   * @version:1.0.0
   */

    jQuery(function($) {
        var jsBtnResetphone,
            jsBindStep,
            jsPhoneNumber,
            validateRules,
            jsAlertMessage,
            jsGetGode,
            jsValidateCode,
            jsTextInfos,
            jsValidateStep;
        jsBtnResetphone = $('.js_btn_resetphone');
        jsBindStep = $('.js_bind_subimit');
        jsPhoneNumber = $('.js_phone_number');
        jsAlertMessage = $('.js_alert_message');
        jsGetGode = $('.js_get_code');
        jsValidateCode = $('.js_validate_code');
        jsTextInfos = $('.js_text_infos'),
            jsValidateStep = $('.js_validate_step');

        validateRules = {
            isStatus: false,  // 是否提交
            isCode: false,    // 控制是否开启code
            codetT: null,
            step: 1,
            ajaxUrl:{
                codePhoneUrl: '/my/account/check_mobile_send_code', // 验证手机或验证码
                sendCodeUrl: '/my/account/check_code_bind_mobile'  // 下一步或者绑定
            },
            getObj: function(obj){
                var _this;
                if(!obj){
                    console.log('obj is null!');
                    return false;
                }
                _this = obj.get ? obj.get(0) : obj;
                return _this;
            },
            messageInfo: function(tag){
                var message = { error:0},
                    tipMessage = {
                        phoneEmpty: '手机号不能为空',
                        phone: '手机号格式不正确',
                        codeEmpty: '验证码不能为空',
                        code: '验证码格式不正确'
                    };
                tipMessage[tag] && (message.msg = tipMessage[tag],message.error = -1);
                return message;
            },
            regRules: {
                phone: /^1[\d]{10}$/,  //手机号为11位
                code: /^\d{6}$/   //验证码为六位
            },
            empty: function(obj, tag){
                var _value, _this, _message = {error: 0};
                _this = this.getObj(obj);
                _value = $.trim(_this.value);
                if(_value === ''){
                    _message = this.messageInfo(tag);
                }
                return _message;
            },
            validateReg: function(obj, tag){
                var _value, _this, reg, _message = {error: 0};
                _this = this.getObj(obj);
                _value = $.trim(_this.value);
                reg = this.regRules[tag];
                if(!reg.test(_value)){
                    _message = this.messageInfo(tag);
                }
                return _message;
            },
            phoneRight: function(obj, callback){
                var _value, _this, _message = {error: 0}, datas = {};
                _this = this.getObj(obj);
                _value = $.trim(_this.value);
                if(validateRules.step === 1){
                    datas['old_mobile'] = _value;
                }else if(validateRules.step === 2){
                    datas['new_mobile'] = _value;
                }
                $.ajax({
                    url: validateRules.ajaxUrl.codePhoneUrl,
                    type: 'post',
                    dataType: 'json',
                    data: datas,
                    success: function(reponse){
                        callback(reponse);
                    },
                    error: function(error){
                        console.log(error);
                    }
                });
            },
            alertMessage: function(message){
                if(message.error === -1){
                    jsAlertMessage.html(message.msg || '').removeClass('hide');
                }else{
                    jsAlertMessage.addClass('hide').html('');
                }
                this.isStatus = message.error === -1 ? true : false;
            },
            getCodeTime: function(flg){
                var m = n = 60, fun;
                if(flg){
                    clearTimeout(validateRules.codetT);
                    validateRules.codetT = null;
                    validateRules.isCode = false;
                    jsGetGode.next('.js_code_message').addClass('hide').end().removeClass('code-gray').text('获取验证码');
                    return false;
                }
                fun = function(){
                    validateRules.codetT = setTimeout(function(){
                        if(m === 0){
                            m = n;
                            jsGetGode.next('.js_code_message').addClass('hide').end().removeClass('code-gray').text('获取验证码');
                            validateRules.isCode = false;
                            clearTimeout(validateRules.codetT);
                            validateRules.codetT = null;
                            return false;
                        }
                        m--;
                        jsGetGode.next('.js_code_message').removeClass('hide').end().addClass('code-gray').text(m+'s');
                        fun();
                    }, 1000)
                };
                fun();
            },
            validate: function(obj, rules){
                var _this,code, message = {error : 0};
                _this = obj;
                if(rules.empty && validateRules.empty(_this, rules.empty).error === -1){
                    message.error = -1;
                    message.msg = validateRules.empty(_this, rules.empty).msg;
                }else if(rules.reg && validateRules.validateReg(_this, rules.reg).error === -1){
                    message.error = -1;
                    message.msg = validateRules.validateReg(_this, rules.reg).msg;
                }else{
                    message.error = 0;
                    message.msg = '';
                }

                validateRules.alertMessage(message);
                if(message.error === -1){
                    return false;
                }
            },
            sendEdit: function(options,callback){
                var opts = {
                    url: validateRules.ajaxUrl.sendCodeUrl,
                    type: 'post',
                    dataType: 'json',
                    error: function(err){
                        console.log('发送失败，错误',err);
                    }
                };
                opts = $.extend(opts, options);
                opts.success = callback;
                $.ajax(opts)
            }
        }

        // 初始化
        jsBtnResetphone.on('click', function(){
            $(this).closest('.step-init').addClass('hide');
            $(this).closest('form').find('.form-process').removeClass('step');
        })

        // 禁止否认提交
        jsBindStep.on('click',function(){
            return false;
        })
        // 下一步、确定
        jsBindStep.on('mousedown', function(){
            var phoneValue, codeValue, data = {}, step;
            validateRules.curBtn = jsBindStep;
            // 完成跳转
            if(validateRules.step === 3){
                window.location.href = 'https://www.csdn.net';
                return false;
            }
            step = Number($(this).attr('data-step'), 10);
            if(step === 2){
                validateRules.step = 2;
            }

            jsPhoneNumber.blur();
            if(validateRules.isStatus){
                jsPhoneNumber.focus();
                return false;
            }

            validateRules.validate(jsValidateCode,{
                empty: 'codeEmpty',
                reg: 'code'
            });

            if(validateRules.isStatus){
                jsValidateCode.focus();
                return false;
            }

            // 下一步切换页面
            phoneValue = $.trim(jsPhoneNumber.val());
            codeValue = $.trim(jsValidateCode.val());


            // 控制发送值
            if(validateRules.step === 1){
                data['old_mobile'] = phoneValue;
                data['code'] = codeValue;
            }else if(validateRules.step === 2){
                data['new_mobile'] = phoneValue;
                data['code'] = codeValue;
            }

            validateRules.sendEdit({
                type: 'get',
                data: data,
                error: function(err){
                    console.log('发送失败！', err);
                }
            },function(reponse){
                // send code success
                //reponse.status = 0;
                if(Number(reponse.status,10) === 0){
                    if(validateRules.step === 1){
                        validateRules.getCodeTime(true);
                        jsTextInfos.text('请输入新手机号：');
                        jsBindStep.text('确认修改');
                        jsPhoneNumber.val('');
                        jsValidateCode.val('');
                        jsPhoneNumber.focus();
                        jsPhoneNumber.attr('placeholder', '请输入新手机号')
                        validateRules.step = 2;
                        delete validateRules.mobile;
                        data = {};
                    }else if(validateRules.step === 2){
                        validateRules.getCodeTime(true);
                        validateRules.step = 3;
                        jsValidateStep.addClass('hide');
                        jsPhoneNumber.val('');
                        jsValidateCode.val('');
                        jsBindStep.text('完成');
                        jsPhoneNumber.attr('placeholder', '请输入旧手机号');
                        validateRules.mobile = data['new_mobile'];
                        data = {};
                        jsTextInfos.addClass('text-success').html('修改成功！<br/>你的新手机号是 ' + validateRules.mobile);
                    }
                }else{
                    // 返回失败信息
                    validateRules.alertMessage({error: -1, msg: reponse.msg});
                    validateRules.getCodeTime(true);
                }
            });
            return false;
        })

        // 手机号验证
        jsPhoneNumber.on('blur', function(){
            validateRules.validate(jsPhoneNumber,{
                empty: 'phoneEmpty',
                reg: 'phone'
            });
        })

        // 验证码失焦点
        jsValidateCode.on('blur', function(){
            validateRules.alertMessage({error: 0, msg: ''});
        })

        // 获取验证码
        jsGetGode.on('mousedown', function(){
            validateRules.curBtn = jsGetGode;
            if(validateRules.isCode){
                return false;
            }
            validateRules.validate(jsPhoneNumber,{
                empty: 'phoneEmpty',
                reg: 'phone'
            });
            if(validateRules.isStatus){
                if(jsValidateCode.get(0).flg === undefined){
                    jsPhoneNumber.focus();
                }
                return false;
            }
            // 验证旧手机是否正确
            validateRules.phoneRight(jsPhoneNumber, function(reponse){
                var message = {};
                message.msg = reponse.msg ? reponse.msg : '';
                // 状态码不同标识验证成功还是发送码
                // 手机号错误
                if(reponse.status < 0){
                    message.error = -1;
                }
                if(reponse.status === -4 || reponse.status === -3){
                    jsPhoneNumber.focus();
                }else{
                    if($.trim(jsValidateCode.val()) === ''){
                        jsValidateCode.focus();
                    }
                }

                validateRules.alertMessage(message);
                if(validateRules.isStatus === true){
                    return false;
                }

                // 正确并发送码
                validateRules.getCodeTime();
                validateRules.isCode = true;
            });
            return false;
        });

    });
</script>