<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${empty sessionScope.loginresult}">
    <c:redirect url="index.jsp"></c:redirect>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
    <!-- Le styles -->
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
                      <li ><a href="xiazai.jsp">下载首页</a></li>
                      <li id="a1"><a href="#panel-717300">我的资源</a></li>
                      <li ><a href="upload.jsp">上传资源赚积分</a></li>
                      <li id="a3"><a id="downloads" href="#panel-622342">已下载</a></li>
                      <li id="a4"><a id="collects" href="#panel-622343">我的收藏</a></li>
                    </ul>

             </div>
        	<!--二级导航结束-->


                <!--中间第一部分内容开始-->
     			<div class="row well" style="background-color:#FFF;margin-left: 10%;margin-right: 10%;margin-top: 2%;min-width: 1024px; ">
                      <div>	
                      	   	
                            <img style="width:100px;height:100px;margin-top:3%;margin-left:3%;" alt="140x140" src="img/log.jpg" class="img-circle" />
                      		<div style="margin-left:14.7%; margin-top:-9%;">qq_41581629</div>
                            <div style="margin-left:14.7%; padding-top:1%;">
                            	<span class="label" contenteditable="true" style="background-color:#9DC75F;">下载
                                <span id="tag" class="badge" contenteditable="true" style="background-color:#2D5315;"></span></span> 上传权限：<span>220MB</span>
                             </div>
                      </div>
                      <div style=" margin-left:5%; margin-top:8%;">
                      	
                        <span style="float:left;">积分<div id="jifencount" style="color:#36F;font-weight:bolder">

                            <%--<c:set var="total" value="0"></c:set>
                            <c:forEach items="${requestScope.scorings}" var="s">
                                <c:if  test="${s.state=='0'}">
                                    <c:set var="number" value="-${s.number}" />
                                </c:if>
                                <c:if  test="${s.state=='1'}">
                                    <c:set var="number" value="${s.number}" />
                                </c:if>
                                <c:set var="total" value="${total +(number) }" />
                            </c:forEach>${total}--%>
                        </div></span>
                        <span style="margin-left:8%;float:left">上传资源<div id="uploadcount" style="color:#36F;font-weight:bolder"></div> </span>
                        <span style="margin-left:8%;float:left">下载资源<div id="downloadcount" style="color:#36F;font-weight:bolder"></div></span>
                           
                      </div>
  				</div >
                <!--中间第一部分内容结束-->
                
                
                <div class="row well" style="margin-left: 10%;margin-right: 10%; min-width:1024px;">
                <!--左下选项卡切换开始-->
                	<div class="col-xs-8">
                	<div style="min-height:230px;">
        			<div class="tabbable" id="tabs-853379"> <!-- Only required for left/right tabs -->
                      <ul class="nav nav-tabs">
                        <li id="b1" ><a id="upload" href="#panel-717300" >上传资源</a></li>
                        <li id="b2"><a id="jifen" href="#panel-622341">积分明细</a></li>
                        <li id="b3" ><a id="download"  href="#panel-622342" >下载资源</a></li>
                        <li id="b4"><a id="collect" href="#panel-622343" >我的收藏</a></li>

                      </ul>
                      <div class="tab-content">
                            <div class="tab-pane active" id="panel-717300" contenteditable="true">

                            </div>

                          <!--积分明细-->
                            <div class="tab-pane " id="panel-622341" contenteditable="true">
                              <p><table class="table" contenteditable="true">
                                    <thead>
                                        <tr>
                                            <th>分数</th>
                                            <th>时间</th>
                                            <th>操作内容</th>
                                        </tr>
                                    </thead>
                                    <tbody id="biaoge">

                                    </tbody>
                                </table>
                                </p>
                            </div>

                          <!--下载明细-->
                            <div class="tab-pane " id="panel-622342" contenteditable="true">

                            </div>

                          <!--我的收藏-->
                            <div class="tab-pane " id="panel-622343" contenteditable="true">

                            </div>
                      </div>
                   </div>
                </div>
                <!--左下选项卡切换结束-->
                	</div>
                    
                	<div class="col-xs-4 well">
                		<!--右下广告开始-->
        				<div style="background-color:#FFF;;min-height:230px;">
                        <div style="width:100%; height:40px; background-color:#E33F3F;">
                          <a href="upload.jsp" >
                            <img style="height:30px; margin-left:35%; margin-top:3%; " src="img/upload.jpg" >
                            <div style="color:#FFF; font-size:16px; margin-left:50%; margin-top:-10%;">上传资源</div>
                          </a>
                        </div>


                            <!--联系我们-->
                            <div id="contact-us" class="span12" style="margin-top: 30px; margin-left:10%;">
                                <span>联系我们</span>
                                <hr>
                                <div class="row">
                                    <div class="col-xs-6 col-md-1" >
                                    </div>
                                    <div class="col-xs-6 col-md-7" style=" width:140px;height:140px;background-size:100%;background-image: url(img/3_weixin.jpg)">

                                    </div>
                                    <div class="col-xs-6 col-md-4"></div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-md-1"></div>
                                    <div class="col-xs-6 col-md-10">
                                        <h5>请联系客服</h5>
                                        <p>
                                            <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M2.167 2h11.666C14.478 2 15 2.576 15 3.286v9.428c0 .71-.522 1.286-1.167 1.286H2.167C1.522 14 1 13.424 1 12.714V3.286C1 2.576 1.522 2 2.167 2zm-.164 3v1L8 10l6-4V5L8 9 2.003 5z" fill="#B3B3B3" fill-rule="evenodd"></path></svg>
                                            <a href="mailto:webmaster@csdn.net" target="_blank"><span class="txt">webmaster@csdn.net</span></a>
                                        </p>
                                        <p>
                                            <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M14.999 13.355a.603.603 0 0 1-.609.645H1.61a.603.603 0 0 1-.609-.645l.139-1.47c.021-.355.25-.845.51-1.088 0 0 3.107-2.827 3.343-2.909 0 0-.029-2.46 1.2-2.46h3.635c1.112 0 1.202 2.469 1.202 2.469l3.32 2.9c.26.243.489.733.51 1.088l.139 1.47zM7 10a1 1 0 0 0 0 2h2a1 1 0 0 0 0-2H7zm7.806-5.674c.105.135.191.384.19.554l-.003 2.811c0 .17-.133.26-.295.2l-2.462-.999a.478.478 0 0 1-.296-.416V5.445c0-2.07-7.878-2.225-7.878 0v1.21c0 .17-.135.352-.3.404L1.3 7.904c-.165.052-.3-.044-.3-.213V4.88c0-.17.086-.42.191-.554C1.191 4.326 2.131 2 8 2s6.807 2.326 6.807 2.326z" fill="#B3B3B3"></path></svg>
                                            <span class="txt"> 400-660-0108</span>
                                        </p>
                                        <p>
                                            <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M14.496 10.35c-.301-1.705-1.565-2.822-1.565-2.822.18-1.548-.481-1.823-.481-1.823C12.31.915 8.089.998 8 1 7.91.998 3.689.915 3.55 5.705c0 0-.662.275-.481 1.823 0 0-1.264 1.117-1.565 2.822 0 0-.16 2.882 1.445.353 0 0 .36.96 1.022 1.823 0 0-1.183.392-1.083 1.412 0 0-.04 1.136 2.527 1.058 0 0 1.805-.137 2.347-.882h.476c.542.745 2.347.882 2.347.882 2.566.078 2.527-1.058 2.527-1.058.1-1.02-1.083-1.412-1.083-1.412a7.986 7.986 0 0 0 1.022-1.823c1.604 2.529 1.445-.353 1.445-.353z" fill="#B3B3B3" fill-rule="evenodd"></path></svg><a href="javascript:void(0);" class="qqcustomer_s" target="_blank"><span class="txt">QQ客服</span></a>        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M7.325 13.965a6.5 6.5 0 1 1 7.175-6.4C14.467 11.677 11.346 15 7.5 15c-.514 0-1.015-.06-1.498-.172.488-.178.922-.48 1.323-.863zM4 7.5a4 4 0 1 0 8 0 .5.5 0 1 0-1 0 3 3 0 1 1-6 0 .5.5 0 0 0-1 0z" fill="#B3B3B3" fill-rule="evenodd"></path></svg>
                                            <a href="http://bbs.csdn.net/forums/Service" target="_blank"><span class="txt">客服论坛</span></a>
                                        </p>
                                    </div>
                                    <div class="col-xs-6 col-md-1"></div>
                                </div>


                                <!--	-->

                            </div>
                            <!--联系结束-->
             	</div>
                <!--右下广告结束-->
                	</div>
                </div>
                

               
               	
