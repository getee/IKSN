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

</head>
<body  style="background-color:#F7F8F9">
<div class="container-fluid">
    <!--	导航栏-->
    <%@ include file="top.jsp"%>
    <!--	导航栏结束-->
    <!--二级导航开始-->

    <div class="row"  style="margin-top: -1.2%; font-size:16px;background-color:#EAEBEC; min-width:1024px;" >

        <ul class="nav nav-tabs"  style="margin-left:15%;" >
            <li ><a href="xiazhai.jsp">下载首页</a></li>
            <li ><a href="#">我的资源</a></li>
            <li ><a href="upload.jsp">上传资源赚积分</a></li>
            <li ><a href="#">已下载</a></li>
            <li ><a href="#">我的收藏</a></li>
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
                        <ul class="nav nav-pills">
                            <li role="presentation"><a >技术领域：</a></li>
                            <div class="tabbable" id="tabs-457756">
                                <ul class="nav nav-tabs">
                                    <li ><a href="#1" data-toggle="tab">全部</a></li>
                                    <li><a href="#2" data-toggle="tab">移动开发</a></li>
                                    <li><a href="#3" data-toggle="tab">开发技术</a></li>
                                    <li><a href="#4" data-toggle="tab">课程资源</a></li>
                                    <li><a href="#5" data-toggle="tab">网络技术</a></li>
                                    <li><a href="#6" data-toggle="tab">操作系统</a></li>
                                    <li><a href="#7" data-toggle="tab">安全技术</a></li>
                                    <li><a href="#8" data-toggle="tab">数据库</a></li>
                                    <li><a href="#9" data-toggle="tab">行业</a></li>
                                    <li><a href="#10" data-toggle="tab">服务器应用</a></li>
                                    <li><a href="#11" data-toggle="tab">存储</a></li>
                                    <li><a href="#12" data-toggle="tab">信息化</a></li>
                                    <li><a href="#14" data-toggle="tab">云计算</a></li>
                                    <li><a href="#15" data-toggle="tab">大数据</a></li>
                                    <li><a href="#16" data-toggle="tab">人工智能</a></li>
                                    <li><a href="#17" data-toggle="tab">区块链</a></li>
                                    <li><a href="#18" data-toggle="tab">音视频</a></li>
                                    <li><a href="#19" data-toggle="tab">游戏开发</a></li>
                                    <li><a href="#20" data-toggle="tab">跨平台</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="1"></div>
                                    <div class="tab-pane" id="2">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">Android</a></li>
                                            <li ><a href="#">bada</a></li>
                                            <li ><a href="#">HTML5</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="3">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">web开发</a></li>
                                            <li ><a href="#">C</a></li>
                                            <li ><a href="#">C++</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="4">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">Java</a></li>
                                            <li ><a href="#">PHP</a></li>
                                            <li ><a href="#">嵌入式</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="5">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">网络基础</a></li>
                                            <li ><a href="#">网络监控</a></li>
                                            <li ><a href="#">网络设备</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="6">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">DOS</a></li>
                                            <li ><a href="#">Linux</a></li>
                                            <li ><a href="#">OS</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="7">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">网络安全</a></li>
                                            <li ><a href="#">系统安全</a></li>
                                            <li ><a href="#">其它</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="8">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">DB2</a></li>
                                            <li ><a href="#">MySQL</a></li>
                                            <li ><a href="#">Oracle</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="9">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">电信</a></li>
                                            <li ><a href="#">金融</a></li>
                                            <li ><a href="#">物流</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="10">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">DNS</a></li>
                                            <li ><a href="#">FTP</a></li>
                                            <li ><a href="#">VPN</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="11">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">搜索引擎</a></li>
                                            <li ><a href="#">计算广告</a></li>
                                            <li ><a href="#">VR</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="12">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">EMC</a></li>
                                            <li ><a href="#">HP</a></li>
                                            <li ><a href="#">SUN</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="14">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">电子商务</a></li>
                                            <li ><a href="#">IT管理</a></li>
                                            <li ><a href="#">企业管理</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="15">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">mesos</a></li>
                                            <li ><a href="#">微服务</a></li>
                                            <li ><a href="#">平台管理</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="16">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">Hadoop</a></li>
                                            <li ><a href="#">spark</a></li>
                                            <li ><a href="#">flink</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="17">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">比特币</a></li>
                                            <li ><a href="#">以太坊</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="18">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">图像处理</a></li>
                                            <li ><a href="#">编解码</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="19">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">cocos2D</a></li>
                                            <li ><a href="#">Unity3D</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="20">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">PhoneGap</a></li>
                                            <li ><a href="#">WeX5</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </ul>
                    </div>

                </div>
                <div class="row-fluid">
                    <div class="span12">
                        <div style="float:left; margin-top:18px; margin-left:20px">
                            <span>关键词：</span>
                        </div>
                        <form class="form-search"><input style="height:30px; width:400px; margin-top:15px; float:left" class="input-medium search-query" type="text"/>
                            <button style="height:30px; margin-top:15px; margin-left:10px" class="btn" contenteditable="true" type="submit">查找</button></form>
                    </div>
                </div>
            </div>


            <!--左边第一块div结束-->


            <!--左边第二大块div开始-->
            <div  style="background-color:#FFFFFF; margin-top:30px">
                <div class="row-fluid">
                    <div class="span12">
                        <div class="tabbable" id="tabs">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#00" data-toggle="tab">代码资源</a>

                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="00">
                                    <p>
                                        <!--资源详情部分-->

                                    <div style="height:85px; width:90%; margin-left:20px;">
                                        <div style="height:48px; width:5%; float:left; margin-top:15px ">
                                            <a href="xq.jsp"> <img src="img/2.svg"></a>
                                        </div>
                                        <div style="height:20px; width:66%; float:left; margin-top:15px; margin-left:40px;  font-size:20px ; color:#000000;">
                                            <a href="/resource/downResource?rid=1"> 仿安居客地图找房源码</a>
                                        </div>
                                        <div style="height:30px; width:82%; float:left;margin-top:12px; margin-left:40px;font-size:14px;">
                                            <div style="width:250px; height:30px;  float:left">
                                                <span> 2018-06-08  上传</span>
                                                <span>&nbsp;&nbsp;&nbsp;&nbsp;大小：<em>308KB</em></span>
                                            </div>
                                            <div style="height:23px;width:60px;float:left;margin-left:30px;border:1px solid;;border-radius:                                           10px; border-color:#F75D47; color:#F75D47;text-align:center;">
                                                <a href="#"> IP地址</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!--资源详情部分-->


                                    <!--分页部分-->
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <li>
                                                <a href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <li><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li>
                                                <a href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                    <!--分页部分结束-->
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
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
</html>