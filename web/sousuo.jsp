<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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

</head>
<body  style="background-color:#F7F8F9">
<div class="container-fluid">
    <!--	导航栏-->
    <%@ include file="top.jsp"%>
    <!--	导航栏结束-->
    <!--二级导航开始-->

    <div class="row"  style="margin-top: -1.2%; font-size:16px;background-color:#EAEBEC; min-width:1024px;" >

        <ul class="nav nav-tabs"  style="margin-left:15%;" >
            <li ><a href="#">全部</a></li>
            <li ><a href="#">博客</a></li>
            <li ><a href="#">标签</a></li>
            <li ><a href="#">博主</a></li>
        </ul>

    </div>
    <!--二级导航结束-->

    <!---->


    <div class="row well" style="margin-left: 10%;margin-right: 10%; min-width:1024px;">

        <div class="col-xs-8">

            <!--左边第一块div开始-->
            <div style="background-color:#FFFFFF">

                <div class="row-fluid">

                        <div class="span12">
                            <div style="float:left; margin-top:18px; margin-left:20px">
                                <span>关键词:</span>
                            </div>
                            <form class="form-search"><input style="height:30px; width:400px; margin-top:15px; float:left" class="input-medium search-query" type="text"/>
                                <button style="height:30px; margin-top:15px; margin-left:10px" class="btn" contenteditable="true" type="submit">查找</button></form>
                        </div>


                </div>

            </div>


            <!--左边第一块div结束-->


            <!--左边第二大块div开始-->
            <div  style="background-color:#FFFFFF; margin-top:30px; width:940px" >

                <div class="span12" style="border-radius: 10px; background-color:#f8f1ff">
                    <h2>
                        <a href="userArticle.jsp">技术杂谈</a>
                    </h2>
                    <p>
                        本可视化布局程序在HTML5浏览器上运行更加完美, 能实现自动本地化保存, 即使关闭了网页, 下一次打开仍然能恢复上一次的操作.
                    </p>
                    <h5 style="color:#928F8F;float: right">阅读数：3555</h5>
                    <p>
                        <a class="btn" href="#">查看更多 »</a>
                    </p>
                </div>
                <div class="span12" style="border-radius: 10px;background-color:#D2D4D5">
                    <h2>
                        <a href="userArticle.jsp">技术杂谈</a>
                    </h2>
                    <p>
                        本可视化布局程序在HTML5浏览器上运行更加完美, 能实现自动本地化保存, 即使关闭了网页, 下一次打开仍然能恢复上一次的操作.
                    </p>
                    <h5 style="color:#928F8F;float: right">阅读数：3555</h5>
                    <p>
                        <a class="btn" href="#">查看更多 »</a>
                    </p>
                </div>
                <div class="span12" style="border-radius: 10px; background-color:#f8f1ff">
                    <h2>
                        <a href="userArticle.jsp">技术杂谈</a>
                    </h2>
                    <p>
                        本可视化布局程序在HTML5浏览器上运行更加完美, 能实现自动本地化保存, 即使关闭了网页, 下一次打开仍然能恢复上一次的操作.
                    </p>
                    <h5 style="color:#928F8F;float: right">阅读数：3555</h5>
                    <p>
                        <a class="btn" href="#">查看更多 »</a>
                    </p>
                </div>
                <div class="span12" style="border-radius: 10px;background-color:#D2D4D5">
                    <h2>
                        <a href="userArticle.jsp">技术杂谈</a>
                    </h2>
                    <p>
                        本可视化布局程序在HTML5浏览器上运行更加完美, 能实现自动本地化保存, 即使关闭了网页, 下一次打开仍然能恢复上一次的操作.
                    </p>
                    <h5 style="color:#928F8F;float: right">阅读数：3555</h5>
                    <p>
                        <a class="btn" href="#">查看更多 »</a>
                    </p>
                </div>



            </div>
        </div>


        <!--右边第一块-->
        <div class="col-xs-4 well">
            <div class="media" style="height:200px; width:100%;"><a class="pull-left" href="#"><img class="media-object"              src="img/0.jpg" /> </a>
                <div class="media-body" contenteditable="true"></div>
            </div>
        </div>


    </div>
</div>



</body>
