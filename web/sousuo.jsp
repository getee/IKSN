<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <li ><a href="#"></a></li>
            <%--<li ><a href="#">博客</a></li>
            <li ><a href="#">标签</a></li>
            <li ><a href="#">博主</a></li>--%>
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
                            <form class="form-search" action="/blog/blogSearch" method="post">
                                <input name="content" style="height:30px; width:400px; margin-top:15px; float:left" class="quickQuery$focus" type="text" name="content"/>
                                <div class="quickQuery$focus"></div>
                                <button style="height:30px; margin-top:15px; margin-left:10px" class="btn" contenteditable="true" type="submit">查找</button>
                            </form>
                        </div>


                </div>

            </div>


            <!--左边第一块div结束-->


            <!--左边第二大块div开始-->
            <div  style="background-color:#FFFFFF; margin-top:30px; width:940px" >

                <c:choose><%--先判断搜索到结果的是否为空--%>
                    <c:when test="${empty blogSearch}" >
                        <img style="width: 500px;height: 500px" src="img/notFound.jpg">
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="t" items="${blogSearch}">
                            <div class="span12" style="border-radius: 10px; background-color:#f8f1ff">
                                <h2>
                                    <a href="userArticle.jsp?searchB=${t.bid}"> ${t.title}</a>
                                </h2>
                                <p>
                                        ${fn:substring(t.content, 0, 100)}.........
                                </p>

                                <h5 style="color:#928F8F;float: right">
                                    <c:choose>
                                        <c:when test="${t.classify==1}">
                                            类型:移动开发 &nbsp&nbsp&nbsp&nbsp
                                        </c:when>
                                        <c:when test="${t.classify==2}">
                                            类型:开发技术 &nbsp&nbsp&nbsp&nbsp
                                        </c:when>
                                        <c:when test="${t.classify==3}">
                                            类型:课程资源 &nbsp&nbsp&nbsp&nbsp
                                        </c:when>
                                        <c:when test="${t.classify==4}">
                                            类型:网络技术 &nbsp&nbsp&nbsp&nbsp
                                        </c:when>
                                        <c:when test="${t.classify==5}">
                                            类型:操作系统 &nbsp&nbsp&nbsp&nbsp
                                        </c:when>
                                        <c:when test="${t.classify==6}">
                                            类型:安全技术 &nbsp&nbsp&nbsp&nbsp
                                        </c:when>
                                        <c:when test="${t.classify==7}">
                                            类型:数据库 &nbsp&nbsp&nbsp&nbsp
                                        </c:when>
                                        <c:when test="${t.classify==8}">
                                            类型:服务器应用 &nbsp&nbsp&nbsp&nbsp
                                        </c:when>
                                        <c:when test="${t.classify==9}">
                                            类型:存储 &nbsp&nbsp&nbsp&nbsp
                                        </c:when>
                                        <c:otherwise>
                                            类型:信息化 &nbsp&nbsp&nbsp&nbsp
                                        </c:otherwise>
                                    </c:choose>

                                    时间:${t.time}&nbsp&nbsp&nbsp&nbsp
                                    阅读数：${t.points}
                                </h5>

                                <p>
                                    <a class="btn" href="userArticle.jsp?searchB=${t.bid}">查看更多 »</a>
                                </p>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>


            </div>
        </div>


        <!--右边第一块-->
        <div class="col-xs-4 well">
            <div class="media" style="height:200px; width:100%;"><a class="pull-left" href="#"><img class="media-object"       src="img/0.jpg" /> </a>
                <div class="media-body" contenteditable="true"></div>
            </div>
        </div>


    </div>
</div>



</body>
