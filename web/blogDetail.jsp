<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>博客详情</title>
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
	<script>
        function getFoor() {
            /*
                        var bokeid="2";
            */
            var ajaxUrl="/blog/getFloor?bid="+"${boke.bid}";
            $.ajax({
                type:"post",
                url:ajaxUrl,
                //data:bokeid,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    $("#floor").attr("value",data)
                },
                error: function(data) {
                    alert("error:");

                }
            });
            // alert("FFF+${requestScope.Foor}");
        }
        function huifu(bid,id,floor){
            $("#hfbid").attr("value",bid);
            $("#hfid").attr("value",id);
            $("#hffoor").attr("value",floor);
        }
	</script>
	<script type="text/javascript">
        $(document).ready(function(){
            var ajaxUrl="/blog/getComments?bid="+"${boke.bid}";
            $.ajax({
                type:"post",
                url:ajaxUrl,
                //data:bokeid,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    var blogComments="";
                    for(var i=0;i<data.length;i++){
                        blogComments+='';
                        blogComments+='<ul>';
                        blogComments+='<hr>';
                        blogComments+='<li id="getpl">';
                        blogComments+= '<div style="">';
                        blogComments+='<div style="margin-top: 5px">';
                        blogComments+='<a href="#">'+data[i].nickname+'</a>&nbsp;<a style="color: #CCCCCC" data-toggle="modal" onclick="huifu('+data[i].bid+','+data[i].id+','+data[i].floor+')" data-target="#myModa">点击回复</a>';
                        blogComments+='<h5 style="color:#928F8F;float: right">'+data[i].time +'</h5>&nbsp;&nbsp;&nbsp;';
                        if(data[i].commentid==0){
                            blogComments+='<h5 style="color:#928F8F;float: right">#'+data[i].floor +'楼&nbsp;&nbsp;&nbsp;</h5>';

                        }else{
                            blogComments+='<h5 style="color:#928F8F;float: right">@'+data[i].floor +'楼&nbsp;&nbsp;&nbsp;</h5>';

                        }
                        blogComments+='</div>';
                        blogComments+='</div>';
                        blogComments+='<h5 style="margin: 25px 10px 10px 0px">'+data[i].content+'</h5>';
                        blogComments+='</li>';
                        blogComments+='<hr>';
                        blogComments+='';
                        blogComments+='</ul>';
                    }
                    $('#getcommrnts').append(blogComments);
                },
                error: function(data) {
                    alert("error:");
                }
            });
        });
	</script>
	<style>
		.li-left{
			display:block;
			width:40px;
			height:40px;
			background-color:#FBFBFB;
			text-align: center;
			margin-top: 5px;
			border-radius: 5px
		}
		#div-left{
			position: fixed;top: 30%;left: 2%;
		}
		#toTop {display: none;text-decoration: none;position: fixed;bottom: 10px;right: 10px;overflow: hidden;width: 40px;height: 40px;border: none;text-indent: 100%; background-image: url(image/goTop.jpg);background-size: 100% 100%;text-align: center;}
		.icon-observer{
			display:block;width: 30px;height: 30px;border: none;background-size: 100% 100%;text-align: center;border-radius: 20px
		}
	</style>

</head>

<body>
<c:choose>
	<c:when test="${requestScope.listblog != null} ">
		<c:redirect url="blog/listBlogByBid/${listblog.bid}"></c:redirect>
	</c:when>
	<c:when test="${requestScope.yonghu eq null} ">
		<c:redirect url="blog/listBlogByBid/${listblog.bid}"></c:redirect>
	</c:when>
