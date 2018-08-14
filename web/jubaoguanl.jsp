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
			//标签页选项卡
			$('#myTabs1 a').click(function (e) {
					  e.preventDefault()
					  $(this).tab('show')
					});
			$('#myTabs2 a').click(function (e) {
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
          <td style="cursor: pointer"><a href="/blog/mGetAllReportBlog"><h4>个人中心</h4></a></td>
          <td style="cursor: pointer"><a href="/user/listAllFriends/1/1"><h4>我的消息</h4></a></td>
          <td style="cursor: pointer"><a href="jifenzhongxin.jsp"><h4>积分</h4></a></td>
          <td style="cursor: pointer"><a href="writingCenter.jsp"><h4>我的博客</h4></a></td>
          <td style="cursor: pointer"><a href="#"><h4>我的下载</h4></a></td>
	  </tr>
	</table>
	
</div>

<!--面板-->
<div class="row well" style="margin-left: 15%;margin-right: 15%">
	<div style="margin-top: -1%">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li id="myTabs1" role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">举报博客</a></li>
    <li id="myTabs2" role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">举报资源</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content" style="">
    <div role="tabpanel" class="tab-pane active" id="home">
        <div class="row " id="test" style="margin: auto">
        </div>
        <!--    	博客举报面版-->

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
        <div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">待处理</a><small style="margin-left: 80% "><span class="badge" style="background-color: red">42</span></small></h4>
        </div>
    </div>
    
    <div role="tabpanel" class="tab-pane" id="profile">
        <div class="row " id="test" style="margin: auto">
        </div>
        <!--    	资源举报面版-->

        <c:forEach var="item" items="${ReportResourceList}">
            <div id="${item.id}" class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9">
                <div class="col-xs-6 col-md-1">
                    <div><a href="xq.jsp"><img src="img/2.svg"></a></div>
                </div>
                <div class="col-xs-12 col-md-8"><h4><a class="text-muted" href="#">${item.resource.name}</a></h4><small style="margin-left: 2% ">举报原因：${item.reason}</small></div>
                <div class="col-xs-6 col-md-3"><small style="margin-right: 20% ">2017-8-2</small>
                    <a href="javascript:delete_oneReportResource(${item.id})">
                        <small id="del_oneReportResource" data-toggle="modal" style="margin-right:3%;cursor: pointer" class="glyphicon glyphicon-trash"></small>
                    </a>
                </div>
            </div>
        </c:forEach>
        <div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">待处理</a><small style="margin-left: 80% "><span class="badge" style="background-color: red">42</span></small></h4>
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
    function delete_oneReportResource(url) {
        var userChoice=window.confirm("您确认要去除这个资源吗？");
        // if(userChoice){
        //     $.get(a,function (data) {
        //         $("#"+url).hide;
        //     })
        // }
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