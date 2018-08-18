<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link type="text/css" href="/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="/bootstrap-3.3.7/dist/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="/bootstrap-3.3.7/dist/css/bootstrap-theme.min.css" crossorigin="anonymous">

	<script src="/js/jquery-3.3.1.js"></script>
	<script src="/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	<script src="/js/depend.js"></script>

	
<style>
	#toTop {display: none;text-decoration: none;position: fixed;bottom: 3%;right: 6%;overflow: hidden;width: 40px;height: 40px;border: none;text-indent: 100%; background-image: url(img/goTop.jpg);background-size: 100% 100%;text-align: center;}
	#contact-us{
		
	}
</style>
<script>
	$(document).ready(function(){
		$(document).scroll(function () {
		   // alert($('#leftDaohang').offset().top )
            if($(document).scrollTop()>=$("#leftDaohang").height()){

                $("#leftDaohang").css({
					"position":"fixed",
					"top":"0px",
					"left":"2%",
					"width":"14%"
				});

            }else{
                $("#leftDaohang").removeAttr("style");
			}

        })

	})
</script>

</head>

<body>

<C:if test="${requestScope.BlogsPush eq null}">
	<c:redirect url="/blog/blogPush"></c:redirect>
</C:if>

<div id="fluid_Div" class="container-fluid" style="background-color:#F4EEEE;">

  <!-- Stack the columns on mobile by making one full-width and the other half-width -->	
<!--  标题-->

<!--  导航-->
<%@include file="top.jsp"%>

</div>
		  <!--		  导航结束-->
  <div class="row" style="background-color:#EBEBEB;margin-right: 0px">
<!--	  左边导航栏-->
	  <div class="col-xs-12 col-md-2">
	  	
		<div class="container-fluid">
		  <div class="row">
			  <div class="col-md-1"></div>
			  <div id="leftDaohang" class="col-md-10">
			  	<ul class="nav nav-pills nav-stacked">
				  <li class="active"><a href="#">推荐</a></li>
				  <li><a href="#">最新文章</a></li>
				  <li><a href="#">关注</a></li>
				  <li><a href="#">咨询</a></li>
				  <li><a href="#">人工智能</a></li>
				  <li><a href="#">云计算</a></li>
				  <li><a href="#">区块链</a></li>
				  <li><a href="#">数据库</a></li>
				  <li><a href="#">程序人生</a></li>
				</ul>
			  </div>
			  <div class="col-md-1"></div>
		  </div>
		</div>
	  </div>
<!--	  左边栏结束-->
	  <div class="col-xs-6 col-md-10">
<!--	10  -->
	  	<div class="container-fluid">
	  
<!--	  下面一行分为714列-->
		  <div class="row">
				<div class="col-xs-6 col-md-8" >
<!--				推送正文-->
					
<!--					图片轮播-->
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						  <ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						  </ol>
						  
						<!-- Wrapper for slides -->
						  <div class="carousel-inner" role="listbox">
							<div class="item active">
							  <img src="img/1.jpg" alt="...">
							  <div class="carousel-caption">
									<h4>棒球</h4>
                        			<p>棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。</p>
							  </div>
							</div>
							<div class="item">
							  <img src="img/2.jpg" alt="...">
							  <div class="carousel-caption">
									<h4>棒球</h4>
                        			<p>棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。</p>
							  </div>
							</div>
							<div class="item">
							  <img src="img/3.jpg" alt="...">
							  <div class="carousel-caption">
									<h4>棒球</h4>
                        			<p>棒球运动是一种以棒打球为主要特点，集体性、对抗性很强的球类运动项目，在美国、日本尤为盛行。</p>
							  </div>
							</div>
						
						  </div>
						  
						  <!-- Controls -->
						  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						  </a>
						  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						  </a>
						  
						  
					</div>
