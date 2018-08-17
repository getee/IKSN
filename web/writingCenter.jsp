<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>无标题文档</title>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
	<base href="<%=basePath%>">

	<link type="text/css" href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="bootstrap-3.3.7/dist/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="bootstrap-3.3.7/dist/css/bootstrap-theme.min.css" crossorigin="anonymous">

	<script src="js/jquery-3.3.1.js"></script>
	<script src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	<script src="js/depend.js"></script>
	<script>
		$(document).ready(function(){
			$('#myTabs a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			})

		});
	</script>
</head>

<body  style="background-color:#EBEBEB">
	<c:if test="${requestScope.blogs eq null}">
		<c:redirect url='/listBlogByUid/${sessionScope.loginresult.uid}'></c:redirect>
	</c:if>
	<div class="container-fluid">

		<!--	导航栏-->
        <%@ include file="top.jsp"%>
	<!--	导航栏结束-->

	<div class="row" style="margin-top: 10px">
    	<div class="col-xs-6 col-md-1"></div>

		<div class="col-xs-6 col-md-10" style="background-color:#F9F9F9">
			<div class="container-fluid">
				<div class="row">
				  <div class="col-xs-6 col-md-2">
				  		<h5 style="margin-top: 20px;color: #ABA8A8">内容</h5>
						<ul class="nav nav-pills nav-stacked">
						  <li class="active"><a href="#">文章管理</a></li>
						  <li><a href="#">专栏管理</a></li>
						  <li><a href="#">评论管理</a></li>
						  <li><a href="#">Char快问</a></li>
						  <li><a href="#">博客搬家</a></li>
						  <li><a href="#">数据库</a></li>
						  <li><a href="#">程序人生</a></li>
						</ul>
						<h5 style="color: #ABA8A8">设置</h5>
						<ul class="nav nav-pills nav-stacked">
							<li><a href="#">博客设置</a></li>
							<li><a href="#">栏目管理</a></li>
						</ul>
				  </div>
				  <div class="col-xs-12 col-md-10">
				  		<h4 style="margin-top: 10px">||文章管理</h4>

				  		<div>

						  <!-- Nav tabs -->
						  <ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">全部&nbsp;(2)</a></li>
							<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">已发表&nbsp;(2)</a></li>
							<li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">私密&nbsp;(0)</a></li>
							<li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">草稿箱</a></li>
							<li role="presentation"><a href="#settings" aria-controls="delete" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-trash"></span>回收站</a></li>
						  </ul>

						  <!-- Tab panes -->
						  <div class="tab-content">
<!--						  全部  标签页-->
							<div role="tabpanel" class="tab-pane active" id="home">
								<div class="row" style="margin-top: 10px; padding: 15px;background-color: #F4EEEE">
								  <div class="col-xs-6 col-md-1" style="padding-right: 0;padding-left: 5px">
								  		<h5>发布时间</h5>
								  </div>
								  <div class="col-xs-6 col-md-2" style="">

								  		<div class="form-group" style="margin-top: 7px">
										<select style="width: 90%;height: 30px;border: none;border-radius: 4px">
											<option>不限</option>
											<option>B</option>
											<option>C</option>
										</select>
										</div>

								  </div>
								  <div class="col-xs-6 col-md-2">

								  		<div class="form-group" style="margin-top: 7px">
										<select style="width: 90%;height: 30px;border: none;border-radius: 4px">
											<option>不限</option>
											<option>B</option>
											<option>C</option>
										</select>
										</div>

								  </div>
								  <div class="col-xs-6 col-md-2">

								  		<div class="form-group" style="margin-top: 7px">
										<select style="width: 90%;height: 30px;border: none;border-radius: 4px">
											<option>不限类型</option>
											<option>原创</option>
											<option>转载</option>
											<option>翻译</option>
										</select>
										</div>

								  </div>
								  <div class="col-xs-6 col-md-5">
								  		<form class="navbar-form navbar-left" style="padding-left: 0">
											<div class="form-group">
											  <input id="star" type="text" class="form-control" placeholder="Fuck you">
											</div>
											<button type="submit" class="btn btn-default">搜索</button>
										</form>
								  </div>
								</div>

<!--								发表的博客-->
								<div class="row">
								<div class="span12" style="padding-left: 25px;padding-right: 25px">
									<ul>

					<c:forEach var="b" items="${requestScope.blogs}">
										<li>
											<div style="padding-bottom: 3px;overflow: hidden">
												<a><h3>${b.title}</h3></a>
												<h5 id="type" style="color:#928F8F;float: left">
														${b.userToBlog.blogtype==1 ?  "原创" : "转载"}
												&nbsp;&nbsp;</h5>

												<h5 style="color:#928F8F;float: left">${b.time}&nbsp;&nbsp;</h5>
<!--												被阅读数-->
												<span style="color:#928F8F;margin-left: 10px"><span class="glyphicon glyphicon-eye-open" style="margin-top: 7px"></span>&nbsp;${b.points}</span>
<!--												被评论数-->
												<span style="color:#928F8F;margin-left: 10px"><span class="glyphicon glyphicon-comment" style="margin-top: 7px"></span>&nbsp;0</span>
<!--												博客设置-->
												<div style="float: right">
													<a href="#">查看&nbsp;&nbsp;|</a><a href="#">禁止评论&nbsp;&nbsp;|</a><a href="#">置顶</a>
												</div>
											</div>

										</li>
										<hr />
						</c:forEach>
									</ul>
								</div>
								</div>

							</div>
<!--							已发表标签页-->
							<div role="tabpanel" class="tab-pane" id="profile">

<!--								已发表的博客-->
								<div class="row">
								<div class="span12" style="padding-left: 25px;padding-right: 25px">
									<ul>
										<li>
											<div style="padding-bottom: 3px;overflow: hidden">
												<a><h3>第一个博客</h3></a>
												<h5 style="color:#928F8F;float: left">原创&nbsp;&nbsp;</h5>
												<h5 style="color:#928F8F;float: left">2018年8月2日16：05：25&nbsp;&nbsp;</h5>
<!--												被阅读数-->
												<span style="color:#928F8F;margin-left: 10px"><span class="glyphicon glyphicon-eye-open" style="margin-top: 7px"></span>&nbsp;0</span>
<!--												被评论数-->
												<span style="color:#928F8F;margin-left: 10px"><span class="glyphicon glyphicon-comment" style="margin-top: 7px"></span>&nbsp;0</span>
<!--												博客设置-->
												<div style="float: right">
													<a href="#">查看&nbsp;&nbsp;|</a><a href="#">&nbsp;&nbsp;禁止评论&nbsp;&nbsp;|</a><a href="#">&nbsp;&nbsp;置顶&nbsp;&nbsp;|</a><a href="#" style="color:#901919">&nbsp;&nbsp;删除</a>
												</div>
											</div>

										</li>
										<hr />

										<li>
											<div style="padding-bottom: 3px;overflow: hidden">
												<a><h3>第二个博客</h3></a>
												<h5 style="color:#928F8F;float: left">原创&nbsp;&nbsp;</h5>
												<h5 style="color:#928F8F;float: left">2018年8月2日16：05：25&nbsp;&nbsp;</h5>
<!--												被阅读数-->
												<span style="color:#928F8F;margin-left: 10px"><span class="glyphicon glyphicon-eye-open" style="margin-top: 7px"></span>&nbsp;0</span>
<!--												被评论数-->
												<span style="color:#928F8F;margin-left: 10px"><span class="glyphicon glyphicon-comment" style="margin-top: 7px"></span>&nbsp;0</span>
<!--												博客设置-->
												<div style="float: right">
													<a href="#">查看&nbsp;&nbsp;|</a><a href="#">&nbsp;&nbsp;禁止评论&nbsp;&nbsp;|</a><a href="#">&nbsp;&nbsp;置顶&nbsp;&nbsp;|</a><a href="#" style="color:#901919">&nbsp;&nbsp;删除</a>
												</div>
											</div>

										</li>
										<hr />

									</ul>
								</div>
								</div>

							</div>
							<div role="tabpanel" class="tab-pane" id="messages">...</div>
							<div role="tabpanel" class="tab-pane" id="settings">...</div>
							<div role="tabpanel" class="tab-pane" id="delete">...</div>
						  </div>

						</div>

				  </div>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-md-1"></div>
  	</div>

	</div>


</body>
</html>
