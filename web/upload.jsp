<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <base href="<%=basePath%>">

    <link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->

    <%--<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>--%>
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>

    <script>
        function upload() {

            $("#upimg").css("background-image", "url(img/upfile.png)");
            //jquery获取input file文件名
            var file = $("#choosefile").val();
            var fileName = getFileName(file);
            function getFileName(o){
                var pos=o.lastIndexOf("\\");
                return o.substring(pos+1);

            }
           alert(fileName);
//=======================================================================================================================

            var formData = new FormData($( "#upFileForm" )[0]);
            var ajaxUrl = "resource/upLoadFile";
            //$('#uploadPic').serialize() 无法序列化二进制文件，这里采用formData上传
            //需要浏览器支持：Chrome 7+、Firefox 4+、IE 10+、Opera 12+、Safari 5+。
            $.ajax({
                type: "POST",
                //dataType: "text",
                url: ajaxUrl,
                data: formData,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    alert("check");
                    $("#filepath").attr("value",data);
                },
                error: function(data) {
                    alert("error:"+data);
                    $("#filepath").attr("value",'0');

                }
            });
            return false;
        }

        function sess() {
            if($("#filepath").attr("value")=='0'){
                alert("文件上传失败，请重新选择！");
            }else {
                alert("文件可以上传");
                $("#upMagForm").submit();
            }

        }

    </script>
</head>
<body style="background-color:#F7F8F9">
<c:if test="${requestScope.resouce eq null}">
    <c:redirect url="/index.jsp"></c:redirect>
</c:if>
<!--  导航栏-->
<%@ include file="top.jsp"%>
<!--  导航栏结束-->

<!--二级导航开始-->
<div class="row"  style="margin-top: -1.2%; font-size:16px;background-color:#EAEBEC; min-width:1024px;" >

    <ul class="nav nav-tabs"  style="margin-left:15%;" >
        <li ><a href="xiazai.jsp">下载首页</a></li>
        <li ><a href="myresource.jsp">我的资源</a></li>
        <li ><a href="upload.jsp">上传资源赚积分</a></li>
        <li ><a href="myresource.jsp">已下载</a></li>
        <li ><a href="myresource.jsp">我的收藏</a></li>
    </ul>

</div>
<!--二级导航结束-->