</div> 
</body>
<style>
    a{
        cursor:pointer;
    }
</style>
<script>
    $(document).ready(function() {
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
        $('#a1 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $('#a3 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
        $('#a4 a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        });
    });


    $(document).ready(function (){
        var a=1;
        $("#jifen").ready(function (){
            $.getJSON("/user/getScoring?uid=${sessionScope.loginresult.uid}",function (data) {
                var html="";
                var count=0;
                for(var i=0;i< data.length;i++){
                    var state="";
                    if(data[i].state==0){
                        state="-";
                        number=-data[i].number;
                    }else {
                        state="+";
                        number=data[i].number;}
                    count=count+number;
                    html+='<tr>' ;
                    html+='<th>'+state+data[i].number+'</th>';
                    html+='<th>'+data[i].time+'</th>';
                    html+='<th>'+data[i].operation+'</th>';
                    html+='</tr>';
                }
                if(a==1){
                    $("#biaoge").append(html);
                    $("#jifencount").append(count);a++;
                }
            })
            //window.location.href = '/user/getScoring?uid=${sessionScope.loginresult.uid}';
        });
    });
    //查询上传的资源
    $(document).ready(function (){
        var a=1;
        $("#upload").ready(function (){
            $.getJSON("/resource/getUploadResource?uid=${sessionScope.loginresult.uid}",function (data) {
                var html="";
                for(var i=0;i< data.length;i++){
                    html+='<div class="col-md-12 well">';
                    html+='<div class="col-md-2 "><a href="/resource/loadResource?rid='+data[i].rid+'"><img src="img/2.svg"></a></div>';
                    html+='<div class="col-md-10"><div style=" font-size:20px ; color:#000000;height: 40px;"><a href="/resource/loadResource?rid='+data[i].rid+'">'+data[i].name+'</a></div>';
                    html+='<div>';
                    html+='<div style=" float: left">所需积分:&nbsp;&nbsp;&nbsp;'+data[i].scoring+'</div>';
                    html+='<div style="float: left; margin-left: 50%">'+data[i].time+'</div>';
                    html+='</div>';
                    html+='</div>';
                    html+='</div>';
                }
                if(a==1){
                    $("#panel-717300").append(html);
                    $("#uploadcount").append(data.length);a++;
                }

            });

        });

    });
</script>
</html>

<!--下载资源-->
<script>
    $(document).ready(function () {
        var a=1;
        $("#download,#downloads").ready(function () {
            $.getJSON("/resource/getdownloadResource?uid=${sessionScope.loginresult.uid}",function (data) {
                var html="";

                for(var i=0;i<data.length;i++){
              html+='<div class="col-md-12 well">';
              html+='<div class="col-md-2 "><a href="xq.jsp"><img src="img/2.svg"></a></div>';
              html+='<div class="col-md-10"><div style="height: 40px;">'+data[i].title+'</div>';
              html+='<div>';
              html+='<div style=" float: left">所需积分:&nbsp;&nbsp;&nbsp;'+data[i].scoring+'</div>';
              html+='<div style="float: left; margin-left: 50%">'+data[i].time+'</div>';
              html+='</div>';
              html+='</div>';
              html+='</div>';
                }
                if (a==1){
                    $("#panel-622342").append(html);
                    $("#downloadcount").append(data.length);
                    $("#tag").append(data.length);
                    a++;
                }
            })
        })
    })
</script>

<!--我收藏的资源-->
<script>
    $(document).ready(function () {
        var a=1;
        $("#collect,#collects").click(function () {
            $.getJSON("/resource/myCollectResource?uid=${sessionScope.loginresult.uid}",function (data) {
                var html="";
                for(var i=0;i<data.length;i++){
                    html+='<div class="col-md-12 well">';
                    html+='<div class="col-md-2 "><a href="xq.jsp"><img src="img/2.svg"></a></div>';
                    html+='<div class="col-md-10"><div style="height: 40px;">'+data[i].title+'</div>';
                    html+='<div>';
                    html+='<div style=" float: left">所需积分:&nbsp;&nbsp;&nbsp;'+data[i].scoring+'</div>';
                    html+='<div style="float: left; margin-left: 50%">'+data[i].time+'</div>';
                    html+='</div>';
                    html+='</div>';
                    html+='</div>';
                }
                if (a==1){
                    $("#panel-622343").append(html);a++;
                }
            })
        })
    })
</script>