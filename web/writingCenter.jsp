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
            $('#myTabs5 a').click(function (e) {
                e.preventDefault()
                $(this).tab('show')
            });



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
                                <li id="myTabs1" role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">全部</a></li>
                                <li id="myTabs2" role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">已发表</a></li>
                                <li id="myTabs3" role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">私密</a></li>
                                <li id="myTabs4" role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">草稿箱</a></li>
                            </ul>

						  <!-- Tab panes -->
						  <div class="tab-content">
<!--						  全部  标签页-->
							<div role="tabpanel" class="tab-pane active" id="home">

<!--				发表的博客-->
                            <div class="row" >
								<div class="span12" style="padding-left: 25px;padding-right: 25px">

									<ul>
										<script>
                                            function delet(bid) {
                                                var ajaxUrl = "/blog/deleteBlog?bid="+bid;
                                                //alert(ajaxUrl);
                                                $.post(ajaxUrl,function (data) {
                                                    if(data=="success"){
                                                        $("div").remove("#blogdiv"+bid+" div");
                                                        $("#bloghr"+bid+"").remove();
                                                        alert("删除成功")
                                                    }
                                                    else {
                                                        alert("删除失败")
                                                    }
                                                })
                                            }
                                            function setHot(t){
                                                var bar = 'showAndHide_box';
                                                var obj = $(t).parents('.'+bar).clone(true);
                                                $(t).parents('.'+bar).remove();
                                                $(".span12 ").prepend(obj);
                                            }
										</script>
										<c:forEach var="b" items="${requestScope.blogs}">
                                    <div id="blogdiv${b.bid}">
										<li>
											<div  style="padding-bottom: 3px;overflow: hidden" class="showAndHide_box">
												<a href="/blog/listBlogByBid/${b.bid}" style="cursor: pointer"><h3>${b.title}</h3></a>
												<h5 id="type" style="color:#928F8F;float: left">
														${b.userToBlog.blogtype==1 ?  "原创" : "转载"}
												&nbsp;&nbsp;</h5>
                                                <h5 style="color:#928F8F;float: left">${b.userToBlog.isdraft ==0 ? "草稿": "已发表"}
                                                    &nbsp;&nbsp;</h5>
												<h5 style="color:#928F8F;float: left">${b.time}&nbsp;&nbsp;</h5>
<!--												被阅读数-->
												<span style="color:#928F8F;margin-left: 10px"><span class="glyphicon glyphicon-eye-open" style="margin-top: 7px"></span>&nbsp;${b.points}</span>
