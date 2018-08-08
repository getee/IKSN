<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
    <link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
</head>
<body style="background-color:#F7F8F9">
  <!--	导航栏-->
  <%@ include file="top.jsp"%>
	<!--	导航栏结束-->
     
     	<!--二级导航开始-->
     	<div class="row"  style="margin-top: -1.2%; font-size:16px;background-color:#EAEBEC; min-width:1024px;" >
 
                    <ul class="nav nav-tabs"  style="margin-left:15%;" >
                      <li ><a href="#">下载首页</a></li>
                      <li ><a href="myresource.jsp?#panel-717300">我的资源</a></li>
                      <li ><a href="upload.jsp">上传资源赚积分</a></li>
                      <li ><a href="myresource.jsp?#panel-622342">已下载</a></li>
                      <li ><a href="myresource.jsp?#panel-622343">我的收藏</a></li>
                    </ul>

             </div>
          <!--二级导航结束-->
            
        	<div contenteditable="true" style="margin-left: 15%;margin-right: 15%; min-width:1024px;margin-top:3%;"><a href="#">下载频道</a> > 资源上传</div>
            <div class="row well" style="margin-left: 15%;margin-right: 15%; min-width:1024px;">
            <!--中间主内容开始-->
            <div class="col-xs-8">
              <div style="min-height:230px;"> 
            	<div>
               <form>
                        <fieldset>
                        <legend contenteditable="true">上传资源</legend>
                        <label>
                          <input style="position:absolute;opacity:0;" type="file" name="file" id="Album_img" />
                          <img  src="img/upload.png">
                        </label><br /> 
                        <label contenteditable="true">表签名</label><br />
                        <input style="height:28px;" type="text" placeholder="Type something…">
                        <span class="help-block" contenteditable="true">这里填写帮助信息.</span>
                        <label class="checkbox" contenteditable="true">
                        <input type="checkbox"> 勾选同意
                        </label>
                        <button type="submit" class="btn" contenteditable="true">提交</button>
                        </fieldset>
                    </form>
            </div >
           </div>
           <!--中间主内容结束--> 
           </div>
           
           <div class="col-xs-4 well">
           <!--右下角上传须知开始-->
            <div >
                <p style="font-size:16px;">上传须知</p>
                <ul contenteditable="true">
                    <p><li>如涉及侵权内容,您的资源将被移除</li></p>
                    <p><li>请勿上传小说、mp3、图片等与技术无关的内容.一旦发现将被删除</li></p>
                    <p><li>请勿在未经授权的情况下上传任何涉及著作权侵权的资源，除非该资源完全由您个人创作</li></p>
                    <p><li>点击上传资源即表示您确认该资源不违反资源分享的使用条款，并且您拥有该资源的所有版权或者上传资源的授权</li></p>
                    <p><li>您上传的资源如果因版权、使用、内容完整度 等原因被举报并通过官方审核，将扣除通过该资源获得的全部积分</li></p>
                </ul>
            </div>
            <!--右下角上传须知结束-->
           </div>
         </div>
</body>
</html>