</c:choose>
<div id="fluid_Div" class="container-fluid" style="background-color:#574949">
	<!--	导航栏-->
	<%@ include file="top.jsp"%>
	<!--	导航栏结束-->

	<!--  用户名logo-->
	<div class="row">
		<div class="col-xs-12 col-md-8">
			<div>
				<h1 style="margin-left: 10%;color: azure">${listblog.title}</h1>
			</div>
		</div>

	</div>

	<div class="row" style="background-color:#EBEBEB">
		<!--	  左边图标栏-->
		<div class="col-xs-12 col-md-1">

			<div class="container-fluid">
				<!--		点赞、评论、分享 	已经调到最底部-->
			</div>
		</div>
		<!--	  左边栏结束-->


		<div class="col-xs-6 col-md-11">
			<!--	11  -->
			<div class="container-fluid">

				<!--	  下面一行分为831列-->
				<div class="row">
					<div class="col-xs-6 col-md-8" >
						<!--				推送正文-->
						<div class="span12" style="background-color:#FFFFFF;padding-left: 25px;padding-right: 25px">
							<p>&nbsp;</p>
							<!--文章标题-->
							<div>
								<h5 id="dzs" style="color:#928F8F;margin-left:  570px">点赞数：${boke.points}</h5>
								<a href="/blog/scanBlog/${listblog.bid}" style="float: right;margin-top: -28px">编辑</a>
							</div>

							<!--						简介结束-->
							<h2>
								正文
							</h2>
							${listblog.content}

						</div>

						<!--					评论开始-->
						<div class="span12" style="background-color:#A29E9E;padding: 25px">
							<!-- Button trigger modal -->
							有疑问？就说一说
							<c:if test="${sessionScope.loginresult eq null}">
								<button type="button" onclick="tishilogin()" class="btn btn-primary btn-lg" >
									我要评论
								</button>
							</c:if>
							<c:if test="${sessionScope.loginresult != null}">
								<button type="button" onmouseover="getFoor()" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
									我要评论
								</button>
							</c:if>


							<!-- Modal -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 20%">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">我的评论</h4>
										</div>
										<%--  该功能需要隐藏标签，以及传入登录用户信息--%>

										<form action="/blog/personaldiscuss/${boke.bid}" method="post">
											<input type="hidden" name="uid"value="${sessionScope.loginresult.uid}"><br>
											<input type="hidden" name="bid" value="${boke.bid}"><br>
											<div class="modal-body">
												<!--文本域-->
												<textarea class="form-control" rows="3" name="content"></textarea>
												<!---->
											</div>
											<div class="form-group" style="display: none">
												floor:<input type="text" id="floor" name="floor"><br>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
												<button type="submit" class="btn btn-primary"value="discuss">评论</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>

						<!--别人的品论-->
						<div class="span12" style="background-color:white;padding: 25px"align="right">

							<!-- Modal -->
							<div class="modal fade" id="myModa" tabindex="-1" role="dialog" aria-labelledby="myModalLabe" style="margin-top: 20%">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabe">我的回复</h4>
										</div>
										<%--  该功能需要隐藏标签，以及传入登录用户信息--%>

										<form action="/blog/answerPersonalComment/${boke.bid}" method="post">
											<div class="form-group" style="display: none">
												uid:<input id="" type="text" name="uid" value="${sessionScope.loginresult.uid}"><br>
											</div>
											<div class="form-group"style="display: none">
												bid:<input id="hfbid" type="text" name="bid"><br>
											</div>
											<div class="modal-body">
												<!--文本域-->
												<textarea class="form-control" rows="3" name="content"></textarea>
												<!---->
											</div>
											<div class="form-group"style="display: none">
												commentid:<input id="hfid" type="text" name="commentid"><br>
											</div>
											<div class="form-group"style="display: none">
												floor:<input id="hffoor" type="text" name="floor"><br>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
												<button type="submit" class="btn btn-primary"value="discuss">回复</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>

						<div class="span12" style="background-color:#FFFFFF;padding-left: 25px;padding-right: 25px" id="getcommrnts">
						</div>
						<!--					评论结束-->

					</div>

					<div class="col-xs-6 col-md-3">
						<!--			  	个人资料开始-->
						<div class="span12" style="margin-top: 10px; background-color:#FFFFFF">
							<div style="margin-top: 20px">
								<table class="table table-striped">
									<thead>
									<tr>
										<th colspan="4">|个人资料</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td colspan="3"><h3><a href="tarenzhongxin.jsp">${yonghu.nickname}</a><small></small></h3></td>

									</tr>
									<tr>
										<td>原创<p>${original}</p></td>
										<td>粉丝<p id="fa">${fans}</p></td>
										<td>喜欢<p>${attention}</p></td>
										<td>评论<p>123</p></td>
									</tr>
									<tr >
										<td colspan="2">等级:&nbsp;<span>${yonghu.grade}</span></td>
										<td colspan="2">访问:&nbsp;<span>0</span></td>
									</tr>
									<tr >
										<td colspan="2">积分:&nbsp;<span>${yonghu.score}</span></td>
										<td colspan="2">排名:&nbsp;<span>1W+</span></td>
									</tr>
									<tr >
										<td colspan="2">勋章:&nbsp;<span>0</span></td>
										<td colspan="2">&nbsp;<span></span></td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 个人资料结束-->



					</div><div class="col-xs-6 col-md-1" style="background-color:#F10609"></div>

					<!-- 831列结束-->
				</div>

			</div>
			<!--	10end	-->
		</div>
	</div>
