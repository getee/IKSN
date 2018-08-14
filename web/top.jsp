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
<!--提示框-->
<div id="tishikuang" style="display:none;">
    <div class="alert alert-warning" role="alert" style="text-align: center">
        <strong>请登录后再进行此操作！</strong>
    </div>
</div>
    <div class="row" style="background-image: url(img/2de797545de56274f03a5920eb3a1.jpg);background-size:cover;background-repeat: no-repeat;">
        <div  >
            <h1 style="margin-left: 42%;font-size: 70px">I&nbsp;K&nbsp;S&nbsp;N</h1>
            <p>&nbsp;</p>
        </div>
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
                </ul>
                <form class="navbar-form navbar-left" method="post" action="/blog/blogSearch">
                    <div class="form-group">

                        <input id="q1" type="text" class="quickQuery$focus" placeholder="Fuck you" name="content"/>
                       <%-- <input class="quickQuery$focus" id="" style="border: 3px solid #ccc;" />--%>
                        <div class="quickQuery$focus"></div>
                    </div> <button id="bSearch" type="submit"  class="btn btn-default" >搜索</button>

                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li name="tx"><a id="bk" class="glyphicon glyphicon-pencil" href="#"> 写博客</a></li>
                    <li name="tx"><a id="ca" class="glyphicon glyphicon-leaf" href="#">发Chat</a></li>
                    <li id="rw" name="tx">

                        <a id="me" class="glyphicon glyphicon-user"href="#">
                            <span class="caret"></span>
                        </a>
                        <div id="xl" style="position: absolute;top:100%;left:0%;z-index: 10;display:none;">
                            <ul class="list-group" style="width:80px;cursor: pointer;font-size: 10px;color:#ebebeb">
                                <li class="list-group-item"><a href="/blog/listBlogByUid/${sessionScope.loginresult.uid}">我的博客</a></li>
                                <li class="list-group-item"><a href="/user/listAllFriends/${sessionScope.loginresult.uid}/1">我的消息</a></li>
                                <li  class="list-group-item"><a id="tc">退出登录</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<script>
    $("li[name='tx']").click(function () {
       var u="${sessionScope.loginresult}";

        if(u==''){
            $("#tishikuang").css("display","block");
            $("#xl").css("display","none");
            $("#tishikuang").slideDown("slow");
           setInterval(function () {
               $("#tishikuang").slideUp("slow");
           },5000);
        }
        else {
            $("#bk").attr("href","Writer.jsp");
            $("#me").attr("href","jifenzhongxin.jsp");

        }
    });
    //退出登录
    $("#tc").click(function () {
            $.post("/user/exit");
            location.href="index.jsp";
    });

    $(document).ready(function () {
        var u="${sessionScope.loginresult}";

        if(u==''){
        }
        else {
            $("#dlks").html("<img src='img/gg.jpg' width='280px' height='202px'/>");
            $("#me").attr("class","");
            $("#me").html(" <img src='${sessionScope.loginresult.picturepath}' width='25px' height='25px' style='border-radius: 50%;'/><span class='caret'></span>");
            $("#rw").mouseover(function(){
                $("#xl").css("display","block");
            });
            $("#rw").mouseout(function(){
                $("#xl").css("display","none");
            });
        }
    });
</script>
<script>
    $(document).ready(function () {
       $("#bSearch").click
    });

</script>
<!--	导航栏结束-->

<script>

    var keywordArray = new Array("","","")
    keywordArray[0] = new Array("0", "移动开发", "YIDONGKAIFA");
    keywordArray[1] = new Array("1", "开发技术", "KAIFAJISHU");
    keywordArray[2] = new Array("2", "课程资源", "KECHENGZIYUAN");
    keywordArray[3] = new Array("3", "网络技术", "WANGLUOJISHU");
    keywordArray[4] = new Array("4", "操作系统", "CAOZUOXOTONG");
    keywordArray[5] = new Array("5", "安全技术", "ANQUANJISHU");
    keywordArray[6] = new Array("6", "数据库", "SHUJUKU");
    keywordArray[7] = new Array("7", "服务器应用", "FUWUQIYINGYONG");
    keywordArray[8] = new Array("8", "存储", "CUNCHU");
    keywordArray[9] = new Array("9", "信息化", "XINXIHUA");

    window.onload = function(){
       // $quickQuery(keywordArray);
    }
</script>


