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
	<iframe src="caidan/html/penquan.html" style="width:100%;height: 100%"></iframe>
</div>
	<div id="texiao" style="position: fixed;z-index: 10;width: 100%;height: 100%;margin: 0px; display: none">
		<iframe style="width: 100%;height: 100%" src="caidan/html/shandian.html"></iframe>
	</div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.3.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
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
	  	<td style="cursor: pointer"><a class="text-muted" href="#"><h4>我的下载</h4></a></td>
	  </tr>
	</table>
	
</div>
<div class="row well" style="margin-top: 2%; margin-left: 15%;margin-right: 15%">
<!--用户头像-->
	<div class="col-md-2 " >
		<img src="img/adminIcon.jpg" class="img-responsive img-rounded" alt="Responsive image">
	</div>
<!--	用户信息-->
	<div class="col-md-10">
		<div class="row">
			<div class="col-md-6">
			<h3>NickName</h3>
				<h3><span class="label label-info ">等级 <span class="badge">3</span></span></h3>
			
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
								  <form>
									  <div class="form-group">
										  <label for="exampleInputEmail1">昵称</label>
										  <input type="text" class="form-control" id="" placeholder="NickName">
									  </div>

									  <div class="form-group">
										  <label class="radio-inline">
											  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 男
										  </label>
										  <label class="radio-inline">
											  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> 女
										  </label>
									  </div>

									  <div class="form-group">
										  <label for="exampleInputEmail1">邮箱</label>
										  <div class="input-group">
											  <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email1"  disabled>
											  <span class="input-group-btn">
                                          <button class="btn btn-default" type="button">修改</button>
                                        </span>
										  </div>
									  </div>

									  <div class="form-group">
										  <label for="exampleInputPassword1">手机号码</label>
										  <div class="input-group">
											  <input type="number" class="form-control" id="exampleInputPassword1" placeholder="Phone"  disabled>
											  <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">修改</button>
                                      </span>
										  </div>
									  </div>

									  <div class="form-group">
										  <label for="exampleInputEmail1">自我简介</label>
										  <input type="text" class="form-control" id="" placeholder="自我简介">
									  </div>

								  </form>
							  </div>
							  <div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-primary">保存修改</button>
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
    <li id="myTabs1" role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">我的博客</a></li>
    <li id="myTabs2" role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">我的收藏</a></li>
    <li id="myTabs3" role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">我的关注</a></li>
    <li id="myTabs4" role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">我的粉丝</a></li>
    <li id="myTabs5" role="presentation"><a href="#jubao" aria-controls="jubao" role="tab" data-toggle="tab">举报管理</a></li>
  </ul>


  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    	<div class="row " style="margin: auto">
    		<h4 class="text-primary" style="margin-left: 93%;"><a class="text-muted" href="#">文章管理</a></h4>
    	</div>
<!--    	文章内容-->
   		<div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">博客内容</a><small style="margin-left: 80% ">2017-8-2</small><small style="margin-left:3%;cursor: pointer" class="glyphicon glyphicon-trash"></small></h4>
   		</div>
   		<div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">博客内容</a><small style="margin-left: 80% ">2017-8-2</small><small style="margin-left:3%;cursor: pointer" class="glyphicon glyphicon-trash"></small></h4>
   		</div>
   		<div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">博客内容</a><small style="margin-left: 80% ">2017-8-2</small><small style="margin-left:3%;cursor: pointer" class="glyphicon glyphicon-trash"></small></h4>
   		</div>
    </div>
    
    <div role="tabpanel" class="tab-pane" id="profile">
    	<div class="row " style="margin: auto">
    		<h4 class="text-primary" style="margin-left: 93%;"><a class="text-muted" href="#">文章管理</a></h4>
    	</div>
<!--    	收藏内容-->
   		<div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">收藏内容</a><small style="margin-left: 80% ">2017-8-2</small><small style="margin-left:3%;cursor: pointer" class="glyphicon glyphicon-trash"></small></h4>
   		</div>
   		<div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">收藏内容</a><small style="margin-left: 80% ">2017-8-2</small><small style="margin-left:3%;cursor: pointer" class="glyphicon glyphicon-trash"></small></h4>
   		</div>
   		<div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">收藏内容</a><small style="margin-left: 80% ">2017-8-2</small><small style="margin-left:3%;cursor: pointer" class="glyphicon glyphicon-trash"></small></h4>
   		</div>
   		
   		
   		
    </div>
<!--    我的关注列表-->
    <div role="tabpanel" class="tab-pane" id="messages">
    	<div class="row" style="margin-top: 1%;margin-left: 1%;margin-right: 1%">
    		<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Friend Name</h4></div>
    		</div>
       		<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Friend Name</h4></div>
    		</div>
			<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Friend Name</h4></div>
    		</div>
			<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Friend Name</h4></div>
    		</div>
			
    		
    	</div>
    	
    	<div class="row" style="margin-top: 1%;margin-left: 1%;margin-right: 1%">
    		<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Friend Name</h4></div>
    		</div>
       		<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Friend Name</h4></div>
    		</div>
			<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Friend Name</h4></div>
    		</div>
			<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Friend Name</h4></div>
    		</div>
			
    		
    	</div>
    </div>
<!--    粉丝列表-->
    <div role="tabpanel" class="tab-pane" id="settings">
    	    	<div class="row" style="margin-top: 1%;margin-left: 1%;margin-right: 1%">
    		<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Fans Name</h4></div>
    		</div>
       		<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Fans Name</h4></div>
    		</div>
			<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Fans Name</h4></div>
    		</div>
			<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Fans Name</h4></div>
    		</div>
			
    		
    	</div>
    	
    	<div class="row" style="margin-top: 1%;margin-left: 1%;margin-right: 1%">
    		<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Fans Name</h4></div>
    		</div>
       		<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Fans Name</h4></div>
    		</div>
			<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Fans Name</h4></div>
    		</div>
			<div class="col-md-3 well">
    			<div class="col-md-4 "><img class="img-responsive img-rounded" src="img/adminIcon.jpg"></div>
    			<div class="col-md-8 "><h4>Fans Name</h4></div>
    		</div>
			
    		
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
</html>