</div>

<!--这是左边栏点赞、评论、分享。已脱离文档流-->
<div id="div-left" class="">
	<ul style="margin-top: 50px">
		<li class="li-left">
			<a id="zan" class="glyphicon glyphicon-thumbs-up" style="color: black;width: auto;height: auto;cursor: pointer"></a>
			<p id="sl" style="font-size: 2px">点赞</p>
		</li>
		<li  class="li-left">
			<a id="cang" class="glyphicon glyphicon-bookmark" style="cursor: pointer;color: black;width: 25px;height: 25px"></a>
			<p id="sc" style="font-size: 2px">收藏</p>
		</li>
		<div class="bdsharebuttonbox" data-tag="share_1">
			<li class="li-left">
				<a href="#" id="qqzone" style="margin-left:8px;width: 25px;height: 25px;background-image: url('img/qq.jpg')" data-cmd="qzone"  title="分享到QQ空间">

				</a>
				<%--<p style="font-size: 2px">QQ</p>--%>
			</li>
			<li class="li-left">
				<a href="#"  style="margin-left:8px;width: 25px;height: 25px;background-image: url('img/weixin.jpg')" data-cmd="weixin" title="分享到微信" >
					<%--<svg id="csdnc-wechat" viewBox="0 0 1228 1024" width="50%" height="50%"><path d="M873.608533 312.490667c-13.789867-1.8432-27.613867-2.4576-41.984-2.4576-206.404267 0-369.629867 157.764267-369.629866 351.778133 0 32.529067 4.8128 63.829333 13.824 93.2864a453.700267 453.700267 0 0 1-40.823467 1.8432c-54.5792 0-97.792-11.025067-152.3712-22.084267l-151.825067 77.960534 43.2128-133.8368C65.399467 601.053867 0 500.3264 0 378.1632 0 166.365867 195.618133 0 434.9952 0c213.6064 0 401.408 133.2224 438.613333 312.490667M1228.8 656.861867c0 100.078933-64.785067 189.098667-152.405333 256L1109.4016 1024l-119.3984-66.901333c-43.793067 11.025067-87.586133 22.698667-130.798933 22.698666-206.984533 0-369.595733-144.896-369.595734-322.935466 0-178.005333 162.6112-322.901333 369.595734-322.901334 195.618133 0 369.595733 144.896 369.595733 322.901334M348.023467 244.9408c0-33.757867-21.6064-55.842133-54.613334-55.842133-32.392533 0-65.399467 22.084267-65.399466 55.842133 0 33.1776 33.006933 55.261867 65.399466 55.261867 33.006933 0 54.613333-22.084267 54.613334-55.261867m445.781333 311.261867c0-22.084267-21.6064-44.202667-54.613333-44.202667-21.572267 0-43.178667 22.1184-43.178667 44.202667 0 22.698667 21.6064 44.8512 43.178667 44.8512 33.006933 0 54.613333-22.152533 54.613333-44.8512M652.219733 244.9408c0-33.757867-21.6064-55.842133-53.998933-55.842133-33.006933 0-65.399467 22.084267-65.399467 55.842133 0 33.1776 32.392533 55.261867 65.399467 55.261867 32.392533 0 53.998933-22.084267 53.998933-55.261867m380.996267 311.261867c0-22.084267-22.2208-44.202667-54.613333-44.202667-21.6064 0-43.178667 22.1184-43.178667 44.202667 0 22.698667 21.572267 44.8512 43.178667 44.8512 32.392533 0 54.613333-22.152533 54.613333-44.8512"></path></svg>--%>
				</a>

			</li>
			<li class="li-left">
				<a href="#" style="margin-left:8px;width: 25px;height: 25px;background-image: url('img/weibo.jpg')"  data-cmd="tsina" title="分享到新浪微博">
					<%--<svg id="csdnc-weibo" viewBox="0 0 1316 1024" width="50%" height="50%"><path d="M975.053988 498.494386c51.381763 9.947217 212.914325 82.795952 124.011075 266.892604-88.90325 183.804088-382.017011 273.255898-599.202789 256.652823-206.404749-15.798521-471.834528-82.532643-499.225945-325.661639 0 0-14.518548-110.187369 95.193403-252.666622 0 0 157.765785-214.494177 341.46016-275.676875 183.9138-60.926703 205.380771 42.16596 205.380771 103.056092-9.764364 51.710899-28.049689 82.064539 40.995699 61.255839 0 0 180.768724-81.625691 255.116855-9.252374 60.005123 58.47647 9.903332 138.866073 9.903332 138.866072s-24.831471 26.842857 26.367439 36.53408m-459.107942 455.012029c215.766836-9.58151 390.39169-141.016427 390.391691-281.082017 0-139.882737-174.61754-226.445466-390.384377-216.754244-215.583983 9.654652-389.879701 122.109401-389.879701 262.321274 0 140.06559 174.295719 245.315921 389.879701 235.514987m-43.007084-405.495369c217.156521-24.502336 255.95798 177.367653 189.874815 260.383029-66.010024 82.978805-196.640386 123.462515-323.503971 56.574796-60.378143-31.889607-58.183904-94.535131-58.183904-94.535131s-25.050895-197.700935 191.81306-222.422694m73.1413 171.516349c13.384858-10.276353 18.57789-28.232542 11.336902-40.154574-7.277559-11.739179-23.953776-15.030537-40.008292-3.437641-13.896847 9.874076-16.749358 28.561678-9.179233 40.227715 7.240989 11.958603 24.136629 13.348287 37.850623 3.3645m-127.850993 106.018315c40.337427-4.461619 73.1413-34.85183 73.141301-67.692273 0-32.950156-30.243928-59.025029-76.725224-54.709693-40.52028 4.095913-69.520806 38.508895-69.520806 71.276197 0 33.023297 32.657591 55.770241 73.104729 51.125769m662.396872-412.663216c-19.71158 0-35.766096-15.359673-35.766096-34.522694 0 0 35.107824-154.957159-124.047645-120.72703-19.67501 0-35.473531-15.505956-35.473531-34.522694 0-19.345874 15.798521-34.815259 35.473531-34.815259 0 0 221.61814-39.898579 195.140989 191.886201 0 1.353114-0.146283 2.450234-0.511989 3.657065-2.486804 16.420222-17.334488 29.037096-34.815259 29.037097m-25.818879-404.617673c137.103367 31.158194 325.222792 160.179448 240.634878 434.722632h-0.329136c-5.851304 39.203737-25.85545 42.421954-49.662943 42.421954-28.525107 0-51.528046-17.480771-51.528046-45.245208 0-24.063488 10.276353-48.492682 10.276353-48.492682 2.962223-10.13007 27.062281-73.031588-15.944804-167.127872-78.77318-128.8384-237.526373-130.703504-256.250545-123.352802-18.907026 7.204418-46.810432 10.861483-46.810432 10.861483-28.67139 0-51.710899-22.746944-51.7109-50.321215 0-23.222363 15.944803-42.787661 37.711655-48.821818 0 0 0.475418-0.767984 1.243402-0.914266 1.572538-0.292565 3.145076-1.865103 4.900467-2.011386 22.052102-4.095913 100.817968-19.163021 177.470051-1.71882"></path></svg>--%>
				</a>

			</li>
		</div>
	</ul>
