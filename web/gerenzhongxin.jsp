<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>
	  <%
		  String path = request.getContextPath();
		  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	  %>
	  <base href="<%=basePath%>">
    <!-- Bootstrap -->
    <link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	  <link rel="stylesheet" href="css/amazeui.min.css">
	  <link rel="stylesheet" href="css/amazeui.cropper.css">
	  <link rel="stylesheet" href="css/custom_up_img.css">
	  <link rel="stylesheet" type="text/css" href="css/font-awesome.4.6.0.css">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
  </head>
  <body style="background-color: #E9E9E9">
   <audio id="audio" src="caidan/media/5842.mp3"></audio>
	<audio id="penquan" src="caidan/media/penquan.wav"></audio>
   	<audio id="xuanzhuan" src="caidan/media/579888piCnbB.mp3"></audio>
<div id="canvas" style="position: fixed;z-index: 10; display: none;width:100%;height: 100%">
	<%--<iframe src="caidan/html/penquan.html" style="width:100%;height: 100%"></iframe>--%>
</div>
	<div id="texiao" style="position: fixed;z-index: 10;width: 100%;height: 100%;margin: 0px; display: none">
		<iframe style="width: 100%;height: 100%" src="caidan/html/shandian.html"></iframe>
	</div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.3.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
   <script src="js/amazeui_2.7.2_js_amazeui.min.js" charset="utf-8"></script>
   <script src="js/cropper.min.js" charset="utf-8"></script>
   <script src="js/custom_up_img.js" charset="utf-8"></script>
    <script>
		$(document).ready(function(){

			//全选(根据ID选中)
			$("#checkAll").click(function(){
				var c=$(this).prop("checked");
				if(c){
				$("#check1").prop("checked",true);
				$("#check2").prop("checked",true);	
				}else{
				$("#check1").prop("checked",false);
				$("#check2").prop("checked",false);
				}
			});
			//写私信时提交不合法时弹出的警告
			$("#submitMessage").click(function(){
				if($("#exampleInputEmail1").val()==""){
					$("#alertDanger").css("display","block");
				}

			});




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
    
	<div id="fluid_Div" class="container-fluid">

	
<!--	导航栏-->
        <%@ include file="top.jsp"%>
	<!--	导航栏结束-->
<div class="row" style="background-color:#E9E9E9;margin-left: 15%;margin-right: 15%">
	<table class="table well" style="margin: 0px">
	  <tr>
	  	<td style="cursor: pointer"><a class="text-muted" href="gerenzhongxin.jsp"><h4>个人中心</h4></a></td>
	  	<td style="cursor: pointer"><a class="text-muted" href="/user/listAllFriends/${sessionScope.loginresult.uid}/1"><h4>我的消息</h4></a></td>
	  	<td style="cursor: pointer"><a class="text-muted" href="jifenzhongxin.jsp"><h4>积分</h4></a></td>
	  	<td style="cursor: pointer"><a class="text-muted" href="/blog/mGetAllReportBlog"><h4>我的博客</h4></a></td>
	  	<td style="cursor: pointer"><a class="text-muted" href="wodexiazai.jsp"><h4>我的下载</h4></a></td>
		  <c:if test="${sessionScope.loginresult.isadmin eq '1'}">
			  <td style="cursor: pointer"><a class="text-muted" href="/blog/mGetAllReportBlog"><h4>举报管理</h4></a></td>
		  </c:if>
	  </tr>
	</table>
	
</div>
<div class="row well" style="margin-top: 2%; margin-left: 15%;margin-right: 15%">
<!--用户头像-->
	<div class="col-md-2 " >

		<div class="up-img-cover" id="up-img-touch">
			<img class="am-circle img-responsive" alt="点击图片上传" src="${sessionScope.loginresult.picturepath}" data-am-popover="{content: &#39;点击上传&#39;, trigger: &#39;hover focus&#39;}">
		</div>

		<!--弹出框开始-->
		<div class="am-modal am-modal-no-btn up-modal-frame" tabindex="-1" id="up-modal-frame">
			<div class="am-modal-dialog up-frame-parent up-frame-radius">
				<div class="am-modal-hd up-frame-header">
					<label>修改头像</label>
					<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
				</div>
				<div class="am-modal-bd  up-frame-body">
					<div class="am-g am-fl">
						<form method="post" enctype="multipart/form-data">
						<div class="am-form-group am-form-file">
							<div class="am-fl">
								<button type="button" class="am-btn am-btn-default am-btn-sm">
									<i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
							</div>
							<input type="file" name="file" class="up-img-file">
						</div>
						</form>
					</div>
					<div class="am-g am-fl">
						<div class="up-pre-before up-frame-radius">
							<img alt="" src="" class="up-img-show" id="up-img-show">
						</div>
						<div class="up-pre-after up-frame-radius">
						</div>
					</div>
					<div class="am-g am-fl">
						<div class="up-control-btns">
							<span class="am-icon-rotate-left" id="up-btn-left"></span>
							<span class="am-icon-rotate-right" id="up-btn-right"></span>
							<%--提交按钮--%>
							<span class="am-icon-check up-btn-ok" url="/user/uploadImg/${sessionScope.loginresult.uid}" parameter="{width:&#39;100&#39;,height:&#39;100&#39;}">
</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="up-modal-loading">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">正在上传...</div>
				<div class="am-modal-bd">
					<span class="am-icon-spinner am-icon-spin"></span>
				</div>
			</div>
		</div>

		<div class="am-modal am-modal-alert" tabindex="-1" id="up-modal-alert">
			<div class="am-modal-dialog">
				<div class="am-modal-hd">信息</div>
				<div class="am-modal-bd" id="alert_content">
					成功了
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn">确定</span>
				</div>
			</div>
		</div>
		<!--弹出框结束-->
		<div class="am-popover am-popover-bottom" id="am-popover-rzdre" style="display: none; top: 110px; left: 9px;"><div class="am-popover-inner">点击上传</div><div class="am-popover-caret"></div></div>
		<%--<img id="userImg"  src="${sessionScope.loginresult.picturepath}" class="img-responsive img-rounded" alt="Responsive image" style="cursor: pointer">--%>
		<%--<span id="imgSpan" style="position: absolute; bottom: 0; left:23%;display: none">双击修改头像</span>--%>

	</div>
<!--	用户信息-->
	<div class="col-md-10">
		<div class="row">
			<div class="col-md-6">
			<h3>${sessionScope.loginresult.nickname}</h3>
				<h3 ><span class="label label-info ">等级<span class="badge" name="grade">
				${sessionScope.loginresult.grade}
				</span></span></h3>
			</div>
			<div class="col-md-6">
										<!-- Button trigger modal -->
				<button type="button" class="btn btn-info btn-sm glyphicon glyphicon-edit" data-toggle="modal" data-target="#myModal" style="margin-left: 60%">
					修改个人资料
				</button>
				<button  type="button"  color="#FFFFFF" class="btn btn-info btn-sm glyphicon glyphicon-edit" data-toggle="modal" style="margin-left: 60%; margin-top:2%">
					<a href="zhanghao.jsp" ><font color="#FFFFFF">个人账号设置</font></a>
				</button>

						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 10%">
						  <div class="modal-dialog" role="document">
							<div class="modal-content">
							  <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">编辑简介</h4>
							  </div>
							  <div class="modal-body">
							<!--修改表单-->
								  <form action="/user/updateuser" method="post">
									  <div class="form-group">
										  <input type="hidden" name="uid" value="${sessionScope.loginresult.uid}"/>
										  <label for="exampleInputEmail1">昵称</label>
										  <input type="text" class="form-control" name="nickname" id="" placeholder="NickName" value="${sessionScope.loginresult.nickname}">
									  </div>

									  <div class="form-group">
										  <label class="radio-inline">
											  <input type="radio" name="sex" id="inlineRadio1" value="0"> 男
										  </label>
										  <label class="radio-inline">
											  <input type="radio" name="sex" id="inlineRadio2" value="1"> 女
										  </label>
									  </div>

									  <div class="form-group">
										  <label for="exampleInputEmail1">邮箱</label>
										  <div class="input-group">
											  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email1"  disabled value="${sessionScope.loginresult.email}">
											  <span class="input-group-btn">
                                          <button class="btn btn-default" type="button"><a href="zhanghao.jsp"> 修改</a></button>
                                        </span>
										  </div>
									  </div>

									  <div class="form-group">
										  <illegalresourcelabel for="exampleInputPassword1">手机号码</illegalresourcelabel>
										  <div class="input-group">
											  <input type="number" class="form-control" id="exampleInputPassword1" placeholder="Phone"  disabled value="${sessionScope.loginresult.phone}">
											  <span class="input-group-btn">
                                        <button class="btn btn-default" type="button"><a href="zhanghao.jsp"> 修改</a></button>
                                      </span>
										  </div>
									  </div>

									  <div class="form-group">
										  <label for="exampleInputEmail1">自我简介</label>
										  <textarea placeholder="自我简介" name="introduce" style=" width:100%;height: 100px;" value="${sessionScope.loginresult.introduce}"></textarea>
									  </div>
									  <div class="modal-footer">
										  <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
										  <input type="submit" class="btn btn-primary"></input>
									  </div>

								  </form>
							  </div>

							</div>
						  </div>
						</div>
			</div>
		</div>
	</div>
</div>


<!--面板-->
<div class="row well" style="margin-left: 15%;margin-right: 15%">
	<div style="margin-top: -1%">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li id="myTabs1" role="presentation" class="active"><a id="blog" href="#home" aria-controls="home" role="tab" data-toggle="tab">我的博客</a></li>
    <li id="myTabs2" role="presentation"><a id="collect" href="#profile" aria-controls="profile" role="tab" data-toggle="tab">我的收藏</a></li>
    <li id="myTabs3" role="presentation"><a id="attention" href="#messages" aria-controls="messages" role="tab" data-toggle="tab">我的关注</a></li>
    <li id="myTabs4" role="presentation"><a id="fans" href="#settings" aria-controls="settings" role="tab" data-toggle="tab">我的粉丝</a></li>

    <li id="myTabs5" role="presentation"><a href="#jubao" aria-controls="jubao" role="tab" data-toggle="tab">举报管理</a></li p
  <!-- Tab panes -->
  <div class="tab-content">

	   <!--    	文章内容-->
    <div role="tabpanel" class="tab-pane active" id="home">

    </div>

	  <!--    	收藏内容-->
    <div role="tabpanel" class="tab-pane" id="profile">

    </div>


<!--    我的关注列表-->
    <div role="tabpanel" class="tab-pane" id="messages">
		<div id="area" class="row" style="margin-top: 1%;margin-left: 1%;margin-right: 1%">
      </div>
    </div>
<!--    粉丝列表-->
    <div role="tabpanel" class="tab-pane" id="settings">
    	<div id="fansArea" class="row" style="margin-top: 1%;margin-left: 1%;margin-right: 1%">

    	</div>
    </div>

	  <div role="tabpanel" class="tab-pane" id="jubao">
		  <div class="row " id="test" style="margin: auto">
		  </div>
		  <!--    	文章内容-->

          <c:forEach var="item" items="${ReportBlogList}">
              <div id="${item.id}" class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9">
                  <div class="col-xs-12 col-md-8"><h4><a class="text-muted" href="/blog/mCheckReportblog/${item.blog.bid}/${item.reason}/${item.id}">${item.blog.title}</a></h4><small style="margin-left: 2% ">举报原因：${item.reason}</small></div>
                  <div class="col-xs-6 col-md-4"><small style="margin-right: 20% ">2017-8-2</small>
                      <a href="javascript:delete_oneReportBlog(${item.id})">
                          <small id="del_oneReportBlog" data-toggle="modal" style="margin-right:3%;cursor: pointer" class="glyphicon glyphicon-trash"></small>
                      </a>
                  </div>
              </div>
          </c:forEach>
		  <div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">举报内容</a><small style="margin-left: 80% ">2017-8-2</small><small style="margin-left:3%;cursor: pointer" class="glyphicon glyphicon-trash"></small></h4>
		  </div>
	  </div>
  </div>

</div>
</div>

<!--管理员权限-->

<script>
    function delete_oneReportBlog(url){
        var  userChoice=window.confirm("您确认要去除这个博客吗?");
        var a="blog/mReject_oneReportblog/"+url;
        if(userChoice)
        {
            $.get(a,function(data,status){
                $("#"+url).hide();

            });
            //location.href="blog/mReject_oneReportblog/"+url;
        }
    }
</script>





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

  <!--我的博客-->
  <script>
      $(document).ready(function () {
          var a=1;
          $("#blog").ready(function () {
              $.getJSON("/blog/myBlog?uid=${sessionScope.loginresult.uid}",function (data) {
                  var html="";
                  for(var i=0;i<data.length;i++){
                      html+='<div class="col-md-12 well" style="cursor: pointer" >'
                      html+='<div ><a href="/blog/listBlogByBid/'+data[i].bid+'"><h3>'+data[i].title+'</h3></a></div>'
                      html+='<div>';
                      html+='<div style="float: left; "><h4>'+data[i].time+'</h4></div>'
                      html+= '<div style="float: left;margin-left: 500px"><a href="/blog/listBlogByBid/'+data[i].bid+'">查看</a></div>';
                      html+='</div>';
                      html+='</div>';

                  }
                  if (a==1){
                      $("#home").append(html);a++;
                  }
              })
          })
      })
  </script>


  <!--收藏内容-->
  <script>
      $(document).ready(function () {
         var a=1;
          $("#collect").click(function () {
              $.getJSON("/blog/myCollectBlog?uid=${sessionScope.loginresult.uid}",function (data) {
                  var html="";
                  for(var i=0;i<data.length;i++){

                      html+='<div class="col-md-12 well" style="cursor: pointer" >'
                      html+='<div ><a href="/blog/listBlogByBid/'+data[i].bid+'"><h3>'+data[i].title+'</h3></a></div>'
                      html+='<div>';
                      html+='<div style="float: left; "><h4>'+data[i].time+'</h4></div>'
                      html+= '<div style="float: left;margin-left: 500px"><a href="/blog/listBlogByBid/'+data[i].bid+'">查看</a></div>';
                      html+='</div>';
                      html+='</div>';

                  }
                  if (a==1){
                      $("#profile").append(html);a++;
                  }
              })
          })
      })
  </script>






<script>
    $(document).ready(function (){
        var a=1;
        //我的关注
        $("#attention").click(function (){
            $.getJSON("/user/myAttention?uid=${sessionScope.loginresult.uid}",function (data) {
                var html="";
                for(var i=0;i<data.length;i++){
                    html+='<div class="col-md-12 well"><div style="height: 50px;" class="col-md-4 "><img style="height: 50px;" class="img-responsive img-rounded" src="'+data[i].picturepath+'"></div><div class="col-md-8 "><h4>' + data[i].nickname + '</h4></div></div>';
                }
                if(a==1){
                    $("#area").append(html);a++;
				}

            });

        });

    });
    $(document).ready(function () {
		var a=1;
        //我的粉丝
        $("#fans").click(function (){
            $.getJSON("/user/myFans?uid=${sessionScope.loginresult.uid}",function (data) {
                var html="";
                for(var i=0;i<data.length;i++){
                    html+='<div class="col-md-12 well"><div style="height: 50px;" class="col-md-4 "><img style="height: 50px;" class="img-responsive img-rounded" src="'+data[i].picturepath+'"></div><div class="col-md-8 "><h4>' + data[i].nickname + '</h4></div></div>';
                }
                if(a==1){
                    $("#fansArea").append(html);a++;
                }
            });

        });
    })
</script>


</html>