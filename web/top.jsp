<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: wenbin
  Date: 2018/8/8
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7/dist/css/iconfont.css">
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7/dist/css/chat.css">
<%--<link href="../js/demo.css" rel="stylesheet" type="text/css" />
<link href="../js/searchMeme.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
<script src="../js/jquery.searchMeme.js" type="text/javascript"></script>--%>
<script type="text/javascript" src="js/quickQuery-packer.js"></script>
<link rel="stylesheet" type="text/css" href="css/quickQuery.css">
<script src="js/select2.js"></script>
<script src="js/pinyin.js"></script>
<script src="js/chinese2pinyin.js"></script>

<c:if test="${not empty sessionScope.loginresult}">
    <script>
        //当登录不为空时，用ajax请求后台该用户的好友列表
        $.post("/user/FindAllFriendsOfThisUser/${sessionScope.loginresult.uid}",function (data) {

        })
    </script>
<audio id="tishiyin" src="../caidan/media/8400.wav"></audio>
    <%--聊天窗口--%>
    <div class="chatContainer" style="z-index: 10;">
        <div class="chatBtn">
            <i class="iconfont icon-xiaoxi1"></i>
        </div>
        <div id="allNotReadNum" class="chat-message-num"></div>
        <div class="chatBox" ref="chatBox">
            <div class="chatBox-head">
                <div class="chatBox-head-one">
                    ${sessionScope.loginresult.nickname}的聊天窗口
                    <div class="chat-close" style="margin: 10px 10px 0 0;font-size: 14px">关闭</div>
                </div>
                <div class="chatBox-head-two">
                    <div class="chat-return">返回</div>
                    <div class="chat-people">
                        <div class="ChatInfoHead">
                            <img src="" alt="头像"/>
                        </div>
                        <div class="ChatInfoName">这是用户的名字，看看名字到底能有多长</div>
                    </div>
                    <div class="chat-close">关闭</div>
                </div>
            </div>
            <div class="chatBox-info">
                <div class="chatBox-list" ref="chatBoxlist">
                    <c:forEach items="${sessionScope.allFriendOfThisUser}" var="friend">
                        <%--单个好友--%>
                        <div id="${friend.uid}" class="chat-list-people">
                            <div><img src="${friend.picturepath}" alt="头像"/></div>
                            <div class="chat-name">
                                <p>${friend.nickname}</p>
                            </div>
                            <div id="messagenum${friend.uid}" class="message-num"></div>
                        </div>
                        <%--单个好友结束--%>
                    </c:forEach>

                    <c:forEach items="${sessionScope.notAttenedFans}" var="fans">
                        <%--单个粉丝--%>
                        <div id="${fans.uid}" class="chat-list-people">
                            <div><img src="${fans.picturepath}" alt="头像"/></div>
                            <div class="chat-name">
                                <p>${fans.nickname}(未关注)</p>
                            </div>
                            <div id="messagenum${fans.uid}" class="message-num"></div>
                        </div>
                        <%--单个粉丝结束--%>
                    </c:forEach>



                </div>


                    <%--与某人的聊天窗口--%>
                    <div class="chatBox-kuang" ref="chatBoxkuang">
                        <div id="content${friend.uid}"  class="chatBox-content">
                            <div class="chatBox-content-demo" id="chatBox-content-demo" >


                            </div>
                        </div>

                        <div class="chatBox-send" >
                            <div class="div-textarea" contenteditable="true"></div>
                            <div>
                                <button id="chat-biaoqing" class="btn-default-styles">
                                    <i class="iconfont icon-biaoqing"></i>
                                </button>
                                <label id="chat-tuxiang" title="发送图片" for="inputImage" class="btn-default-styles">
                                    <input type="file" onchange="selectImg(this)" accept="image/jpg,image/jpeg,image/png"
                                           name="file" id="inputImage" class="hidden">
                                    <i class="iconfont icon-tuxiang"></i>
                                </label>
                                <button id="chat-fasong"  class="btn-default-styles"><i class="iconfont icon-fasong"></i>
                                </button>
                            </div>
                            <div class="biaoqing-photo">
                                <ul>
                                    <li><span class="emoji-picker-image" style="background-position: -9px -18px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -40px -18px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -71px -18px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -102px -18px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -133px -18px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -164px -18px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -9px -52px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -40px -52px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -71px -52px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -102px -52px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -133px -52px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -164px -52px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -9px -86px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -40px -86px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -71px -86px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -102px -86px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -133px -86px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -164px -86px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -9px -120px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -40px -120px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -71px -120px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -102px -120px;"></span>
                                    </li>
                                    <li><span class="emoji-picker-image" style="background-position: -133px -120px;"></span>
                                    </li>
                                    <li><span class="emoji-picker-image" style="background-position: -164px -120px;"></span>
                                    </li>
                                    <li><span class="emoji-picker-image" style="background-position: -9px -154px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -40px -154px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -71px -154px;"></span></li>
                                    <li><span class="emoji-picker-image" style="background-position: -102px -154px;"></span>
                                    </li>
                                    <li><span class="emoji-picker-image" style="background-position: -133px -154px;"></span>
                                    </li>
                                    <li><span class="emoji-picker-image" style="background-position: -164px -154px;"></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%--与某人的聊天窗口结束--%>

            </div>

        </div>
    </div>

    <script>
        var toid;
        var webFromid;
        var webToid;
        var webContent;
        var webTime;
        var allNotReadNum=0;
        var oneNOtFriendNum=0;
        function p(s) {
            return s < 10 ? '0' + s: s;
        }
        var myDate = new Date();
        var year=myDate.getFullYear();
        var month=myDate.getMonth()+1;
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        var s=myDate.getSeconds();

        var now=year+'-'+p(month)+"-"+p(date)+" "+p(h)+':'+p(m)+":"+p(s);
        //当用户登录后，就开始创建Socket
        var websocket=null;
        //判断当前浏览器是否支持WebSocket
        if ('WebSocket' in window) {
            websocket = new WebSocket("ws://172.19.22.45:8080/websocket/${sessionScope.loginresult.uid}");
        }
        else {
            alert('当前浏览器 Not support websocket')
        }
        //连接发生错误的回调方法
        websocket.onerror = function () {
            //setMessageInnerHTML("WebSocket连接发生错误");
        };

        //连接成功建立的回调方法
        websocket.onopen = function () {
            // setMessageInnerHTML("WebSocket连接--成功");
        }

        //接收到消息的回调方法
        websocket.onmessage = function (event) {
            oneNOtFriendNum+=1;
            allNotReadNum+=oneNOtFriendNum;
            var str =$.parseJSON(event.data);
             webFromid=str.fromid;
             webToid=str.toid;
             webContent=str.content;
             webTime=str.time;
            $("#tishiyin").get(0).play();
            $("#allNotReadNum").html(allNotReadNum);
            $("#messagenum"+webFromid).html(oneNOtFriendNum);
            //接收到消息的回调方法
            $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                "<div class=\"author-name\"><small class=\"chat-date\">"+webTime+"</small> </div> " +
                "<div class=\"left\"><div class=\"chat-avatars\"><img src=\"${sessionScope.loginresult.picturepath}\" alt=\"头像\" /></div>  " +
                " <div class=\"chat-message\"> " + webContent + " </div></div> </div>");

        }

        //连接关闭的回调方法
        websocket.onclose = function () {
            // setMessageInnerHTML("WebSocket连接关闭");
        }

        //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        window.onbeforeunload = function () {
            websocket.close()
        }
        //关闭WebSocket连接
        function closeWebSocket() {
            websocket.close();
        }
        //发送消息
        function send() {
            var message=$(".div-textarea").html();
            websocket.send(JSON.stringify({'content':message,'toid':toid}));
        }
        function sendbiaoqing(bq){

            websocket.send(JSON.stringify({'content':bq,'toid':toid}))
        }



        //聊天窗口的js
        screenFuc();

        function screenFuc() {

            var topHeight = $(".chatBox-head").innerHeight();//聊天头部高度
            //屏幕小于768px时候,布局change
            var winWidth = $(window).innerWidth();
            if (winWidth <= 768) {
                var totalHeight = $(window).height(); //页面整体高度
                $(".chatBox-info").css("height", totalHeight - topHeight);
                var infoHeight = $(".chatBox-info").innerHeight();//聊天头部以下高度
                //中间内容高度
                $(".chatBox-content").css("height", infoHeight - 46);
                $(".chatBox-content-demo").css("height", infoHeight - 46);

                $(".chatBox-list").css("height", totalHeight - topHeight);
                $(".chatBox-kuang").css("height", totalHeight - topHeight);
                $(".div-textarea").css("width", winWidth - 106);
            } else {
                $(".chatBox-info").css("height", 495);
                $(".chatBox-content").css("height", 448);
                $(".chatBox-content-demo").css("height", 448);
                $(".chatBox-list").css("height", 495);
                $(".chatBox-kuang").css("height", 495);
                $(".div-textarea").css("width", 260);
            }
        }
        (window.onresize = function () {
            screenFuc();
        })();
        //未读信息数量为空时
        var totalNum = $(".chat-message-num").html();
        if (totalNum == "") {
            $(".chat-message-num").css("padding", 0);
        }
        $(".message-num").each(function () {
            var wdNum = $(this).html();
            if (wdNum == "") {
                $(this).css("padding", 0);
            }
        });


        //打开/关闭聊天框
        $(".chatBtn").click(function () {
            $(".chatBox").toggle(10);
        })
        $(".chat-close").click(function () {
            $(".chatBox").toggle(10);
        })
        //进聊天页面
        $(".chat-list-people").each(function () {
            $(this).click(function () {
                oneNOtFriendNum=0;
                toid=$(this).attr("id");
                var n = $(this).index();
                $(".chatBox-head-one").toggle();
                $(".chatBox-head-two").toggle();
                $(".chatBox-list").fadeToggle();
                $(".chatBox-kuang").fadeToggle();

                //传名字
                $(".ChatInfoName").text($(this).children(".chat-name").children("p").eq(0).html());

                //传头像
                $(".ChatInfoHead>img").attr("src", $(this).children().eq(0).children("img").attr("src"));

                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
            })
        });

        //返回列表
        $(".chat-return").click(function () {
            $(".chatBox-head-one").toggle(1);
            $(".chatBox-head-two").toggle(1);
            $(".chatBox-list").fadeToggle(1);
            $(".chatBox-kuang").fadeToggle(1);
            $(".chatBox-content-demo").text("");
        });


        //      发送信息
        $("#chat-fasong").click(function () {

            var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>')
            if (textContent != "") {
                send();
                $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                    "<div class=\"author-name\"><small class=\"chat-date\">"+now+"</small> </div> " +
                    "<div class=\"right\"> <div class=\"chat-message\"> " + textContent + " </div> " +
                    "<div class=\"chat-avatars\"><img src=\"${sessionScope.loginresult.picturepath}\" alt=\"头像\" /></div> </div> </div>");
                //发送后清空输入框
                $(".div-textarea").html("");
                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
            }
        });

        //      发送表情
        $("#chat-biaoqing").click(function () {

            $(".biaoqing-photo").toggle();
        });
        $(document).click(function () {
            $(".biaoqing-photo").css("display", "none");
        });
        $("#chat-biaoqing").click(function (event) {
            event.stopPropagation();//阻止事件
        });

        $(".emoji-picker-image").each(function () {
            $(this).click(function () {
                var bq = $(this).parent().html();
                sendbiaoqing(bq);
                console.log(bq)
                $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                    "<div class=\"author-name\"><small class=\"chat-date\">"+now+"</small> </div> " +
                    "<div class=\"right\"> <div class=\"chat-message\"> " + bq + " </div> " +
                    "<div class=\"chat-avatars\"><img src=\"${sessionScope.loginresult.picturepath}\" alt=\"头像\" /></div> </div> </div>");
                //发送后关闭表情框
                $(".biaoqing-photo").toggle();
                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
            })
        });

        //      发送图片
        function selectImg(pic) {
            if (!pic.files || !pic.files[0]) {
                return;
            }
            var reader = new FileReader();
            reader.onload = function (evt) {
                var images = evt.target.result;
                $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                    "<div class=\"author-name\"><small class=\"chat-date\">"+now+"</small> </div> " +
                    "<div class=\"right\"> <div class=\"chat-message\"><img src=" + images + "></div> " +
                    "<div class=\"chat-avatars\"><img src=\"${sessionScope.loginresult.picturepath}\" alt=\"头像\" /></div> </div> </div>");
                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
            };
            reader.readAsDataURL(pic.files[0]);

        }


    </script>
    <%--聊天窗口接结束--%>
