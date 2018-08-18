<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>他人中心</title>
	  <%
		  String path = request.getContextPath();
		  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	  %>
	  <base href="<%=basePath%>">
    <!-- Bootstrap -->
    <link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body style="background-color: #E9E9E9">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.3.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <script>
		$(document).ready(function(){
			//所有li元素的点击事件
			$("li").click(function(){
				if($(this).click){
					$("li").removeClass("active");
					$(this).addClass("active");
					
				}
			});
			
			//特效,输入雷电试试
			
			$("#topSearch").keyup(function(){
				var input=$("#topSearch").val();
				if(input=="雷电"||input=="闪电"){
					$("#texiao").fadeIn(2000);
					var audio = $("#audio").get(0);
					audio.play();
					$("#texiao").fadeOut(7000);
					
				}
			});
			//输入旋转
			var r=360;
			$("#topSearch").keyup(function(){
				var input=$("#topSearch").val();
				
				if(input=="旋转"){
					
					var xuanzhuan=$("#xuanzhuan").get(0);
					xuanzhuan.play();
					$("#fluid_Div").css({						
						transform:"rotate("+r+"deg)",
						transition:"1s",
						
					});
					r+=360;
				}
			});
		
			
		});  
	 
	</script>


	<div id="fluid_Div" class="container-fluid">
	
<!--	导航栏-->
        <%@ include file="top.jsp"%>
	<!--	导航栏结束-->
		<!-- Stack the columns on mobile by making one full-width and the other half-width -->
<div style="background-color:#F8F8F8; margin: 30px;padding: 10px;" class="row well-lg">
  <div  class="col-xs-12 col-md-8">
		<div  class="col-xs-6 col-md-1"></div>
		<div  class="col-xs-6 col-md-3">
		<div class="well" style="width: 150px;height: 150px;"><img src="img/adminIcon.jpg" class="img-responsive img-rounded" alt="Responsive image"></div>

		<ul class="nav nav-pills" role="tablist">
		  <li role="presentation" ><a href="#">关注 <span class="badge">42</span></a></li>
		  <li role="presentation"><a href="#">粉丝<span class="badge">3</span></a></li>
		</ul></div>
		<div style=" margin-top: 10px;" class="col-xs-6 col-md-4">
	  	<blockquote>
		  <p>NickName</p>
		  <footer>Provience <cite title="Source Title">City</cite></footer>
		</blockquote>
		<h3><span class="label label-success">博客2</span></h3>
	  </div>
		<div  class="col-xs-6 col-md-4"></div>
	</div>
  <div style="margin-top: 30px;" class="col-xs-6 col-md-4">
  <div class="col-xs-6"></div>
  <div class="col-xs-6">
	  <button  type="button" class="btn btn-success">+关注</button>
	  <button  type="button" class="btn btn-success" style="outline: none">发私信</button>
  </div>
  
  </div>
</div>

<!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
<div class="row well-lg" style="margin: 30px;padding: 10px; background-color:#F8F8F8 ">
  <div  class="col-xs-6 col-md-4">
		<!-- Indicates caution should be taken with this action -->
		<button style="margin-left: 20%;outline: none" type="button" class="btn btn-danger">发表的博客</button>
		<button type="button" class="btn btn-default" style="outline: none;">贡献的资源</button>
		<h3 style="margin-left: 100px;">h3. Bootstrap heading</h3>
		<h3 style="margin-left: 100px;">h3. Bootstrap heading</h3>
		<h3 style="margin-left: 100px;">h3. Bootstrap heading</h3>
		
	</div>
  <div style="padding-top: 30px;" class="col-xs-6 col-md-4">
  <h3 style="margin-left: 100px;"><small>30人阅读 &nbsp;&nbsp;</small><small class="glyphicon glyphicon-comment" style="cursor: pointer">评论(0)</small></h3>
  <h3 style="margin-left: 100px;"><small>10人阅读 &nbsp;&nbsp;</small><small class="glyphicon glyphicon-comment" style="cursor: pointer">评论(0)</small></h3>
  <h3 style="margin-left: 100px;"><small>22人阅读 &nbsp;&nbsp;</small><small class="glyphicon glyphicon-comment" style="cursor: pointer">评论(0)</small></h3>
  </div>

</div>

<!-- Columns are always 50% wide, on mobile and desktop -->
<div class="row">
  <div class="col-xs-6"></div>
  <div class="col-xs-6"></div>
</div>
<!--底部信息-->
<div class="row">
	<nav class="navbar navbar-default navbar-static-bottom">
	  <div class="container">
		<div class="page-header">
  <h1>Welcome to join us <small>Subtext for header</small></h1>
</div>
	  </div>
	</nav>
	
</div>
<!--底部信息-结束-->
	</div>
  </body>
</html>