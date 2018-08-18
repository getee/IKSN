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

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="js/jquery-3.3.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function(){
        //启用所有的工具提示插件
        $(function () { $("[data-toggle='tooltip']").tooltip(); });
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


    });
    //标记为已读或者是未读
    function biaoji(){
        var index=$("#biaoji").html();
        if(index=="全部标记已读"){
            $("#biaoji").html("全部标记为未读");
            $.get("user/changeMessageIsRead/1/${sessionScope.loginresult.uid}",function (data) {
                $("#weidutongzhi").html("未读通知："+data);
                $(".noticeContext").css("backgroundColor","white");
            });

        }else if(index=="全部标记为未读"){

            $("#biaoji").html("全部标记已读");
            $.get("user/changeMessageIsRead/0/${sessionScope.loginresult.uid}",function (data) {
                $("#weidutongzhi").html("未读通知："+data);
                $(".noticeContext").css("backgroundColor","black");

            });
        }
    }
    //清空所有的通知
    function qingkogntongzhi(uid) {
        $.get("user/deleteMessage/"+uid,function(data){
            window.location.reload();
        });

    }
    //分页
    function shangyiye(nowPage){
        if(nowPage-1>0){
           // $.get("",function(data){});

            window.location="/user/receiveMessage/${sessionScope.loginresult.uid}/"+(nowPage-1);
        }

    }

    function xiayiye(nowPage,AllNoticeNum){
        var maxPage;
        AllNoticeNum%5==0?AllNoticeNum=(friendNums/5):maxPage=(AllNoticeNum/5+1);
        if((nowPage*1+1)<=maxPage){
            window.location="/user/receiveMessage/${sessionScope.loginresult.uid}/"+(nowPage*1+1);
        }
    }
</script>
<!--	特效-->

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
            </tr>
        </table>

    </div>
    <div class="row well" style="margin-top: 2%; margin-left: 15%;margin-right: 15%">
        <div class="row" style="margin-left: 0.5%;margin-top: -5px">
            <nav>
                <ul class="nav nav-tabs">
                    <li role="presentation"><a href="/user/receiveNotice/${sessionScope.loginresult.uid}/1">通知</a></li>
                    <li role="presentation"><a href="/user/listAllFriends/${sessionScope.loginresult.uid}/1">私信</a></li>
                    <li role="presentation"><a href="/user/receiveMessage/${sessionScope.loginresult.uid}/1">@我</a></li>
                </ul>
            </nav>
        </div>
        <div class="row" style="margin-left: 0.5%;margin-top: 5px">
            <nav>
                <ol class="breadcrumb">
                    <li id="weidutongzhi" class="active">未读私信：${notReadMessageNum}</li>
                    <li><a id="biaoji" href="javascript:biaoji()">全部标记已读</a></li>
                    <li><a id="qingkongtongzhi" href="javascript:qingkogntongzhi(${sessionScope.loginresult.uid})">清空所有私信</a></li>

                </ol>
            </nav>
        </div>
        <!--	通知-->
        <div class="row well" style="margin: auto;height: 700px;">

                <c:forEach var="message" items="${allMessages}">
                    <c:forEach var="user" items="${allSendMessageUsers}">
                        <c:if test="${user.uid eq message.fromid}">
                            <c:choose>
                                <c:when test="${message.isread==0}">
                                    <div class="row well noticeContext" style="background-color: black"><a class="tooltip_a" href="/user/listAllFriends/${sessionScope.loginresult.uid}/1?sendback=${user.uid}" data-toggle="tooltip" title="点击回Ta"><h4>${user.nickname}(${user.email}):${message.content}</h4></a><small>${message.time}</small></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="row well noticeContext"><a class="tooltip_a" href="/user/listAllFriends/${sessionScope.loginresult.uid}/1?sendback=${user.uid}" data-toggle="tooltip" title="点击回Ta"><h4>${user.nickname}(${user.email}):${message.content}</h4></a><small>${message.time}</small></div>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:forEach>

                </c:forEach>


            <%--<div class="col-md-4">
                <c:forEach var="message" items="${allMessages}">
                    <c:forEach var="user" items="${allSendMessageUsers}">
                        <c:if test="${user.uid eq message.fromid}">
                            <c:choose>
                                <c:when test="${message.isread==0}">
                                    <div class="row well noticeContext" style="background-color: black"><a><h4><small>${message.time}</small></h4></a></div>
                                </c:when>
                                <c:otherwise>
                                    <div class="row well noticeContext"><a><h4><small>${message.time}</small></h4></a></div>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </c:forEach>

                </c:forEach>

            </div>--%>
          
        </div>
        <%--通知结束--%>
        <!--	分页-->
        <div class="row ">

            <nav aria-label="...">
                <ul class="pager">
                    <li><a href="javascript:shangyiye(${nowMessagePage})">上一页</a></li>
                    <li><a href="javascript:xiayiye('${nowMessagePage}','${allMessageNum}')">下一页</a></li>
                </ul>
            </nav>

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