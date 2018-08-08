<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
    <!-- Le styles -->
   
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
                      <li ><a href="#">下载首页</a></li>
                      <li ><a href="#panel-717300" data-toggle="tab" contenteditable="true">我的资源</a></li>
                      <li ><a href="upload.jsp">上传资源赚积分</a></li>
                      <li ><a href="#panel-622342" data-toggle="tab" contenteditable="true">已下载</a></li>
                      <li ><a href="#panel-622343" data-toggle="tab" contenteditable="true">我的收藏</a></li>
                    </ul>

             </div>
        	<!--二级导航结束-->
            
			
            	
                <!--中间第一部分内容开始-->
     			<div class="row well" style="background-color:#FFF;margin-left: 15%;margin-right: 15%;margin-top: 2%;min-width: 1024px; ">
                      <div>	
                      	   	
                            <img style="width:100px;height:100px;margin-top:3%;margin-left:3%;" alt="140x140" src="img/log.jpg" class="img-circle" />
                      		<div style="margin-left:14.7%; margin-top:-9%;">qq_41581629</div>
                            <div style="margin-left:14.7%; padding-top:1%;">
                            	<span class="label" contenteditable="true" style="background-color:#9DC75F;">下载
                                <span class="badge" contenteditable="true" style="background-color:#2D5315;">1</span></span> 上传权限：<span>220MB</span>
                             </div>
                      </div>
                      <div style=" margin-left:5%; margin-top:8%;">
                      	
                        <span style="float:left;">积分<div style="color:#36F;font-weight:bolder">0</div></span>
                        <span style="margin-left:8%;float:left">总排名<div style="color:#36F;font-weight:bolder">200000+</div></span>
                        <span style="margin-left:8%;float:left">上传资源<div style="color:#36F;font-weight:bolder">0</div> </span>   
                        <span style="margin-left:8%;float:left">下载资源<div style="color:#36F;font-weight:bolder">0</div></span>     
                        <span style="margin-left:8%;float:left">创建专辑<div style="color:#36F;font-weight:bolder">0</div></sapn>
                           
                      </div>
  				</div >
                <!--中间第一部分内容结束-->
                
                
                <div class="row well" style="margin-left: 15%;margin-right: 15%; min-width:1024px;">
                <!--左下选项卡切换开始-->
                	<div class="col-xs-8">
                	<div style="min-height:230px;">
        			<div class="tabbable" id="tabs-853379"> <!-- Only required for left/right tabs -->
                      <ul class="nav nav-tabs">
                        <li class="active"><a href="#panel-717300" data-toggle="tab" contenteditable="true">上传资源</a></li>
                        <li class=""><a href="/#panel-622341" data-toggle="tab" contenteditable="true">积分明细</a></li>
                        <li class=""><a href="/#panel-622342" data-toggle="tab" contenteditable="true">下载明细</a></li>
                        <li class=""><a href="/#panel-622343" data-toggle="tab" contenteditable="true">我的收藏</a></li>
                        <li class=""><a href="/#panel-622344" data-toggle="tab" contenteditable="true">VIP服务</a></li>
                      </ul>
                      <div class="tab-content">
                            <div class="tab-pane active" id="panel-717300" contenteditable="true">
                              <p>上传资源.</p>
                            </div>
                            <div class="tab-pane" id="panel-622341" contenteditable="true">
                              <p><table class="table" contenteditable="true">
                                    <thead>
                                        <tr>
                                            <th>分数</th>
                                            <th>时间</th>
                                            <th>下载资源</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                                </p>
                            </div>
                            <div class="tab-pane" id="panel-622342" contenteditable="true">
                              <p>下载明细.</p>
                            </div>
                            <div class="tab-pane" id="panel-622343" contenteditable="true">
                              <p>我的收藏.</p>
                            </div>
                            <div class="tab-pane" id="panel-622344" contenteditable="true">
                              <p>VIP服务.</p>
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
               
                        <div class="media-body" contenteditable="true">
                           <h4 class="media-heading">嵌入媒体标题</h4>
                           请尽量使用HTML5兼容的视频格式和视频代码实现视频播放, 以达到更好的体验效果. 
                        </div>
             	</div>
                <!--右下广告结束-->
                	</div>
                </div>
                
        		
               
               	
</div> 
</body>
</html>
