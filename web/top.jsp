<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wenbin
  Date: 2018/8/8
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<link href="../js/demo.css" rel="stylesheet" type="text/css" />
<link href="../js/searchMeme.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script src="../js/jquery.searchMeme.js" type="text/javascript"></script>--%>
    <script>
        //后期整理导航栏以及特效以该页面为准


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

            $("#topSearch").keyup(function(){
                if($(this).val()=="喷泉"){
//					$("#canvas").css("display","block");
                    $("#canvas").fadeIn(3000);
                    var audio = $("#penquan").get(0);
                    audio.play();
                    $("#canvas").fadeOut(8000);
                }
            });
            //启用弹出框
            $(function () { $("[data-toggle='popover']").popover(); });
            //当网页加载完毕后，用一个定时器10秒钟更新一次信息用来及时接收收到新的通知
            if(${not empty sessionScope.loginresult}){
                var nowNoticeNum=0;
                var previousNoticeNum=0;
                $.get("/user/timingReceivingNotice/${sessionScope.loginresult.uid}",function(data){
                    nowNoticeNum=data;
                });
                setInterval(function(){
                    $.get("/user/timingReceivingNotice/${sessionScope.loginresult.uid}",function(data){
                        previousNoticeNum=nowNoticeNum;
                        nowNoticeNum=data;
                        if(nowNoticeNum>previousNoticeNum){

                            $("[data-toggle='popover']").popover('show')
                        }

                    });
                },10000);
            }

        });

    </script>


<audio id="audio" src="caidan/media/5842.mp3"></audio>
<audio id="xuanzhuan" src="caidan/media/579888piCnbB.mp3"></audio>
<audio id="penquan" src="caidan/media/penquan.wav"></audio>
    <!-- Stack the columns on mobile by making one full-width and the other half-width -->
    <!--	特效-->
    <div id="canvas" style="position: fixed;z-index: 10; display: none;width:100%;height: 100%">
        <iframe src="caidan/html/penquan.html" style="width:100%;height: 100%"></iframe>
    </div>
    <div id="texiao" style="position: fixed;z-index: 10;width: 100%;height: 100%;margin: 0px; display: none">
        <iframe style="width: 100%;height: 100%" src="caidan/html/shandian.html"></iframe>
    </div>


<!--	导航栏-->
<div class="row">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand glyphicon glyphicon-italic" href="#">(Logo)</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="../index.jsp">首页 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">博客</a></li>
                    <li><a href="#">学院</a></li>
                    <li><a href="../xiazai.jsp">下载</a></li>
                    <li><a href="#">GitChat</a></li>
                    <li><a href="#">TinyMind</a></li>
                    <li><a href="#">论坛</a></li>
                    <li><a href="#">问答</a></li>
                    <li><a href="#">商城</a></li>
                    <li><a href="#">VIP</a></li>
                    <li><a data-toggle="popover" title="私信" data-container="body" data-placement="bottom" data-content="收到一条私信"></a></li>
                </ul>
                <form class="navbar-form navbar-left" method="post" action="/blog/blogSearch">
                    <div class="form-group">
                        <input id="topSearch" type="text" class="form-control" placeholder="Search" name="content">
                    </div>
                    <button id="bSearch" type="submit"  class="btn btn-default" >搜索</button>

                        <%--<div class="demo" style="height: 40px">
                            <input type="text" id="search-orange" />
                            <div class="clear">
                            </div>
                        </div>--%>

                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a class="glyphicon glyphicon-pencil" href="Writer.jsp"> 写博客</a></li>
                    <li><a class="glyphicon glyphicon-leaf" href="#">发Chat</a></li>
                    <li id="rw">
                        <c:choose>
                        <c:when test="${empty sessionScope.loginresult}">
                        <a class="glyphicon glyphicon-user"href="index.jsp">
                        </c:when>
                        <c:otherwise>
                        <a class="glyphicon glyphicon-user"href="jifenzhongxin.jsp">
                        </c:otherwise>
                        </c:choose>
                            <span class="caret"></span>
                        </a>
                        <div id="xl" style="position: absolute;top:100%;left:0%;z-index: 10;display:none">
                            <ul class="list-group" style="width:80px;cursor: pointer;font-size: 10px;color:#ebebeb">
                                <c:choose>
                                <c:when test="${sessionScope.loginresult==null}">
                                    <li class="list-group-item"><a href="writingCenter.jsp">我的博客</a></li>
                                    <li class="list-group-item"><a href="index.jsp">我的消息</a></li>
                                    <li class="list-group-item"><a>退出登录</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="list-group-item"><a href="writingCenter.jsp">我的博客</a></li>
                                    <li class="list-group-item"><a href="/user/listAllFriends/${sessionScope.loginresult.uid}/1">我的消息</a></li>
                                    <li class="list-group-item"><a>退出登录</a></li>

                                </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </li>

                </ul>

            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<script>
    $(document).ready(function () {
       $("#bSearch").click
    });
    $("#rw").mouseover(function(){
        $("#xl").css("display","block");
    });
    $("#rw").mouseout(function(){
        $("#xl").css("display","none");
    });
</script>
<!--	导航栏结束-->
<%--<script type="text/javascript">

    $(document).ready(function () {

        var searchOrange = $('#search-orange').searchMeme({ onSearch: function (searchText) {

                setTimeout(function () {

                    searchOrange.searchMeme({ searchComplete: true });

                }, 3000);

            }

            , buttonPlacement: 'left', button: 'orange'

        });
    });

</script>--%>

