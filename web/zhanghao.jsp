<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                <div role="tabpanel" class="tab-pane active" id="home">

                    <form style="margin-top:4%; margin-left:6%">

                        <div class="input-group">
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button"  style=" margin-left:20%" disabled >旧密码：</button>
                          </span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <input type="password" class="form-control" placeholder="旧密码"  value="" style=" width:50%;  margin-left:7%; background-color:#F8F8F8">
                        </div>

                        <div class="input-group">
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button"   style="margin-top:20%; margin-left:20%" disabled>新密码：</button>
                          </span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <input type="password" class="form-control" placeholder="新密码" value="" style=" width:50%; background-color:#F8F8F8;
                           margin-top:2%; margin-left:7%">
                        </div>

                        <div class="input-group">
                          <span class="input-group-btn">
                            <button class="btn btn-default" type="button"    style="margin-top:11%" disabled>再次确认密码：</button>
                          </span> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <input type="password" class="form-control" placeholder="再次确认密码" value="" style=" width:53%; margin-top:2%; margin-left:2%; background-color:#F8F8F8">
                        </div>
                        <input type="submit" class="form-control"  value="确认修改" style="width:12%; margin:2% 22%;background-color:#F4132F; color:#FFFFFF">
                    </form>
                </div>

                <!--    	修改手机号-->
                <div role="tabpanel" class="tab-pane" id="profile">

                    <div>
                        <input type="text" class="form-control" placeholder="请输入旧手机号" style="width:30%;margin:2% 15%; float:left">
                        <input type="button" class="form-control" value="获取验证码" style="width:12%;margin:2% -13%; float:left; background-color:#F4132F; color:#FFFFFF">
                    </div>
                    <div  style=" width:30%; margin:2% 15%">
                        <input type="text" class="form-control" placeholder="短信验证码" >
                    </div>
                    <input type="submit" class="form-control"  value="下一步" style="width:10%; margin:2% 22%; background-color:#F4132F; color:#FFFFFF">


                </div>
                <!--    修改邮箱-->
                <div role="tabpanel" class="tab-pane" id="messages">
                    <div class="form-group" style=" margin:4% 17%">
                        <label class="radio-inline">
                            <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 通过邮箱验证
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 通过手机验证
                        </label>
                    </div>
                    <input type="submit" class="form-control"  value="下一步" style="width:10%; margin:2% 22%; background-color:#EF4858;color:#FFFFFF ">

                </div>
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
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">14</span><span class="time">2017-06-16 17:30</span></td>
                                <td class="col-xs-9">中国湖北襄阳（27.22.95.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">15</span><span class="time">2017-06-09 19:35</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">16</span><span class="time">2017-06-07 23:01</span></td>
                                <td class="col-xs-9">中国湖北襄阳（27.29.177.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">17</span><span class="time">2017-06-07 22:02</span></td>
                                <td class="col-xs-9">中国湖北襄阳（27.22.94.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">18</span><span class="time">2017-06-07 10:08</span></td>
                                <td class="col-xs-9">中国湖北襄阳（111.177.117.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">19</span><span class="time">2017-06-04 23:05</span></td>
                                <td class="col-xs-9">中国湖北襄阳（27.29.146.*)</td>
                            </tr>
                            <tr class="row">
                                <td class="col-xs-3"><span class="numbers">20</span><span class="time">2017-06-04 22:47</span></td>
                                <td class="col-xs-9">中国湖北襄阳（27.29.146.*)</td>
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