</div>
<!--点赞结束-->
<script>
    $(document).ready(function () {
	var loguid="${sessionScope.loginresult.uid}";
    //点赞
    var count =1;
    $("#zan").click(function () {
        if(count==1){
            $.post("/blog/dianzan?bid=${boke.bid}")
            $("#zan").attr("class","glyphicon glyphicon-ok-circle");
            $("#sl").css("color","red");
            $("#sl").html("已赞");
            $("#dzs").html("点赞数：${boke.points+1}");
            count=count-1;
        }
    });
    //收藏
    $("#cang").click(function () {
        var loguid="${sessionScope.loginresult.uid}";
        var nn=Number(loguid);
        if(nn!=0){
            $.post("/blog/shoucang?uid=${sessionScope.loginresult.uid}&bid=${boke.bid}",function (msg) {
                if(msg=="success"){
                    $("#sc").css("color","red");
                    $("#sc").html("已收藏");
                }
                else {
                    alert("您已经收藏过此博客了！");
                }
            });
        }
	})
})
</script>
<!-- Modal -->
<div class="modal fade" id="modal-container-830220" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 20%">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">举报原因</h4>
			</div>
			<div class="modal-body">
				<!--								文本域-->
				<form >
					<input type="hidden" name="bid" type="text" value="${listblog.bid}" readonly="readonly"/>
					<input type="hidden" name="uid" type="text" value="${sessionScope.loginresult.uid}" readonly="readonly"/>
					<textarea id="reason" name="reason" class="form-control" rows="3"></textarea><br/>
					<input id="reportBlog" style="float: right;"  type="button" value="提交" />
				</form>
				<!--								-->
            </div>
            <div class="modal-footer">
                <!--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">提交</button>-->
            </div>
        </div>
    </div>
