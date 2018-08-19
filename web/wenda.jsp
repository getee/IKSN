<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>IKSN在线聊天顾问</title>
   <%-- <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <base href="<%=basePath%>">--%>
    <link rel="stylesheet" href="css/wenda.css">
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/wenda.js"></script>
<script>
    $(document).ready(function () {
        $(".active").removeClass("active");
        $("#li-4").addClass("active");
    });
</script>
</head>
<body style="overflow: hidden" onkeydown="onKeyDown(document.getElementById('search').value)"  >
    <div id="container">
        <div class="header">
            <div class="logo logo-text">IKSN在线聊天顾问</div>
            <div id="contact-btn" class="func-btn" style="display: block">
            <span><a href="index.jsp" style="color:#FFFFFF">返&nbsp;回</a></span>
            </div>
        </div>
        <div class="main">
            <div class="lside">
                <div class="chat-box" >
                    <div class="jspScrollable"   style="overflow: auto" tabindex="0">
                        <div class="jspContainer">
                            <div class="jspPane" id="jspPane" style="width: 100%;">
                                <div class="rctCtn chtCtn lft" >
                                    <div class="chtMsg chtMsg-greeting">
                                        <div id="talk">
                                            <div class="robot" style="margin-top: 20px;">
                                                <div class="chat">
                                                    <div class="robot-icon" style="width:46px;height: 46px;"></div>
                                                    <div class="robot-response">
                                                        <div class="robot-chat">
                                                            你好，有什么需要吗？
                                                        </div>
                                                    </div>
                                                    <span class="robot-talk-cor"></span>
                                                </div>
                                            </div>

                                            <!--<div class="me">-->
                                                <!--<div class="i-talk">-->
                                                    <!--<div class="me-chat">我</div>-->
                                                    <!--<div class="content">测试一下</div>-->
                                                    <!--<span class="i-talk-cor"></span>-->
                                                <!--</div>-->
                                            <!--</div>-->
                                        </div>
                                    </div>
                                    <div>
                                        <a id="msg_end" name="1" href="#1"> </a>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                </div>

                <div class="hot-number">
                    热门问题：
                    <div id="ecs" class="hot-item" value="ecs" onclick="AcceptData('ecs')"  >ecs</div>
                    <div id="yuming" class="hot-item" value="域名"  onclick="AcceptData('域名')">域名</div>
                    <div id="beian" class="hot-item" value="备案"  onclick="AcceptData('备案')">备案</div>
                    <div id="youxiang" class="hot-item" value="邮箱"  onclick="AcceptData('邮箱')">邮箱</div>
                </div>
						
                        <script language="javascript">
						function AcceptData(num){
						document.getElementById("search").value+=num;
						}
						</script>
                <!--<div class="send-box">-->
                    <!--<div class="input-box" autocomplate="off" >-->
                        <!--<input type="text" id="input" class="input ui-autocomplate-input" placeholder="主人，您还想问些什么？" autocomplete="off" autofocus>-->
                    <!--</div>-->
                    <!--<div id="send-btn" class="send-btn">-->
                        <!--<span onclick="sendMessage(document.getElementById('input').value)">发送</span>-->
                    <!--</div>-->
                <!--</div>-->


                <div class="ask-area">
                    <div class="input-area">
                        <ul class="input-tip">
                            <textarea id="search" autocomplete="off" name="accepDate" disableautocomplete placeholder="主人，您有什么想问的吗？" autofocus></textarea>
                        </ul>
                    </div>
                    <button class="send-btn" onclick="sendMessage(document.getElementById('search').value)">
                        发送
                    </button>
                </div>


            </div>
        </div>
    </div>


</body>
</html>