<!--					轮播结束-->
<!--					博主发表的文章-->


					<c:forEach var="t" items="${BlogsPush}" >
						<div class="span12" style="border-radius: 10px;background-color:#FFFFFF;margin-top: 30px">
							<h2>
								<a href="/blog/getBlogAndUser?blogid=${t.bid}">${t.title}</a>
							</h2>
							<p>
								${fn:substring(t.content,0,150)}.........
							</p>
							<h5 style="color:#928F8F;float: right">阅读数：${t.points}</h5>
							<p>
								<a class="btn" href="userArticle.jsp">查看更多 »</a>
							</p>
						</div>
					</c:forEach>


					<%--<div class="span12" style="border-radius: 10px;background-color:#D2D4D5;margin-top: 10px">
						<h2>
							<a href="#">标题</a>
						</h2>
						<p>
							本可视化布局程序在HTML5浏览器上运行更加完美, 能实现自动本地化保存, 即使关闭了网页, 下一次打开仍然能恢复上一次的操作.
						</p>
						<h5 style="color:#928F8F;float: right">阅读数：3555</h5>
						<p>
							<a class="btn" href="#">查看更多 »</a>
						</p>
					</div>--%>

					
				</div>
<!--			  <div class="col-xs-6 col-md-1" style="background-color:#F10609"></div>-->
			  <div class="col-xs-6 col-md-3">
<!--			  	登陆开始-->
			  	<div id="dlks"  class="span12" style="margin-top: 10px; background-color:#FFFFFF">
			  	  <div id="dl" style="padding: 10px">
