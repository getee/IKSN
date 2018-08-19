<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<script>
    $(document).ready(function(){

        //标签页选项卡
        $('#b1 a').click(function (e) {
            e.preventDefault()

            $(this).tab('show')
        });
        $('#b2 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $('#b3 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $('#b4 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $('#b5 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $('#b6 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $('#b7 a').click(function (e) {
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

    <div class="row"  style="margin-top: -1.2%; font-size:16px;background-color:#EAEBEC; min-width:1024px;" >

        <ul class="nav nav-tabs"  style="margin-left:15%;" >
            <li ><a href="/resource/keywordSearch?keyword=1">下载首页</a></li>
            <li ><a href="myresource.jsp">我的资源</a></li>
            <li ><a href="upload.jsp">上传资源赚积分</a></li>
            <li ><a href="myresource.jsp">已下载</a></li>
            <li ><a href="myresource.jsp">我的收藏</a></li>
        </ul>
    </div>
    <!--二级导航结束-->

    <!---->


    <div class="row well" style="margin-left: 10%;margin-right: 10%; min-width:1024px;">

        <div class="col-xs-8">

            <!--左边第一块div开始-->
            <div style="background-color:#FFFFFF">
<%--<script>
    $("#b2").click(function () {
        $get("/resource/keywordSearch?keyword=2",function (data) {
            var newR="";
            for(var n=0;n<data.length;n++){
                newR+='<div style="height:85px; width:90%; margin-left:20px;">';
                newR+='  <div style="height:48px; width:5%; float:left; margin-top:15px ">';
                newR+=' <a href="xq.jsp"> <img src="img/2.svg"></a></div>';
                newR+='<div style="height:20px; width:66%; float:left; margin-top:15px; margin-left:40px;  font-size:20px ; color:#000000;">';
                newR+=' <a href="xq.jsp?rid='+data[n].rid+'">'+data[n].name+'</a></div>';
                newR+=' <div style="height:30px; width:82%; float:left;margin-top:12px; margin-left:40px;font-size:14px;">';
                newR+='<div style="width:250px; height:30px;  float:left">';
                newR+=' <span> 上传者:'+data[n].user.nickname+'  </span>&nbsp;&nbsp;&nbsp;&nbsp;';
                newR+='  <span> 上传时间:'data[n].time' </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                newR+='<span> 分类:'data[n].classify'  </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                newR+=' <div style="height:23px;width:60px;float:left;margin-left:30px;border:1px solid;;border-radius: 10px; border-color:#F75D47; color:#F75D47;text-align:center;">';
                newR+='    <a href=" '+data[n].path+'">下载</a></div><span> 下载积分:'+data[n].scoring+'  </span> </div></div>';
            }
            $("#resources").append(newR);
        })
    })
</script>--%>
                <div class="row-fluid">
                    <div class="span12">
                        <ul class="nav nav-pills">
                            <li role="presentation"><a >技术领域：</a></li>
                            <div class="tabbable" id="tabs-457756">
                                <ul class="nav nav-tabs">
                                    <li ><a href="/resource/keywordSearch?keyword=1" >全部</a></li>
                                    <li ><a href="/resource/keywordSearch?keyword=2" >移动开发</a></li>
                                    <li ><a href="/resource/keywordSearch?keyword=3" >开发技术</a></li>
                                    <li ><a href="/resource/keywordSearch?keyword=4" >课程资源</a></li>
                                    <li ><a href="/resource/keywordSearch?keyword=5" >网络技术</a></li>
                                    <li ><a href="/resource/keywordSearch?keyword=6" >操作系统</a></li>
                                    <li ><a href="/resource/keywordSearch?keyword=7" >安全技术</a></li>

                                    <li id="b8"><a href="/resource/keywordSearch?keyword=8" >数据库</a></li>
                                    <li id="b9"><a href="/resource/keywordSearch?keyword=9">行业</a></li>
                                    <li id="b10"><a href="/resource/keywordSearch?keyword=10">服务器应用</a></li>
                                    <li id="b11"><a href="/resource/keywordSearch?keyword=11" >存储</a></li>
                                    <li id="b12"><a href="/resource/keywordSearch?keyword=12" >信息化</a></li>
                                    <li id="b14"><a href="/resource/keywordSearch?keyword=13" >云计算</a></li>
                                    <li id="b15"><a href="/resource/keywordSearch?keyword=14" >大数据</a></li>
                                    <li id="b16"><a href="/resource/keywordSearch?keyword=15" >人工智能</a></li>
                                    <li id="b17"><a href="/resource/keywordSearch?keyword=16" >区块链</a></li>
                                    <li id="b18"><a href="/resource/keywordSearch?keyword=17" >音视频</a></li>
                                    <li id="b19"><a href="/resource/keywordSearch?keyword=18" >游戏开发</a></li>
                                    <li id="b20"><a href="/resource/keywordSearch?keyword=19" >跨平台</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="a1"></div>

                                    <div class="tab-pane" id="a2">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">Android</a></li>
                                            <li ><a href="#">bada</a></li>
                                            <li ><a href="#">HTML5</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a3">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">web开发</a></li>
                                            <li ><a href="#">C</a></li>
                                            <li ><a href="#">C++</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a4">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">Java</a></li>
                                            <li ><a href="#">PHP</a></li>
                                            <li ><a href="#">嵌入式</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a5">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">网络基础</a></li>
                                            <li ><a href="#">网络监控</a></li>
                                            <li ><a href="#">网络设备</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a6">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">DOS</a></li>
                                            <li ><a href="#">Linux</a></li>
                                            <li ><a href="#">OS</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a7">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">网络安全</a></li>
                                            <li ><a href="#">系统安全</a></li>
                                            <li ><a href="#">其它</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a8">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">DB2</a></li>
                                            <li ><a href="#">MySQL</a></li>
                                            <li ><a href="#">Oracle</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a9">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">电信</a></li>
                                            <li ><a href="#">金融</a></li>
                                            <li ><a href="#">物流</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a10">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">DNS</a></li>
                                            <li ><a href="#">FTP</a></li>
                                            <li ><a href="#">VPN</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a11">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">搜索引擎</a></li>
                                            <li ><a href="#">计算广告</a></li>
                                            <li ><a href="#">VR</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a12">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">EMC</a></li>
                                            <li ><a href="#">HP</a></li>
                                            <li ><a href="#">SUN</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a14">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">电子商务</a></li>
                                            <li ><a href="#">IT管理</a></li>
                                            <li ><a href="#">企业管理</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a15">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">mesos</a></li>
                                            <li ><a href="#">微服务</a></li>
                                            <li ><a href="#">平台管理</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a16">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">Hadoop</a></li>
                                            <li ><a href="#">spark</a></li>
                                            <li ><a href="#">flink</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a17">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">比特币</a></li>
                                            <li ><a href="#">以太坊</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a18">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">图像处理</a></li>
                                            <li ><a href="#">编解码</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a19">
                                        <p>
                                        <ul class="nav nav-tabs">
                                            <li ><a href="#">cocos2D</a></li>
                                            <li ><a href="#">Unity3D</a></li>
                                        </ul>
                                        </p>
                                    </div>
                                    <div class="tab-pane" id="a20">
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
                        <form class="form-search" action="/resource/resourceSearch" method="post">
                            <input style="height:30px; width:400px; margin-top:15px; float:left"  type="text" name="content"/>
                            <div  style="" ></div>
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
                                    <div id="resources">
                                    <%--<c:choose>
                                        <c:when test="${empty resource}">
                                            <img style="width: 500px;height: 500px" src="img/notFound.jpg">
                                        </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>--%>

                                    <c:forEach items="${resource}" var="r">
                                                   <div style="height:85px; width:90%; margin-left:20px;">
                                                       <div style="height:48px; width:5%; float:left; margin-top:15px ">
                                                           <a href="/resource/loadResource?rid=${r.rid}"> <img src="img/2.svg"></a>
                                                       </div>
                                                       <div style="height:20px; width:66%; float:left; margin-top:15px; margin-left:40px;  font-size:20px ; color:#000000;">
                                                           <a href="/resource/loadResource?rid=${r.rid}"> ${r.name}</a>
                                                       </div>
                                                       <div style="height:30px; width:82%; float:left;margin-top:12px; margin-left:40px;font-size:14px;">
                                                           <div style="width:250px; height:30px;  float:left">

                                                               <span> 上传者: ${r.user.nickname}  </span>&nbsp;&nbsp;
                                                               <span> 上传时间:${r.time}  </span>&nbsp;&nbsp;
                                                               <c:choose>
                                                                   <c:when test="${r.classify==2}"><span> 分类:移动开发 </span></c:when>
                                                                   <c:when test="${r.classify==3}"><span> 分类:开发技术 </span></c:when>
                                                                   <c:when test="${r.classify==4}"><span> 分类:课程资源 </span></c:when>
                                                                   <c:when test="${r.classify==5}"><span> 分类:网络技术 </span></c:when>
                                                                   <c:when test="${r.classify==6}"><span> 分类:操作系统 </span></c:when>
                                                                   <c:when test="${r.classify==7}"><span> 分类:安全技术 </span></c:when>
                                                                   <c:when test="${r.classify==8}"><span> 分类:数据库 </span></c:when>
                                                                   <c:when test="${r.classify==9}"><span> 分类:行业 </span></c:when>
                                                                   <c:when test="${r.classify==10}"><span>分类:服务器应用 </span></c:when>
                                                                   <c:when test="${r.classify==11}"><span> 分类:存储 </span></c:when>
                                                                   <c:when test="${r.classify==12}"><span> 分类:信息化 </span></c:when>
                                                                   <c:when test="${r.classify==13}"><span> 分类:云计算 </span></c:when>
                                                                   <c:when test="${r.classify==14}"><span> 分类:大数据 </span></c:when>
                                                                   <c:when test="${r.classify==15}"><span> 分类:人工智能 </span></c:when>
                                                                   <c:when test="${r.classify==16}"><span> 分类:区块链 </span></c:when>
                                                                   <c:when test="${r.classify==17}"><span> 分类:音视频 </span></c:when>
                                                                   <c:when test="${r.classify==18}"><span> 分类:游戏开发 </span></c:when>
                                                                   <c:when test="${r.classify==19}"><span> 分类:跨平台 </span></c:when>
                                                               </c:choose>
                                                           </div>
                                                           <c:forEach items="${r.resourceTags}" var="tag">
                                                               <div style="height:23px;min-width:60px;float:left;margin-left:30px;border:1px solid;;border-radius:10px; border-color:#F75D47; color:#F75D47;text-align:center;">
                                                                  ${tag.rtag}
                                                               </div>
                                                           </c:forEach>

                                                       </div>
                                                   </div>
                                               </c:forEach>



                                               <%--另一个--%>

                                            <c:forEach items="${keywordSearch}" var="r">
                                                <div style="height:85px; width:90%; margin-left:20px;">
                                                    <div style="height:48px; width:5%; float:left; margin-top:15px ">
                                                        <a href="/resource/loadResource?rid=${r.rid}"> <img src="img/2.svg"></a>
                                                    </div>
                                                    <div style="height:20px; width:66%; float:left; margin-top:15px; margin-left:40px;  font-size:20px ; color:#000000;">
                                                        <a href="/resource/loadResource?rid=${r.rid}"> ${r.name}</a>
                                                    </div>
                                                    <div style="height:30px; width:82%; float:left;margin-top:12px; margin-left:40px;font-size:14px;">
                                                        <div style="width:250px; height:30px;  float:left">
                                                            <span> 上传者: ${r.user.nickname}  </span>&nbsp;&nbsp;
                                                            <span> 上传时间:${r.time}  </span>&nbsp;&nbsp;
                                                            <c:choose>
                                                                <c:when test="${r.classify==2}"><span> 分类:移动开发 </span></c:when>
                                                                <c:when test="${r.classify==3}"><span> 分类:开发技术 </span></c:when>
                                                                <c:when test="${r.classify==4}"><span> 分类:课程资源 </span></c:when>
                                                                <c:when test="${r.classify==5}"><span> 分类:网络技术 </span></c:when>
                                                                <c:when test="${r.classify==6}"><span> 分类:操作系统 </span></c:when>
                                                                <c:when test="${r.classify==7}"><span> 分类:安全技术 </span></c:when>
                                                                <c:when test="${r.classify==8}"><span> 分类:数据库 </span></c:when>
                                                                <c:when test="${r.classify==9}"><span> 分类:行业 </span></c:when>
                                                                <c:when test="${r.classify==10}"><span> 分类:服务器应用 </span></c:when>
                                                                <c:when test="${r.classify==11}"><span> 分类:存储 </span></c:when>
                                                                <c:when test="${r.classify==12}"><span> 分类:信息化 </span></c:when>
                                                                <c:when test="${r.classify==13}"><span> 分类:云计算 </span></c:when>
                                                                <c:when test="${r.classify==14}"><span> 分类:大数据 </span></c:when>
                                                                <c:when test="${r.classify==15}"><span> 分类:人工智能 </span></c:when>
                                                                <c:when test="${r.classify==16}"><span> 分类:区块链 </span></c:when>
                                                                <c:when test="${r.classify==17}"><span> 分类:音视频 </span></c:when>
                                                                <c:when test="${r.classify==18}"><span> 分类:游戏开发 </span></c:when>
                                                                <c:when test="${r.classify==19}"><span> 分类:跨平台 </span></c:when>
                                                            </c:choose>

                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                        </div>
                                                        <c:forEach items="${r.resourceTags}" var="tag">
                                                            <div style="height:23px;min-width:60px;float:left;margin-left:30px;border:1px solid;;border-radius:10px; border-color:#F75D47; color:#F75D47;text-align:center;">
                                                                ${tag.rtag}
                                                            </div>
                                                        </c:forEach>

                                                    </div>
                                                </div>
                                            </c:forEach>




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
            <div class="media" style="height:200px; width:100%;"><a class="pull-left" href="#"><img class="media-object"   src="img/0.jpg" /> </a>
                <div class="media-body" contenteditable="true"></div>
            </div>
        </div>


    </div>
</div>

</body>
</html>
<%--
<script>
    var keywordArray1 = new Array("index","name","pinyin")


    window.onload = function(){
        $.get("/resource/ajaxResourceName",function (data) {
            var json=eval(data);
            $.each(json,function (index) {
                var ttt=json[index].word
                var str=ttt.replace(/[0-9]/g, '');  //去掉数字
                var l1=str.replace(/[a-zA-Z]/g,'');
                keywordArray1[0+index*1]= new Array(0+index, json[index].word,chineseToPinYin(l1) );
             alert(keywordArray1[10+index*1]);
            });

        })

        $quickQuery(keywordArray1);
    }
</script>--%>
