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
      <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7/dist/css/iconfont.css">
      <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7/dist/css/chat.css">
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
            //根据下面的hidden传入的value来提示用户发送成功还是失败
            if($("#sendResult").val()=="sendSuccess"){
                $("#sendSuccess").css("display","block");

            }else if($("#sendResult").val()=="sendError"){
                $("#sendError").css("display","block");
            }
			//所有li元素的点击事件
			$("li").click(function(){
				if($(this).click){
					$("li").removeClass("active");
					$(this).addClass("active");
					
				}
			});
			//全选(根据ID选中)
			$("#checkAll").click(function(){
				var c=$(this).prop("checked");
				if(c){
				$(".checkboxs").prop("checked",true);


				}else{
				$(".checkboxs").prop("checked",false);

				}
			});
			//写私信时提交不合法时弹出的警告,ajax发送私信
			$("#submitMessage").click(function(){
				if($("#exampleInputEmail2").val()==""){
					$("#alertDanger").css("display","block");
				}else if($("#exampleInputText1").val()==""){
                    $("#alertDanger").css("display","block");
				}else{
				    var toid=$("#exampleInputEmail2").val();
				    var content=$("#exampleInputText1").val();
				    $.post("/user/sendMessage/${sessionScope.loginresult.uid}?toid="+toid+"&content="+content,function (data) {
				        if(data=="success"){
                            $("#sendSuccess").css("display","block");
						}else if(data=="error"){
                            $("#sendError").css("display","block");
						}

                    })
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




			//点击checkbox，把发送的id传到表单
			$(".checkbox").click(function(){

                var friendId="";
                var friendName="";
			    $.each($("input:checkbox:checked"),function () {
			        if($(this).val()!="on"){
			            friendName+=$(this).attr("name")+" ";
                        friendId+=$(this).val()+",";
                        $("#exampleInputEmail1").val(friendName);
                        $("#exampleInputEmail2").val(friendId);

					}

                })
				var checkboxNum=0;
				$.each($("input:checkbox"),function () {
				    alert(checkboxNum)
					if($(".checkboxs").prop("checked")==false){
                        $("#exampleInputEmail1").val("");
					}
					checkboxNum++;
                })

                $("#exampleInputText1").focus();
			});
			//搜索好友
            $("#searchFriendIdButton").click(function(){
                var nickName=$("#friendId").val();

                $.ajax({
					url:"/user/searchFriend/${sessionScope.loginresult.uid}/"+nickName,
					type:"get",
					datatype:"json",
					success:function(data){
					    if(data!=null){


                            $(".friend").remove();
                            for (var i=0;i<data.length;i++){
                                $(".father").append("<div id='friend"+data[i].uid+"' class='row friend' style='margin: auto'><div class='col-md-1'><div class='checkbox' style='margin-top: 20px'><label><input id='check"+data[i].uid+"' value='"+data[i].uid+"' class='checkboxs' type='checkbox'></label></div></div><div class='col-md-4'><img src='"+data[i].picturepath+"' class='img-responsive img-thumbnail' alt='Img'></div><div class='col-md-6'><h4>"+data[i].nickname+"</h4><small>"+data[i].introduce+"</small></div></div>")
                            }
                        }
					},

				})





            });
            //这里是当用户从收到的消息点击过来的
            <c:if test="${ not empty param.sendback}">
				$("#exampleInputEmail1").val('${param.sendName}');
				$("#exampleInputEmail2").val(${param.sendback});
				$("#exampleInputText1").focus();
			</c:if>



		});


		//删除关注的好友
		function deleteFriend(){
            var friendId="";
            $.each($("input:checkbox:checked"),function () {
                if($(this).val()!="on"){
                    friendId+=$(this).val()+",";//拼接所有选中的好友的id
                }
            })
			$.get("/user/deleteFriend/${sessionScope.loginresult.uid}/"+friendId,function (data) {
			    if(data=="success"){
			        var everyWillDeleteFriend=new Array();
                    everyWillDeleteFriend=friendId.split(",");
                    for (var i=0;i<everyWillDeleteFriend.length;i++){
                        $("#friend"+everyWillDeleteFriend[i]).remove();
					}

				}
            })
		}
        //分页按钮点击事件
        function previousPage(nowPage){

            if(nowPage-1>0){

                window.location="/user/listAllFriends/${sessionScope.loginresult.uid}/"+(nowPage-1);
            }else{


            }
        }
        function nextPage(nowPage,friendNums) {
            var maxPage;
            friendNums%5==0?maxPage=(friendNums/5):maxPage=(friendNums/5+1);
            if((nowPage*1+1)<=maxPage){
                window.location="/user/listAllFriends/${sessionScope.loginresult.uid}/"+(nowPage*1+1);
            }else{

            }
        }

	</script>
    
	<div id="fluid_Div" class="container-fluid">
		<input id="sendResult" type="hidden" value="${sendResult}">
	
<!--	导航栏-->
        <%@ include file="top.jsp"%>
	<!--	导航栏结束-->
<div class="row" style="background-color:#E9E9E9;margin-left: 15%;margin-right: 15%">
	<table class="table well" style="margin: 0px">
	  <tr>
          <td style="cursor: pointer"><a href="gerenzhongxin.jsp"><h4>个人中心</h4></a></td>
          <td style="cursor: pointer"><a href="/user/listAllFriends/${sessionScope.loginresult.uid}/1"><h4>我的消息</h4></a></td>
          <td style="cursor: pointer"><a href="jifenzhongxin.jsp"><h4>积分</h4></a></td>
          <td style="cursor: pointer"><a href="/blog/listBlogByUid/${sessionScope.loginresult.uid}"><h4>我的博客</h4></a></td>
          <td style="cursor: pointer"><a href="#"><h4>我的下载</h4></a></td>
		  <c:if test="${sessionScope.loginresult.isadmin eq '1'}">
			  <td style="cursor: pointer"><a href="/blog/mGetAllReportBlog"><h4>举报管理</h4></a></td>
		  </c:if>
      </tr>
	</table>
	
</div>
<div class="row well" style="margin-top: 2%; margin-left: 15%;margin-right: 15%">
	<div class="row" style="margin-left: 0.5%;margin-top: -5px">
		<nav>
			<ul class="nav nav-tabs">
			  <li role="presentation"><a href="user/receiveNotice/${sessionScope.loginresult.uid}/1">通知</a></li>
			  <li role="presentation"><a href="/user/listAllFriends/${sessionScope.loginresult.uid}/1">私信</a></li>
			  <li role="presentation"><a href="/user/receiveMessage/${sessionScope.loginresult.uid}/1">@我</a></li>
			</ul>
		</nav>
	</div>
<!--	私信-->
	<div class="col-xs-6 col-md-4 well">
		<table class="table">
			<tr style="cursor: pointer">
				<td>已关注（未读0）</td>
				<td>未关注（未读0）</td>
				<td class="glyphicon glyphicon-asterisk"></td>
			</tr>
		</table>
		<div class="row">
  
		  <div class="col-lg-12">
			<div class="input-group">
			  <input type="text" id="friendId" name="friendId" class="form-control" placeholder="搜索联系人">
			  <span class="input-group-btn">
				<button id="searchFriendIdButton" class="btn btn-default" type="button">Go!</button>
			  </span>
			</div><!-- /input-group -->
		  </div><!-- /.col-lg-6 -->
		</div><!-- /.row -->
		<div class="row">
			
		<div class="col-xs-12 col-md-6 ">
			 <div class="checkbox">
				<label>
				  <input id="checkAll" type="checkbox">全选
				</label>
			  </div>
		</div>
		<div class="col-xs-12 col-md-6 ">
						<!-- Single button -->
			<div class="btn-group" style="margin-left: 60%;margin-top:2%">
			  <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				操作 <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu">
				<li><a href="javascript:deleteFriend()">删除</a></li>
				<li><a href="#">标记已读</a></li>
				
			  </ul>
			</div>
		</div>
	</div>
<!--好友列表-->
		<div class="row well" style="margin: 0%;height: 600px;">
		<div class="row father" style="height: 80%;">
            <c:forEach var="friend" items="${allFriends}">


            <!--		单个用户-->
		<div id="friend${friend.uid}" class="row friend" style="margin: auto">
		<div class="col-md-1">
			<div class="checkbox" style="margin-top: 20px">
				<label>
				  <input id="check${friend.uid}" name="${friend.nickname}" value="${friend.uid}" class="checkboxs" type="checkbox">
				</label>
			  </div>
		</div>
		<div class="col-md-4">
		
			<img id="img${friend.uid}" ondblclick="shuangji(${friend.uid})" src="${friend.picturepath}" class="img-responsive img-thumbnail" alt="Img">
		</div>
		<div class="col-md-6">
		<h4>${friend.nickname}</h4>
		<small>${friend.introduce}</small>
		</div>
			
		</div>
            <!--		单个用户结束-->
            </c:forEach>


		
		</div>

		
<!--			分页按钮-->
			<div class="row" style="margin-top: -20px;padding-left:40%">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
					<li>
					  <a id="previous" href="javascript:previousPage(${nowPage})" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					  </a>
					</li>

					<li>
					  <a id="next" href="javascript:nextPage('${nowPage}','${friendNums}')" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					  </a>
					</li>
				  </ul>
				</nav>
			</div>
			
			<div class="row" style="margin-left:33%">
				<!-- Contextual button for informational alert messages -->
		<button id="newMessage"  type="button" class="btn btn-info">+新建私信</button>
			</div>
			
			
		</div>
		
	</div>
<!--	新建私信模块-->
	<div class="col-xs-12 col-md-8 well" >
<!--	警告-->
		<div id="alertDanger" class="alert alert-danger alert-dismissible" role="alert" style="display: none">
		  <button type="button" class="close" onclick="$('#alertDanger').hide()" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		  <strong>!</strong> 输入不能为空.
		</div>
<!--	警告-->
		<div id="sendSuccess" class="alert alert-success alert-dismissible" role="alert" style="display: none">
		  <button type="button" class="close" onclick="$('#sendSuccess').hide()" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		  <strong>!</strong> 发送成功.
		</div>
<!--	警告-->
		<div id="sendError" class="alert alert-danger alert-dismissible" role="alert" style="display: none">
		  <button type="button" class="close" onclick="$('#sendError').hide()" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		  <strong>!</strong> 发送失败(收件人不是您的好友或者改收件人不存在).
		</div>

<!--		标题-->
		<div class="row well" style="background-color: #E9E9E9;margin:auto">
			<span class="glyphicon glyphicon-envelope"> 新私信</span>
			
		</div>
<!--		表单-->
	<div class="row well" style="margin: auto">
		<%--<form action="/user/sendMessage/${sessionScope.loginresult.uid}" method="post">--%>
		  <div class="form-group">
			<label for="exampleInputEmail1">发送给</label>
			  <%--显示用户的nickname--%>
			<input type="text" name="" class="form-control" id="exampleInputEmail1" placeholder="发送给有效的收件人" required readonly>
			<%--真实传过去的toid--%>
			  <input type="hidden" name="toid" class="form-control" id="exampleInputEmail2" placeholder="发送给有效的收件人" >

		  </div>
		  <div class="form-group">
			<label for="exampleInputText1">内容</label>
			<textarea name="content" class="form-control" id="exampleInputText1" rows="6" required maxlength="300"></textarea>
		  </div>
		  <button id="submitMessage" type="submit" class="btn btn-default">私信</button>
		<%--</form>--%>
	</div>
	
	
	</div>
  
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