<div contenteditable="true" style="margin-left: 10%;margin-right: 10%; min-width:1024px;margin-top:3%;"><a href="#">下载频道</a> > 资源上传</div>
<div class="row well" style="margin-left: 10%;margin-right: 10%; min-width:1024px;">
    <!--中间主内容开始-->
    <div class="col-xs-8">
        <div style="min-height:230px;">
            <div>

                <form id="upFileForm" action="resource/upLoadFile" method="post">
                    <legend contenteditable="true">上传资源</legend>
                    <label>
                        <c:if test="${sessionScope.loginresult eq null}">
                            <input type="hidden" name="uid" value="2" />
                        </c:if>
                        <c:if test="${sessionScope.loginresult != null}">
                            <input type="hidden" name="uid" value="${sessionScope.loginresult.uid}" />
                        </c:if>
                        <div id="upimg" style="background:url('img/upload.png'); width:141px; height:116px;">
                            <input style="position:absolute;opacity:0;" type="file" name="file" id="choosefile" onchange="upload()" />
                        </div>
                    </label>
                </form>

                <form action="resource/upLoadMag" id="upMagForm" method="post">

                    <%--用js注入文件路径--%>
                    <input type="hidden" id="filepath" name="path" value="0" />

                    <c:if test="${sessionScope.loginresult eq null}">
                        <input type="hidden" name="uid" value="2" />
                    </c:if>
                    <c:if test="${sessionScope.loginresult != null}">
                        <input type="hidden" name="uid" value="${sessionScope.loginresult.uid}" />
                    </c:if>

                    <span class="help-block" contenteditable="true">您可以上传小于220MB的文件</span> <br />
                    <label contenteditable="true">资源名称: </label>
                    <input style=" border-radius:4px; width:300px; height:30px;" name="name" type="text" placeholder="请输入资源名称">
                    <span class="help-block" contenteditable="true">名称最多不超过80字，不少于10字</span>

                    <label contenteditable="true">所属分类: </label>
                    <select style="border-radius:4px;width:200px;height:30px;" name="classify"
                            onchange="document.getElementById('input').value=this.value">
                        <option value="0">请选择</option>
                        <option value="1">移动开发</option>
                        <option value="2">开发技术</option>
                        <option value="3">课程资源</option>
                        <option value="4">网络技术</option>
                        <option value="5">操作系统</option>
                        <option value="6">其他</option>
                    </select>
                    <br /><br />
                    <label contenteditable="true">资源标签: </label>
                    <a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" id="AddMoreFileBox" class="btn btn-info" style=" height:30px;background-color:#FFF; border-color:#A9A9A9; color:#34AAE8">添加标签</a></span></p>
                    <span class="help-block" contenteditable="true">最多添加6个标签</span>
                    <div id="InputsWrapper">
                    </div>
                    <br />
                    <label contenteditable="true">资源分数: </label>
                    <select style="border-radius:4px;width:80px;height:30px;" name="scoring"
                            onchange="document.getElementById('input').value=this.value">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select><br /><br />


                    <label contenteditable="true">资源描述: </label>
                    <input style=" border-radius:4px; width:510px; height:60px; resize:none; vertical-align: top;" name="introduce" type="text" placeholder="描述不支持HTML标签；详细的资源描述有机会获得我们的推荐，更有利于他人下载，赚取积分。如资源描述不清，有可能审核不通过。" />

                    <div class="checkbox">
                        <label><input type="checkbox"> 勾选同意</label>
                    </div>
                    <button type="button" onclick="sess()" class="btn" id="btn" contenteditable="true" style="margin-left:20px;">提交</button>
                </form>
            </div >
        </div>
        <!--中间主内容结束-->
    </div>

    <div class="col-xs-4 well">
        <!--右下角上传须知开始-->
        <div >
            <p style="font-size:16px;">上传须知</p>
            <ul contenteditable="true">
                <p><li>如涉及侵权内容,您的资源将被移除</li></p>
                <p><li>请勿上传小说、mp3、图片等与技术无关的内容.一旦发现将被删除</li></p>
                <p><li>请勿在未经授权的情况下上传任何涉及著作权侵权的资源，除非该资源完全由您个人创作</li></p>
                <p><li>点击上传资源即表示您确认该资源不违反资源分享的使用条款，并且您拥有该资源的所有版权或者上传资源的授权</li></p>
                <p><li>您上传的资源如果因版权、使用、内容完整度 等原因被举报并通过官方审核，将扣除通过该资源获得的全部积分</li></p>
            </ul>

            <!--联系我们-->
            <div id="contact-us" class="span12" style="margin-top: 30px; margin-left:10%;">
                <span>联系我们</span>
                <hr>
                <div class="row">
                    <div class="col-xs-6 col-md-1" >
                    </div>
                    <div class="col-xs-6 col-md-7" style=" width:140px;height:140px;background-size:100%;background-image: url(img/3_weixin.jpg)">

                    </div>
                    <div class="col-xs-6 col-md-4"></div>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-md-1"></div>
                    <div class="col-xs-6 col-md-10">
                        <h5>请联系客服</h5>
                        <p>
                            <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M2.167 2h11.666C14.478 2 15 2.576 15 3.286v9.428c0 .71-.522 1.286-1.167 1.286H2.167C1.522 14 1 13.424 1 12.714V3.286C1 2.576 1.522 2 2.167 2zm-.164 3v1L8 10l6-4V5L8 9 2.003 5z" fill="#B3B3B3" fill-rule="evenodd"></path></svg>
                            <a href="mailto:webmaster@csdn.net" target="_blank"><span class="txt">webmaster@csdn.net</span></a>
                        </p>
                        <p>
                            <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M14.999 13.355a.603.603 0 0 1-.609.645H1.61a.603.603 0 0 1-.609-.645l.139-1.47c.021-.355.25-.845.51-1.088 0 0 3.107-2.827 3.343-2.909 0 0-.029-2.46 1.2-2.46h3.635c1.112 0 1.202 2.469 1.202 2.469l3.32 2.9c.26.243.489.733.51 1.088l.139 1.47zM7 10a1 1 0 0 0 0 2h2a1 1 0 0 0 0-2H7zm7.806-5.674c.105.135.191.384.19.554l-.003 2.811c0 .17-.133.26-.295.2l-2.462-.999a.478.478 0 0 1-.296-.416V5.445c0-2.07-7.878-2.225-7.878 0v1.21c0 .17-.135.352-.3.404L1.3 7.904c-.165.052-.3-.044-.3-.213V4.88c0-.17.086-.42.191-.554C1.191 4.326 2.131 2 8 2s6.807 2.326 6.807 2.326z" fill="#B3B3B3"></path></svg>
                            <span class="txt"> 400-660-0108</span>
                        </p>
                        <p>
                            <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M14.496 10.35c-.301-1.705-1.565-2.822-1.565-2.822.18-1.548-.481-1.823-.481-1.823C12.31.915 8.089.998 8 1 7.91.998 3.689.915 3.55 5.705c0 0-.662.275-.481 1.823 0 0-1.264 1.117-1.565 2.822 0 0-.16 2.882 1.445.353 0 0 .36.96 1.022 1.823 0 0-1.183.392-1.083 1.412 0 0-.04 1.136 2.527 1.058 0 0 1.805-.137 2.347-.882h.476c.542.745 2.347.882 2.347.882 2.566.078 2.527-1.058 2.527-1.058.1-1.02-1.083-1.412-1.083-1.412a7.986 7.986 0 0 0 1.022-1.823c1.604 2.529 1.445-.353 1.445-.353z" fill="#B3B3B3" fill-rule="evenodd"></path></svg><a href="javascript:void(0);" class="qqcustomer_s" target="_blank"><span class="txt">QQ客服</span></a>        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg"><path d="M7.325 13.965a6.5 6.5 0 1 1 7.175-6.4C14.467 11.677 11.346 15 7.5 15c-.514 0-1.015-.06-1.498-.172.488-.178.922-.48 1.323-.863zM4 7.5a4 4 0 1 0 8 0 .5.5 0 1 0-1 0 3 3 0 1 1-6 0 .5.5 0 0 0-1 0z" fill="#B3B3B3" fill-rule="evenodd"></path></svg>
                            <a href="http://bbs.csdn.net/forums/Service" target="_blank"><span class="txt">客服论坛</span></a>
                        </p>
                    </div>
                    <div class="col-xs-6 col-md-1"></div>
                </div>


                <!--  -->

            </div>
            <!--联系结束-->

        </div>
        <!--右下角上传须知结束-->
    </div>
</div>
</body>
<script>

    $(document).ready(function() {
        var MaxInputs    = 6; //maximum input boxes allowed
        var InputsWrapper  = $("#InputsWrapper"); //Input boxes wrapper ID
        var AddButton    = $("#AddMoreFileBox"); //Add button ID
        var x = InputsWrapper.length; //initlal text box count
        var FieldCount=0; //to keep track of text box added
        $(AddButton).click(function (e) //on add input button click
        {
            if(x <= MaxInputs) //max input box allowed
            {
                FieldCount++; //text box added increment
                //add input box
                $(InputsWrapper).append('<span><input style="width:70px;" type="text" name="mytext" id="field_'+ FieldCount +'" value="标签 '+ FieldCount +'"/><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="removeclass"><input style="width:40px;" type="button" value="删除"></a></span>');
                x++; //text box increment
            }
            return false;
        });
        $("body").on("click",".removeclass", function(e){ //user click on remove text
            if( x > 1 ) {
                $(this).parent('span').remove(); //remove text box
                x--; //decrement textbox
            }
            return false;
        })
    });
</script>
<style>
    a{
        cursor:pointer;
    }
</style>
</html>