<!--												博客设置-->
												<div style="float: right">
													<a href="/blog/listBlogByBid/${b.bid}">查看&nbsp;&nbsp;|</a><a href="#">禁止评论&nbsp;&nbsp;|</a>
													<a class="operation" id="blogzd${b.bid}" onClick="setHot(this)" style="cursor: pointer">置顶&nbsp;&nbsp;|</a>
													<a style="color: red;cursor: pointer"onclick="delet(${b.bid})" >删除</a>
												</div>
											</div>

										</li>
										<hr id="bloghr${b.bid}"/>
                                    </div>
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
                                        <c:forEach var="b" items="${requestScope.reportedblogs}">
                                            <div id="blogdiv${b.bid}">
                                            <li>
                                                <div style="padding-bottom: 3px;overflow: hidden">
                                                    <a href="/blog/listBlogByBid/${b.bid}" style="cursor: pointer"><h3>${b.title}</h3></a>
                                                    <h5 id="type2" style="color:#928F8F;float: left">
                                                            ${b.userToBlog.blogtype==1 ?  "原创" : "转载"}
                                                        &nbsp;&nbsp;</h5>
                                                    <h5 style="color:#928F8F;float: left">${b.time}&nbsp;&nbsp;</h5>
                                                    <!--												被阅读数-->
                                                    <span style="color:#928F8F;margin-left: 10px"><span class="glyphicon glyphicon-eye-open" style="margin-top: 7px"></span>&nbsp;${b.points}</span>
                                                    <!--												博客设置-->
                                                    <div style="float: right">
                                                        <a href="/blog/listBlogByBid/${b.bid}">查看&nbsp;&nbsp;|</a><a href="#">禁止评论&nbsp;&nbsp;|</a>
                                                        <a style="color: red;cursor: pointer"onclick="delet(${b.bid})" >删除</a>
                                                    </div>
                                                </div>

                                            </li>
                                                <hr id="bloghr${b.bid}"/>
                                        </div>
                                        </c:forEach>
									</ul>
								</div>
								</div>

							</div>

							<div role="tabpanel" class="tab-pane" id="messages">
                                <div class="row">
                                    <div class="span12" style="padding-left: 25px;padding-right: 25px">
                                        <ul>

                                            <c:forEach var="b" items="${requestScope.simiblogs}">
                                                <div id="blogdiv${b.bid}">
                                                <li>
                                                    <div style="padding-bottom: 3px;overflow: hidden">
                                                        <a href="/blog/listBlogByBid/${b.bid}" style="cursor: pointer"><h3>${b.title}</h3></a>
                                                        <h5 id="type3" style="color:#928F8F;float: left">
                                                                ${b.userToBlog.blogtype==1 ?  "原创" : "转载"}
                                                            &nbsp;&nbsp;</h5>
                                                        <h5 style="color:#928F8F;float: left">${b.time}&nbsp;&nbsp;</h5>
                                                        <!--												被阅读数-->
                                                        <span style="color:#928F8F;margin-left: 10px"><span class="glyphicon glyphicon-eye-open" style="margin-top: 7px"></span>&nbsp;${b.points}</span>
                                                        <!--												博客设置-->
                                                        <div style="float: right">
                                                            <a href="/blog/listBlogByBid/${b.bid}">查看&nbsp;&nbsp;|</a><a href="#">禁止评论&nbsp;&nbsp;|</a>
                                                            <a style="color: red;cursor: pointer"onclick="delet(${b.bid})" >删除</a>
                                                        </div>
                                                    </div>

                                                </li>
                                                    <hr id="bloghr${b.bid}"/>
                                            </div>
                                            </c:forEach>

                                        </ul>
                                    </div>
                                </div>
                            </div>
							<div role="tabpanel" class="tab-pane" id="settings">
                                <div class="row">
                                    <div class="span12" style="padding-left: 25px;padding-right: 25px">
                                        <ul>
                                            <c:forEach var="b" items="${requestScope.draftblogs}">
                                            <div id="blogdiv${b.bid}">
                                                <li>
                                                    <div style="padding-bottom: 3px;overflow: hidden" >
                                                        <a href="/blog/listBlogByBid/${b.bid}" style="cursor: pointer"><h3>${b.title}</h3></a>
                                                        <h5 id="type4" style="color:#928F8F;float: left">
                                                                ${b.userToBlog.blogtype==1 ?  "原创" : "转载"}
                                                            &nbsp;&nbsp;</h5>
                                                        <h5 style="color:#928F8F;float: left">${b.time}&nbsp;&nbsp;</h5>
                                                        <!--												被阅读数-->
                                                        <span style="color:#928F8F;margin-left: 10px"><span class="glyphicon glyphicon-eye-open" style="margin-top: 7px"></span>&nbsp;${b.points}</span>
                                                        <!--												博客设置-->
                                                        <div style="float: right">
                                                            <a href="/blog/listBlogByBid/${b.bid}">查看&nbsp;&nbsp;|</a><a href="#">禁止评论&nbsp;&nbsp;|</a>
                                                            <a style="color: red;cursor: pointer"onclick="delet(${b.bid})" >删除</a>
                                                        </div>
                                                    </div>

                                                </li>
                                                <hr id="bloghr${b.bid}"/>
                                            </div>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>

						  </div>

						</div>

				  </div>
				</div>
			</div>
		</div>
  	</div>

</div>
</body>

</html>