</div>
<!--end-->

<script>
    $("#qqzone").click(function () {
        window._bd_share_config.common.bdText="${boke.title}---IKSN";
        window._bd_share_config.common.bdUrl="localhost:8080/blog/getBlogAndUser?blogid=${boke.bid}";
        alert( window._bd_share_config.common.bdUrl);
    });
    window._bd_share_config = {
        common : {
            bdText : '${boke.title}'+'---IKSN',
            bdDesc : 'asd',
            bdUrl : 'http://localhost:8080/blog/getBlogAndUser?blogid=${boke.bid}',
            bdPic : ''
        },
        share : [{
            "bdSize" : 16
        }],
        image : [{
            viewType : 'list',
            viewPos : 'top',
            viewColor : 'black',
            viewSize : '16',
            viewList : ['qzone','tsina','weixin']
        }],
    }
    with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
</script>

<!--返回顶部按钮，向下翻150px显示-->
<a href="javascript:void(0)" id="toTop" style="border-radius: 20px"> </a>
</body>
<script>
    document.getElementById("time").value=new Date();
    $(document).ready(function () {
        $("#reportBlog").click(function () {
            $.get("/blog/reportBlog?bid=${listblog.bid}&uid=${sessionScope.loginresult.uid}&reason="+$('#reason').val(),function (data,status) {
                $("#modal-container-830220").modal('hide');
                alert("举报成功");
            })
        })
    })

</script>
</html>