</c:if>

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
            //启用弹出框并隐藏（当有未读信消息时弹出）
           // $(function () { $("[data-toggle='popover']").popover(); });
            $("[data-toggle='popover']").popover("hide")
            //当网页加载完毕后，用一个定时器10秒钟更新一次信息用来及时接收收到新的通知
            if(${not empty sessionScope.loginresult}){

                $.get("/user/timingReceivingNotice/${sessionScope.loginresult.uid}",function(data){
                    if(data>0){
                        $("[data-toggle='popover']").popover({
                            title:"提示",
                            html:true,//为true时可以解析html标签
                            content:"<a href='/user/receiveNotice/${sessionScope.loginresult.uid}/1'>有未读通知</a>"
                        });
                        $("[data-toggle='popover']").popover('show')
                    }
                });
                $.get("/user/timingReceivingMessage/${sessionScope.loginresult.uid}",function(data){
                    if(data>0){
                        $("[data-toggle='popover']").popover({
                            title:"提示",
                            html:true,//为true时可以解析html标签
                            content:"<a href='/user/receiveMessage/${sessionScope.loginresult.uid}'>有未读私信</a>"
                        });
                        $("[data-toggle='popover']").popover('show')
                    }
                });

                setInterval(function(){
                    var index0=0;
                    var index1=0;
                    $.get("/user/timingReceivingNotice/${sessionScope.loginresult.uid}",function(data){
                        index0=data;
                        if(data>0){
                            $("[data-toggle='popover']").popover({
                                title:"提示",
                                html:true,//为true时可以解析html标签
                                content:"<a href='/user/receiveNotice/${sessionScope.loginresult.uid}/1'>有未读通知</a>"
                            });
                            $("[data-toggle='popover']").popover('show')
                        }

                    });
                    $.get("/user/timingReceivingMessage/${sessionScope.loginresult.uid}",function(data){
                        index1=data;
                        if(data>0){
                            $("[data-toggle='popover']").popover({
                                title:"提示",
                                html:true,//为true时可以解析html标签
                                content:"<a href='/user/receiveMessage/${sessionScope.loginresult.uid}'>有未读私信</a>"
                            });
                            $("[data-toggle='popover']").popover('show')
                        }

                    });
                    //当私信和通知都已读时，就隐藏提示
                    if(index0*1+index1*1==0){
                        $("[data-toggle='popover']").popover('hide')
                    }
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
                    <li><a href="#">问答</a></li>
                    <li><a href="#">VIP</a></li>
                </ul>
                <form class="navbar-form navbar-left" method="post" action="/blog/blogSearch">
                    <div class="form-group">

                      <%--  <input id="q1" type="text" class="quickQuery$focus form-control" placeholder="Search" name="content"/>--%>
                       <%-- <input class="quickQuery$focus" id="" style="border: 3px solid #ccc;" />--%>
                       <%-- <input id="q1" type="text" &lt;%&ndash;class="quickQuery$focus"&ndash;%&gt; placeholder="Search" name="content"/>--%>
                        <input  id="q1" class="quickQuery$focus" style="border: 3px solid #ccc;" name="content"/>
                        <div class="quickQuery$focus"></div>
                    </div> <button id="bSearch" type="submit"  class="btn btn-default" >搜索</button>

                </form>
                <ul class="nav navbar-nav navbar-right">

                    <li name="tx"><a id="bk" class="glyphicon glyphicon-pencil" href="#"> 写博客</a></li>
                    <c:if test="${sessionScope.loginresult.isspeak==1}">
                        <script>
                            $("#bk").attr("href","javascript:void(0)");
                        </script>
                    </c:if>
                    <li name="tx"><a id="ca" class="glyphicon glyphicon-leaf" href="#">发Chat</a></li>
                    <li id="rw" name="tx">

                        <a id="me" class="glyphicon glyphicon-user" href="#" data-toggle="popover" data-container="body"  data-placement="top" data-delay="5000" >
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
           },3000);
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
        $.get("/blog/ajaxBlogSearch",function (data) {
            var json=eval(data);
            $.each(json,function (index,iteam) {
                keywordArray[10+index]= new Array("10"+index, json[index].word,chineseToPinYin(json[index].word) );
            });

        for(var i=0;i<=keywordArray.length;i++){
            alert(keywordArray);
        }

        })

       $quickQuery(keywordArray);
    }

</script>