<!--					登陆表单-->
					<form action="/user/login" method="post">
					  <div class="form-group">
						<label for="exampleInputEmail1"></label>
						<input type="text" name="emailorphone" class="form-control" id="exampleInputEmail1"  placeholder="username" required>
					  </div>
					  <div class="form-group">
						<label for="exampleInputPassword1"></label>
						<input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
					  </div>
					  <div class="checkbox">
						<label>
						  <input type="checkbox"  name="iscollect" > 记住密码
						</label>
					  </div>

					  <button type="submit" class="btn btn-default" id="denglu">登陆</button>
					  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
						  注册
						</button>
					  <div style="float: right;margin-right: 10px"><a href="#" style="display: block;width: 35px;height: 35px">
					  		<svg id="csdnc-qq" viewBox="0 0 1024 1024" width="50%" height="50%"><path d="M995.225278 683.917766c-22.357318-124.75725-116.394589-206.44964-116.394589-206.44964 13.454213-113.237258-35.811532-133.347467-35.811532-133.347467C832.665386-6.257774 518.616173-0.142222 511.982933 0.028444 505.389516-0.142222 191.283414-6.257774 180.986532 344.120659c0 0-49.237301 20.110209-35.811532 133.347467 0 0-94.008826 81.69239-116.394589 206.44964 0 0-11.918214 210.750437 107.434595 25.804783 0 0 26.851538 70.257731 76.088838 133.347467 0 0-88.035497 28.700425-80.554613 103.253264 0 0-3.015109 83.086167 187.960764 77.397282 0 0 134.286133-10.012438 174.563439-64.511957H529.737944c40.305751 54.499519 174.563439 64.511957 174.563439 64.511957 190.918984 5.688885 187.983519-77.397282 187.983519-77.397282 7.423995-74.552839-80.554613-103.253264-80.554613-103.253264 49.208856-63.089736 76.060394-133.347467 76.060394-133.347467 119.324365 184.945654 107.434595-25.804783 107.434595-25.804783"></path></svg>
					  </a></div>
					  <div style="float: right;margin-right: 10px"><a href="#"  style="display: block;width: 35px;height: 35px">
					  		<svg id="csdnc-wechat" viewBox="0 0 1228 1024" width="50%" height="50%"><path d="M873.608533 312.490667c-13.789867-1.8432-27.613867-2.4576-41.984-2.4576-206.404267 0-369.629867 157.764267-369.629866 351.778133 0 32.529067 4.8128 63.829333 13.824 93.2864a453.700267 453.700267 0 0 1-40.823467 1.8432c-54.5792 0-97.792-11.025067-152.3712-22.084267l-151.825067 77.960534 43.2128-133.8368C65.399467 601.053867 0 500.3264 0 378.1632 0 166.365867 195.618133 0 434.9952 0c213.6064 0 401.408 133.2224 438.613333 312.490667M1228.8 656.861867c0 100.078933-64.785067 189.098667-152.405333 256L1109.4016 1024l-119.3984-66.901333c-43.793067 11.025067-87.586133 22.698667-130.798933 22.698666-206.984533 0-369.595733-144.896-369.595734-322.935466 0-178.005333 162.6112-322.901333 369.595734-322.901334 195.618133 0 369.595733 144.896 369.595733 322.901334M348.023467 244.9408c0-33.757867-21.6064-55.842133-54.613334-55.842133-32.392533 0-65.399467 22.084267-65.399466 55.842133 0 33.1776 33.006933 55.261867 65.399466 55.261867 33.006933 0 54.613333-22.084267 54.613334-55.261867m445.781333 311.261867c0-22.084267-21.6064-44.202667-54.613333-44.202667-21.572267 0-43.178667 22.1184-43.178667 44.202667 0 22.698667 21.6064 44.8512 43.178667 44.8512 33.006933 0 54.613333-22.152533 54.613333-44.8512M652.219733 244.9408c0-33.757867-21.6064-55.842133-53.998933-55.842133-33.006933 0-65.399467 22.084267-65.399467 55.842133 0 33.1776 32.392533 55.261867 65.399467 55.261867 32.392533 0 53.998933-22.084267 53.998933-55.261867m380.996267 311.261867c0-22.084267-22.2208-44.202667-54.613333-44.202667-21.6064 0-43.178667 22.1184-43.178667 44.202667 0 22.698667 21.572267 44.8512 43.178667 44.8512 32.392533 0 54.613333-22.152533 54.613333-44.8512"></path></svg>
					  </a></div>
					</form>
				</div>
			  	</div>
				  <!--提示-->

				  <c:if test="${logmes!=null}">
				<c:choose>
					<c:when test="${logmes==true}">
							<script>
								$("#dl").attr("disabled",true);
								$("#dlks").html("<img src='img/gg.jpg' width='280px' height='202px'/>")
                            </script>
					</c:when>
					<c:otherwise>
						<div class='alert alert-warning alert-dismissible' role='alert'>
							<button type='button' class='close' data-dismiss='alert' aria-label='Close'>
								<span aria-hidden='true'>&times;</span>
							</button>
							<strong>Warning!</strong> 用户名或密码错误！
						</div>
					</c:otherwise>
				</c:choose>
				  </c:if>
                  <!--使用cookie-->
                    <script>

                        $(document).ready(function () {
                                $("#exampleInputEmail1").val("${cookie.nameCookie.value}");
                                $("#exampleInputPassword1").val("${cookie.passwordCookie.value}");
                        })
                    </script>


			  	<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 10%">
						  <div class="modal-dialog" role="document">
							<div class="modal-content">
							  <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title" id="myModalLabel">快速注册</h4>
							  </div>
							  <div class="modal-body">
							<!--注册表单-->
						  		<form action="/user/register" method="post">
								  <div class="form-group">
									<label for="exampleInputEmail1">昵称</label>
									<input type="text" class="form-control" name="nickname" id="username" placeholder="NickName">
								  </div> 
								  <div class="form-group">
									<label for="exampleInputPassword1">密码</label>
									<input type="password" class="form-control" name="password" id="password0" placeholder="Password">
								  </div>
								  <div class="form-group">
									<label for="exampleInputPassword1">确认密码</label>
									<input type="password" class="form-control" id="password1" placeholder="Password" >
								  </div>
								  
								  <div class="form-group">
									<label class="radio-inline">
									  <input type="radio" name="sex" id="inlineRadio1" value="1"> 男
									</label>
									<label class="radio-inline">
									  <input type="radio" name="sex" id="inlineRadio2" value="2"> 女
								 	</label>	
								  </div>
								  
								  <div class="form-group">
									<label for="exampleInputEmail1">邮箱</label>
									<input type="email" name="email" class="form-control" id="mail" placeholder="Email">
								  </div>
								  <div class="form-group">
									<label for="exampleInputPassword1">手机号码</label>
									<input type="text" name="phone" class="form-control" id="phone" placeholder="phone">
								  </div>
									<div id="yzm" class="form-group" style="display: none">
										<label for="exampleInputPassword1"></label>
										<input style="width: 80%;float: left" type="text" class="form-control" id="captcha" placeholder="">
                                        <button style="width: 17%" id="yz" type="button" class="btn btn-primary">获取验证码</button>
									</div>
                                    <div class="modal-footer" >
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button id="zc" type="submit" class="btn btn-primary" disabled="true" >注册</button>
                                    </div>
								</form>
							  </div>

							</div>
						  </div>
						</div>
				  <!--提示是否注册成功-->
				  <c:if test="${result !=null}">
				  <c:choose>
					  <c:when test="${result}">
						  <script>
							  alert("注册成功，快去登录吧！");
						  </script>
					  </c:when>
					  <c:otherwise>
						  <script>
                              alert("注册失败，请检查后再次注册！");
						  </script>
					  </c:otherwise>
				  </c:choose>
				  </c:if>
                  <!--检查两次的密码是否一致-->
                  <script>

                          $("#password1").blur(function () {
                             // alert($("#password1").val());
                              if($("#password0").val()!=null&$("#password1").val()!=null){
                                  if($("#password0").val()!= $("#password1").val()){
                                      $("#password1").attr("type","text");
                                      $("#password1").val("两次密码不一致，请再次输入！");
                                      $("#password1").css("font-size","10px");
                                      $("#password1").css("color","red");
                                  }
                              }
                          });
                          $("#password1").focus(function () {
                              $("#password1").attr("type","password");
                              $("#password1").val("");
                              $("#password1").css("color","");
                          });
                  </script>
				  <!--检查邮箱格式及是否存在-->
				  <script>
                      $("#mail").blur(function () {
                          //验证是否为正确的邮箱
                          var myreg=  /^[-_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
                          var p=$("#mail").val();
                          //alert(myreg.test(p));
                          if (myreg.test(p)){
                              $.get("/user/checkemail?email="+$("#mail").val(),function (ms) {
                                  if(ms=="success"){
                                  }
                                  else {
                                      $("#mail").val("邮箱已经被注册！");
                                      $("#mail").css("font-size","10px");
                                      $("#mail").css("color","red");
                                  }
                              });
                          }
                          else {
                              $("#mail").val("请输入正确的邮箱！");
                              $("#mail").css("font-size","10px");
                              $("#mail").css("color","red");
                          }
                      });
                      $("#mail").focus(function(){
                          $("#mail").val("");
                          $("#mail").css("font-size","14px");
                          $("#mail").css("color","");
                      });
				   </script>
                  <!--显示验证码一栏-->
                  <script>

                      $("#phone").focus(function(){
                        $("#yzm").show();
                          $("#phone").val("");
                          $("#phone").css("font-size","14px");
                          $("#phone").css("color","");
                      });
                      $("#captcha").focus(function(){
							$("#captcha").val("");
                          $("#captcha").css("font-size","14px");
                          $("#captcha").css("color","");
                      });
                  </script>

                  <!--手机验证码处理及是否为11位手机号码-->
                  <script>
					  captcha="";
                      // $("#phone").blur(function () {
                      //
                      // });

                      //获取验证码
                      $("#yz").click(function () {
                          //验证是否为11位手机号
                          var myreg=/^[1][3,4,5,7,8,9][0-9]{9}$/;
                          var p=$("#phone").val();
                          if (myreg.test(p)){
                              $.get("/user/checkphone?phone="+$("#phone").val(),function (ms) {
                                  if(ms=="success"){
                                      // $("#yz").attr("disabled",false);
                                      //计时器
                                      t=60;
                                      $.get("/user/captcha?to="+$("#phone").val(),function (msg) {
                                          captcha=msg;
                                      });
                                       $("#yz").attr("disabled",true);
                                      //定时器
                                      timeraaa=setInterval(timecount,1000);
                                  }
                                  else {
                                      $("#phone").val("手机号已经被注册！");
                                      $("#phone").css("font-size","10px");
                                      $("#phone").css("color","red");
                                  }
                              });
                          }
                          else {
                              $("#phone").val("请输入正确的手机号！");
                              $("#phone").css("font-size","10px");
                              $("#phone").css("color","red");
                          }
                      });
                      function timecount() {

                          $("#yz").html(t);
                            t=t-1;
                          if(t==-1){
                              clearInterval(timeraaa);
                              $("#yz").html("再次发送");
                              $("#yz").attr("disabled",false);

                          }
                      }
                  </script>
				  <!--验证验证码是否正确-->
				  <script>
                      count=0;
                      $("#captcha").keyup(function () {
                          count=count+1;
                          if(count==6){
                              //alert(count);
                              count=0;
								msg=captcha;
							//	alert(msg);
                              if(msg==$("#captcha").val()){
                                  $("#zc").attr("disabled",false);
                              }
                              else {
                                  $("#captcha").val("验证码错误请重新输入！");
                                  $("#captcha").css("font-size","10px");
                                  $("#captcha").css("color","red");
                              }
                          }
                      });
				  </script>
			  	<!--			  登陆结束-->
<!--			  	今日推荐开始-->
				  <div id="jinrituijian" class="span12" style="margin-top: 30px; background-color:#FFFFFF">
				  	<span>今日推荐</span>
				  	
				  	<div class="thumbnail">
					  <div style="float: left;width: 60px;height: 80px"><img style="width: 60px;height: 80px" src="img/timg.jpg" alt="..." ></div>
					  <div style="background-color:#C2CBC8">
					  	<a href="#">
							<h3>Thumbnail label</h3>
							<p>...</p>
						</a>
					  </div>
					</div>
					
					<div class="thumbnail">
					  <div style="float: left;width: 60px;height: 80px"><img style="width: 60px;height: 80px" src="img/timg.jpg" alt="..." ></div>
					  <div style="background-color:#C2CBC8">
					  	<a href="#">
							<h3>Thumbnail label</h3>
							<p>...</p>
						</a>
					  </div>
					</div>
					<div class="thumbnail">
					  <div style="float: left;width: 60px;height: 80px"><img style="width: 60px;height: 80px" src="img/timg.jpg" alt="..." ></div>
					  <div style="background-color:#C2CBC8">
					  	<a href="#">
							<h3>Thumbnail label</h3>
							<p>...</p>
						</a>
					  </div>
					</div>
					<div class="thumbnail">
					  <div style="float: left;width: 60px;height: 80px"><img style="width: 60px;height: 80px" src="img/timg.jpg" alt="..." ></div>
					  <div style="background-color:#C2CBC8">
					  	<a href="#">
							<h3>Thumbnail label</h3>
							<p>...</p>
						</a>
					  </div>
					</div>
				  </div>
<!--			  推荐结束-->
		  
		  			<!--联系我们-->
					<div id="contact-us" class="span12" style="margin-top: 30px; background-color:#DDDDDD">
						<span>联系我们</span>
				   		<hr>
					   <div class="row">
							  <div class="col-xs-6 col-md-1" >
							  </div>
							  <div class="col-xs-6 col-md-7" style="height: 160px;background-size: 100%;background-image: url( img/3_weixin.jpg)">

							  </div>
							  <div class="col-xs-6 col-md-4"></div>
						</div>
					   <div class="row">
							  <div class="col-xs-6 col-md-1"></div>
							  <div class="col-xs-6 col-md-10">
									<h5>请联系客服</h5>
								<p>
									<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M2.167 2h11.666C14.478 2 15 2.576 15 3.286v9.428c0 .71-.522 1.286-1.167 1.286H2.167C1.522 14 1 13.424 1 12.714V3.286C1 2.576 1.522 2 2.167 2zm-.164 3v1L8 10l6-4V5L8 9 2.003 5z" fill="#B3B3B3" fill-rule="evenodd"></path></svg>
									<a href="http://www.baidu.com" target="_blank"><span class="txt">webmaster@iksn.net</span></a>
								</p>
								<p>
									<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M14.999 13.355a.603.603 0 0 1-.609.645H1.61a.603.603 0 0 1-.609-.645l.139-1.47c.021-.355.25-.845.51-1.088 0 0 3.107-2.827 3.343-2.909 0 0-.029-2.46 1.2-2.46h3.635c1.112 0 1.202 2.469 1.202 2.469l3.32 2.9c.26.243.489.733.51 1.088l.139 1.47zM7 10a1 1 0 0 0 0 2h2a1 1 0 0 0 0-2H7zm7.806-5.674c.105.135.191.384.19.554l-.003 2.811c0 .17-.133.26-.295.2l-2.462-.999a.478.478 0 0 1-.296-.416V5.445c0-2.07-7.878-2.225-7.878 0v1.21c0 .17-.135.352-.3.404L1.3 7.904c-.165.052-.3-.044-.3-.213V4.88c0-.17.086-.42.191-.554C1.191 4.326 2.131 2 8 2s6.807 2.326 6.807 2.326z" fill="#B3B3B3"></path></svg>
									<span class="txt"> 400-660-0108</span>
								</p>
								<p>
									<svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M14.496 10.35c-.301-1.705-1.565-2.822-1.565-2.822.18-1.548-.481-1.823-.481-1.823C12.31.915 8.089.998 8 1 7.91.998 3.689.915 3.55 5.705c0 0-.662.275-.481 1.823 0 0-1.264 1.117-1.565 2.822 0 0-.16 2.882 1.445.353 0 0 .36.96 1.022 1.823 0 0-1.183.392-1.083 1.412 0 0-.04 1.136 2.527 1.058 0 0 1.805-.137 2.347-.882h.476c.542.745 2.347.882 2.347.882 2.566.078 2.527-1.058 2.527-1.058.1-1.02-1.083-1.412-1.083-1.412a7.986 7.986 0 0 0 1.022-1.823c1.604 2.529 1.445-.353 1.445-.353z" fill="#B3B3B3" fill-rule="evenodd"></path></svg><a href="javascript:void(0);" class="qqcustomer_s" target="_blank"><span class="txt">QQ客服</span></a>        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M7.325 13.965a6.5 6.5 0 1 1 7.175-6.4C14.467 11.677 11.346 15 7.5 15c-.514 0-1.015-.06-1.498-.172.488-.178.922-.48 1.323-.863zM4 7.5a4 4 0 1 0 8 0 .5.5 0 1 0-1 0 3 3 0 1 1-6 0 .5.5 0 0 0-1 0z" fill="#B3B3B3" fill-rule="evenodd"></path></svg>
									<a href="http://www.baidu.com" target="_blank"><span class="txt">客服论坛</span></a>
								</p>
							  </div>
							  <div class="col-xs-6 col-md-1"></div>
					   </div>	


					<!--	-->

					</div>
					<!--联系结束-->
		  		 
			  </div>

			  <div class="col-xs-6 col-md-1" style="background-color:#F10609"></div>
		  </div>
		</div>
<!--	10end	-->
	  </div>
	</div>
</div>





<!--返回顶部按钮，向下翻150px显示-->
<a href="javascript:void(0)" id="toTop" style="border-radius: 20px"> </a>
</body>
</html>

