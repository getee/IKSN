<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <!--CSS-->
    <style type="text/css">

        .border{
            border:2px solid;
            border-top-color:#FFFFFF;
            border-bottom-color:#F7F8F9;
            border-left-color:#FFFFFF;
            border-right-color:#FFFFFF;
        }
        .float{
            float:right;
            margin-top:10px;
            text-align:center;
            border-radius:15px;
        }
        .renmzy{
            height:20px;
            width:150px;
            float:left;
            margin-left:25px;
            border:1px solid;
            border-radius:10px;
            border-color:#F75D47;
            color:#F75D47;
            text-align:center;
            font-size:13px;
            margin-top:8px;
        }

    </style>


</head>
<body  style="background-color:#F7F8F9">
<div class="container-fluid">
    <!--	导航栏-->
    <%@ include file="top.jsp"%>
    <!--	导航栏结束-->
    <!--二级导航开始-->

    <div class="row"  style="margin-top: -1.2%; font-size:16px;background-color:#EAEBEC; min-width:1024px;" >

        <ul class="nav nav-tabs"  style="margin-left:15%;" >
            <li ><a href="#">下载首页</a></li>
            <li ><a href="#">我的资源</a></li>
            <li ><a href="#">上传资源赚积分</a></li>
            <li ><a href="#">已下载</a></li>
            <li ><a href="#">我的收藏</a></li>
            <c:if test="${sessionScope.loginresult.isadmin eq '1'}">
                <li style="margin-left: 5%"><a href="/blog/mGetAllReportBlog">返回举报页</a></li>
                <li><a href="javascript:deleteResource(${resourceid})">删除</a></li>
                <li><a style="cursor: default">举报原因：${reportRReason}</a></li>
            </c:if>
        </ul>

    </div>
    <!--二级导航结束-->
<script>
    function deleteResource(url) {
        var userChoice=window.confirm("您确认要去除这个资源吗？");
        var a="/resource/mDeleteResourceForReport/"+url;
        if(userChoice){
            // location.href=a;
        }
    }
