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
            $('#myTabs3 a').click(function (e) {
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
          <td style="cursor: pointer"><a href="gerenzhongxin.jsp"><h4>个人中心</h4></a></td>
          <td style="cursor: pointer"><a href="/user/listAllFriends/${sessionScope.loginresult.uid}/1"><h4>我的消息</h4></a></td>
          <td style="cursor: pointer"><a href="jifenzhongxin.jsp"><h4>积分</h4></a></td>
          <td style="cursor: pointer"><a href="writingCenter.jsp"><h4>我的博客</h4></a></td>
          <td style="cursor: pointer"><a href="#"><h4>我的下载</h4></a></td>
          <c:if test="${sessionScope.loginresult.isadmin eq '1'}">
              <td style="cursor: pointer;background-color: #8c8c8c"><a href="/blog/mGetAllReportBlog"><h4>举报管理</h4></a></td>
          </c:if>
	  </tr>
	</table>
	
</div>

<!--面板-->
<div class="row well" style="margin-left: 15%;margin-right: 15%">
	<div style="margin-top: -1%">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li id="myTabs1" role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">举报博客</a></li>
    <li id="myTabs2" role="presentation" ><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" onclick="firstPages()">举报资源</a></li>
    <li id="myTabs3" role="presentation" ><a href="#jinyan" aria-controls="jinyan" role="tab" data-toggle="tab" onclick="userFirstPages()">禁言用户</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content" style="">
    <div role="tabpanel" class="tab-pane active" id="home">
        <div class="row " id="test" style="margin: auto">
        </div>
        <!--    	博客举报面版-->
        <div id="bloadGif"  style="display: none;margin: auto;width: 5%;height: auto">
            <img alt="加载。。。" src="img/load.gif" style="width: 100%;height: auto">
        </div>
        <div id="blog">
        <c:forEach var="item" items="${ReportBlogList}">
            <div id="1${item.id}" class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:5px;border-bottom-color:#E9E9E9">
                <div class="col-xs-12 col-md-8"><h4><a class="text-muted" target="_blank" href="javascript:clickTitle('${item.id}')">${item.blog.title}</a></h4><small style="margin-left: 2% ">举报原因：${item.reason}</small></div>
                <div class="col-xs-6 col-md-4"><small style="margin-right: 20% ">${item.blog.time}</small>
                    <a href="javascript:delete_oneReportBlog(${item.id})">
                        <small id="del_oneReportBlog" data-toggle="modal" style="margin-right:3%;cursor: pointer" class="glyphicon glyphicon-trash"></small>
                    </a>
                </div>
            </div>
        </c:forEach>
        </div>
        <%--分页按钮--%>
        <div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="javascript:blogPreviousPages()" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:blogNextPages()" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">待处理</a><small style="margin-left: 80% "><span id="viewBlogNum" class="badge" style="background-color: red">${rBlNum}</span></small></h4>
        </div>
    </div>
    <%--资源--%>
    <div role="tabpanel" class="tab-pane" id="profile">
        <div class="row " id="test" style="margin: auto">
        </div>
        <!--    	资源举报面版-->
        <div id="loadGif"  style="display: none;margin: auto;width: 5%;height: auto">
            <img alt="加载。。。" src="img/load.gif" style="width: 100%;height: auto">
        </div>
        <div id="resouece">

        </div>
        <%--分页按钮--%>
        <div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="javascript:previousPages()" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:nextPages()" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">待处理</a><small style="margin-left: 80% "><span id="viewResourceNum" class="badge" style="background-color: red">0</span></small></h4>
        </div>
    </div>
        <%--禁言--%>
      <div role="tabpanel" class="tab-pane" id="jinyan">
          <div class="row " id="test" style="margin: auto">
          </div>
          <!--    	禁言面版-->
          <div id="JloadGif"  style="display: none;margin: auto;width: 5%;height: auto">
              <img alt="加载。。。" src="img/load.gif" style="width: 100%;height: auto">
          </div>
          <div id="jinyanUser">
              <div id="3${item.id}" class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:5px;border-bottom-color:#E9E9E9">
                  <div class="col-xs-12 col-md-8"><h4><a class="text-muted" target="_blank" href="javascript:clickTitle('${item.id}')">实打实打算</a></h4><small style="margin-left: 2% ">EMAL</small></div>
                  <div class="col-xs-6 col-md-4"><small style="margin-right: 20% ">截禁时间：2017-8-2</small>
                      <h4><a href="javascript:delete_oneReportBlog(${item.id})">
                          解除禁言
                      </a></h4>
                  </div>
              </div>
          </div>
          <%--分页按钮--%>
          <div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9">
              <nav aria-label="Page navigation">
                  <ul class="pagination">
                      <li>
                          <a href="javascript:userPreviousPages()" aria-label="Previous">
                              <span aria-hidden="true">&laquo;</span>
                          </a>
                      </li>
                      <li>
                          <a href="javascript:userNextPages()" aria-label="Next">
                              <span aria-hidden="true">&raquo;</span>
                          </a>
                      </li>
                  </ul>
              </nav>
          </div>
          <div class="row" style="margin:auto;border-bottom-style:solid;border-bottom-width:2px;border-bottom-color:#E9E9E9"><h4><a class="text-muted" href="#">待处理</a><small style="margin-left: 80% "><span id="viewUserNum" class="badge" style="background-color: red">0</span></small></h4>
          </div>
      </div>


  </div>

</div>
</div>

<!--管理员权限-->
<script>
    var bpage=1;
    var bNum=${rBlNum};

    function blogPreviousPages(){
        if(bpage==1){
            alert("没有上一页了哦！！！")
        }
        if(bpage>=2){
            bpage=bpage-1;
            blogLoadPages(bpage);
        }

    }

    function blogNextPages(){
        bpage=bpage+1;
        var maxPage;
        bNum%5==0?maxPage=(bNum/5):maxPage=(bNum/5+1);
        //alert(bpage+"--"+bNum);
        if(bpage>maxPage){
            alert("没有下一页了哦！！！")
        }
        if(bpage<=maxPage){
            blogLoadPages(bpage);
        }
    }
    function blogLoadPages(page){
        $("#bloadGif").show();
        var a="/blog/mGetReportBlog/"+page;
        $.get(a,function(data,status){
            $("#bloadGif").hide();
            var htm="";
            bNum=data[data.length-1].reportBlNum;
            for(var i=0;i<data.length-1;i++){
                htm+="<div id=\"1"+data[i].id+"\" class=\"row\" style=\"margin:auto;border-bottom-style:solid;border-bottom-width:5px;border-bottom-color:#E9E9E9\">\n" +
                    "                <div class=\"col-xs-12 col-md-8\"><h4><a class=\"text-muted\" target=\"_blank\" href=\"javascript:clickName('"+data[i].bid+"')\">"+data[i].title+"</a></h4><small style=\"margin-left: 2% \">举报原因："+data[i].reason+"</small></div>\n" +
                    "                <div class=\"col-xs-6 col-md-4\"><small style=\"margin-right: 20% \">"+data[i].time+"</small>\n" +
                    "                    <a href=\"javascript:delete_oneReportBlog("+data[i].id+")\">\n" +
                    "                        <small id=\"del_oneReportResource\" data-toggle=\"modal\" style=\"margin-right:3%;cursor: pointer\" class=\"glyphicon glyphicon-trash\"></small>\n" +
                    "                    </a>\n" +
                    "                </div>\n" +
                    "            </div>";
                $("#blog").html(htm);
            }
            $("#viewBlogNum").text(bNum);
        });
        //location.href="blog/mReject_oneReportblog/"+url;

    }

</script>
<script>
    var page=1;
    var num=0;


    function firstPages() {
        loadPages(1);
    }


    function previousPages(){
        if(page==1){
            alert("没有上一页了哦！！！")
        }
        if(page>=2){
            page=page-1;
            loadPages(page);
        }

    }
    function nextPages(){
        page=page+1;
        var maxPage;
        num%5==0?maxPage=(num/5):maxPage=(num/5+1);
        if(page>(maxPage)){
            alert("没有下一页了哦！！！")
        }
        if(page<=maxPage){
            loadPages(page);
        }
    }

    function loadPages(page){
        $("#loadGif").show();
        var a="/resource/mGetReportResource/"+page;
        $.get(a,function(data,status){
            $("#loadGif").hide();
            var htm="";
            num=data[data.length-1].reportReNum;
            for(var i=0;i<data.length-1;i++){
                htm+="<div id=\"2"+data[i].id+"\" class=\"row\" style=\"margin:auto;border-bottom-style:solid;border-bottom-width:5px;border-bottom-color:#E9E9E9\">\n" +
                    "                <div class=\"col-xs-6 col-md-1\">\n" +
                    "                    <div><a href=\"xq.jsp\"><img src=\"img/2.svg\"></a></div>\n" +
                    "                </div>\n" +
                    "                <div class=\"col-xs-12 col-md-8\"><h4><a class=\"text-muted\" target=\"_blank\" href=\"javascript:clickName('"+data[i].rid+"','"+data[i].id+"','"+data[i].reason+"')\">"+data[i].name+"</a></h4><small style=\"margin-left: 2% \">举报原因："+data[i].reason+"</small></div>\n" +
                    "                <div class=\"col-xs-6 col-md-3\"><small style=\"margin-right: 20% \">"+data[i].time+"</small>\n" +
                    "                    <a href=\"javascript:delete_oneReportResource("+data[i].id+")\">\n" +
                    "                        <small id=\"del_oneReportResource\" data-toggle=\"modal\" style=\"margin-right:3%;cursor: pointer\" class=\"glyphicon glyphicon-trash\"></small>\n" +
                    "                    </a>\n" +
                    "                </div>\n" +
                    "            </div>";
                // $("#profile").append(htm);
                $("#resouece").html(htm);
            }
            $("#viewResourceNum").text(num);

        });
            //location.href="blog/mReject_oneReportblog/"+url;

    }

    function clickTitle(reportid) {
        var a="/blog/mCheckReportblog/"+reportid;
        //location.href=a;
        window.open(a);
    }
    function clickName(resourceid,reportid,reason) {
        //alert(resourceid+reason+reportid)
        var a="/resource/mCheckReportResource/"+resourceid+"/"+reportid+"?reason="+reason;
        //location.href=a;
        window.open(a);
    }
    function delete_oneReportBlog(url){
        var  userChoice=window.confirm("您确认要去除这个博客吗?");
        var a="blog/mReject_oneReportblog/"+url;
        if(userChoice)
        {
            $.get(a,function(data,status){
                $("#1"+url).hide();

            });
            //location.href="blog/mReject_oneReportblog/"+url;
        }
    }
    function delete_oneReportResource(url) {
        var userChoice=window.confirm("您确认要去除这个资源吗？");
        var a="/resource/mReject_oneReportResource/"+url;
        if(userChoice){
            $.get(a,function (data) {
                //alert(data)
                $("#2"+url).hide();
            })
        }
    }
</script>
<script>
    var upage=1;
    var unum=0;
    function userFirstPages() {
        userloadPages(1)
    }
    function userPreviousPages(){
        if(upage==1){
            alert("没有上一页了哦！！！")
        }
        if(upage>=2){
            upage=upage-1;
            userloadPages(upage);
        }

    }
    function userNextPages(){
        upage=upage+1;
        var maxPage;
        unum%5==0?maxPage=(unum/5):maxPage=(unum/5+1);
        if(upage>(maxPage)){
            alert("没有下一页了哦！！！")
        }
        if(upage<=maxPage){
            userloadPages(upage);
        }
    }

    function userloadPages(page) {
        $("#JloadGif").show();
        var a = "/user/UserByIsSpeak/"+page;
        $.get(a, function (data, status) {
            $("#JloadGif").hide();
            unum=data[data.length-1].num;
            var htm = "";
            for (var i = 0; i < data.length-1; i++) {
                var sex=data[i].sex;
                if(sex==0){sex="男";}else {sex="女";}

                htm+="<div id=\"3"+data[i].uid+"\" class=\"row\" style=\"margin:auto;border-bottom-style:solid;border-bottom-width:5px;border-bottom-color:#E9E9E9\">\n" +
                    "                  <div class=\"col-xs-12 col-md-8\"><h4><a class=\"text-muted\" style=\" \" target=\"_blank\" href=\"gerenzhongxin.jsp\">"+data[i].nickName+"</a></h4><small style=\"margin-left: 2% \">sex:"+sex+"</small><small style=\"margin-left: 2% \">EMAIL:"+data[i].email+"</small></div>\n" +
                    "                  <div class=\"col-xs-6 col-md-4\"><small style=\"margin-right: 20% \">截禁时间："+data[i].time+"</small>\n" +
                    "                      <h4><a href=\"javascript:update_isspeakUser("+data[i].uid+")\">\n" +
                    "                          解除禁言\n" +
                    "                      </a></h4>\n" +
                    "                  </div>\n" +
                    "              </div>";

                $("#jinyanUser").html(htm);
            }
            $("#viewUserNum").text(unum);

        });
    }

    function update_isspeakUser(uid) {
        var  userChoice=window.confirm("您确认要解除禁言吗?");
        var a="user/isSpeaktoTrue/"+uid;
        if(userChoice){
            $.get(a,function (data, status) {
                $("#3"+uid).hide();
            });
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