</script>



    <div class="row well" style="margin-left: 10%;margin-right: 10%; min-width:1024px;">

        <div class="col-xs-8">
            <!--左第一大块div-->
            <div  style=" height:260px;background-color:#FFFFFF;">


                <!--第一个div-->
                <div class="border" style="height:150px;">
                    <div style="height:85px; width:800px; margin-left:20px;">
                        <div style="height:48px; width:42px; float:left; margin-top:15px ">
                            <img src="img/2.svg">
                        </div>
                        <div style="height:20px; width:420px; float:left; margin-top:15px; margin-left:40px;  font-size:20px ; color:#000000;">
                            <a>${resource.}</a>
                        </div>
                        <div style="height:30px; width:700px; float:left;margin-top:12px; margin-left:40px;font-size:14px;">
                            <div style="width:250px; height:30px;  float:left">
                                <span> 2018-06-08  上传</span>
                                <span>&nbsp;&nbsp;&nbsp;&nbsp;大小：<em>308KB</em></span>
                            </div>
                            <div style="height:23px;width:60px;float:left;margin-left:30px;border:1px solid;;border-radius:                         10px; border-color:#F75D47; color:#F75D47;text-align:center;">
                                <a href="#"> IP地址</a>
                            </div>

                        </div>
                    </div>


                    <div style=" background-color:#F5F5F5; margin-left:20px">
                        <div class="row-fluid">
                            <div class="span12" style="width:600px; ">
                                <p>地图找房-高德地图显示数据点 - 按比例尺缩放显示数目---&gt; (1.发起请求传给后台当前用户坐标。 2.让                              后台按用户位置将周边一定范围内（后台可调）的排序，返回。 3.前端请求到数据后，最近的电站数据                              在数组第一个，此时调用地图API
                                </p>
                            </div>
                        </div>
                    </div>
                </div>


                <!--第二个div-->
                <div class="border" style=" height:45px;">
                    <div style=" height:25px; width:600px;  margin-top:10px; margin-left:20px">
                  <span>
                   下载次数：${requestScope.num}&nbsp;&nbsp;&nbsp;&nbsp;
                  </span>
                        <span> 综合评分：<em>7.9</em></span>
                        <div style="float:right; width:250px;">
                            <a href="#"><img src="img/sc.jpg">&nbsp;收藏</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="#"><img src="img/pl.jpg">&nbsp;评论</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a data-toggle="modal" data-target="#modal-container-830220" ><img src="img/jb.jpg" >&nbsp;举报</a><input type="hidden" value="${isReportOk}"/>
                            <!-- 模态框（Modal） -->
                            <!-- Modal -->
                            <div class="modal fade" id="modal-container-830220" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-top: 20%">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">举报原因</h4>
                                        </div>
                                        <div class="modal-body">
                                            <!--								文本域-->
                                            <form id="addForm" action="/resource/reportResource" method="post">
                                                资源ID：<input name="rid" type="text" value="1" readonly="readonly"/>
                                                举报人ID：<input name="uid" type="text" value="1" readonly="readonly"/>
                                                <textarea name="reason" class="form-control" rows="3"></textarea><br/>
                                                <input  type="submit" value="提交" onclick="report()"/>
                                            </form>
                                            <!--								-->

                                        </div>
                                       <%-- <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                            <button id="submitAdd" type="button" class="btn btn-primary">提交</button>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                    </div>

                </div>



                <!--第三个div-->
                <div style=" height:50px;">
                    <div  style=" height:28px; width:200px; padding:15px 20px;  float:left">
                        <label style="font-size:16px">
                            所需:
                            <em style="color:#FACC16;font-size:22px">1</em>
                            积分/C币
                        </label>
                    </div>



                    <div class="float" style=" height:40px; width:140px;  background-color: #E7567F; margin-right:40px;" >
                        <a href="#" > <div style="height:30px; margin-top:5px"><img src="img/vip.jpg">开通VIP</div></a>
                    </div>

                    <div class="float" style="height:38px;width:120px;margin-right:20px;border:1px solid;border-color:#95E2E8;">
                        <a  href="assess.jsp" ><div style="height:20px; margin-top:8px">立即下载</div></a>
                    </div>

                </div>
            </div>

            <!--左第一大块div结束-->

            <!--左第二个div-->
            <div  style="height:55px; margin-top:10px; background-color:#FFFFFF">
                <h4 style=" padding:16px 20px; margin-bottom:0; font-weight:normal">
                    评论
                    <span  style="font-size:14px; margin-left:20px; font-weight:normal;">共有0条</span>
                </h4>
            </div>

            <!--左第三个div-->
            <div  style="height:400px; margin-top:10px; background-color:#FFFFFF">
            </div>
        </div>



        <div class="col-xs-4 well">
            <!--右边第一块上传资源的div-->
            <div style="height:50px; width:300px; background-color:#E33F3F">
                <div class="row-fluid">
                    <div class="span12"  style=" height:30px;; font-size:18px;text-align:center;padding:11px;">
                        <a href="#" ><img src="img/shangc.jpg">&nbsp;<font color="#FFFFFF">上传资源</font></a>
                    </div>
                </div>
            </div>
            <!--右边第一块上传资源的div结束-->

            <!--右边第二块上传资源的div-->
            <div style="height:73px; width:300px; background-color:#FFFFFF; margin-top:15px;">
                <!--最左边-->
                <div style="height:50px; width:50px; float:left; margin-top:11px; margin-left:15px">
                    <a herf="#"><img src="img/taotaoheros.jpg" /></a>
                </div>
                <!--最左边-->
                <!--中间-->
                <div style="height:50px; width:80px; float:left; margin-top:11px; margin-left:10px;">
                    <div style="height:20px; margin-top:6px; font-size:14px">
                        <a href="#">taotaohero</a>
                    </div>
                    <div style="height:20px; margin-top:0px; font-size:14px">
                        <a href="#"><img src="img/xz.jpg" /></a>
                    </div>
                </div>
                <!--中间-->

                <!--最右边-->
                <div style="height:50px; width:100px; float:left; margin-top:11px; margin-left:15px">
                    <div style="height:20px;width:60px; margin-top:6px; font-size:14px;border:2px solid; border-radius:15px; border-color:#F50105;text-align:center;">
                        <a href="#">关注</a>
                    </div>
                    <div style="height:25px; margin-top:5px; font-size:14px">
                        <a href="#">查看TA的资源</a>
                    </div>
                </div>
            </div>
            <!--最右边-->
            <!--右边第二块上传资源的div结束-->


            <!--右边第三块上传资源的div-->
            <div style=" width:300px; background-color:#FFFFFF; margin-top:15px; font-size:18px;">
                <div class="container-fluid">
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="tabbable" >
                                <ul class="nav nav-tabs">
                                    <li>
                                        <a href="#" data-toggle="tab">热门资源标签</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="renmzy" ><a href="#"> IP地址.......s</a> </div>
                                    <div class="renmzy" ><a href="#"> IP地址.......s</a> </div>
                                    <div class="renmzy" ><a href="#"> IP地址.......s</a> </div>
                                    <div class="renmzy" ><a href="#"> IP地址.......s</a> </div>
                                    <div class="renmzy" ><a href="#"> IP地址.......s</a> </div>
                                    <div class="renmzy" ><a href="#"> IP地址.......s</a> </div>
                                    <div class="renmzy" ><a href="#"> IP地址.......s</a> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--右边第三块上传资源的div结束-->

        </div>
    </div>
</div>
</div>
</body>
<script type="text/javascript">
    function shoucang()
    {
        alert("已收藏！")
    }
   function report() {
       alert("举报成功！")
   }

</script>
</html>
