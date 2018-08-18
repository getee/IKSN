<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html>
<head>
    <title>完整demo</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <base href="<%=basePath%>">

    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <script src="js/jquery-3.3.1.js"></script>
    <script src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7/dist/css/bootstrap-theme.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="themes/iframe.css" crossorigin="anonymous">
    <script src="js/depend.js"></script>
</head>
<body  style="background-color:#EBEBEB">
    <div class="container-fluid">
        <!--   导航栏-->
        <%@ include file="top.jsp"%>

    <div>
        <form id="form" action="/blog/addBlog" method="post">
            <input type="hidden" name="uid" value="${sessionScope.loginresult.uid}"/>
            <input type="hidden" name="isdraft" value="0" id="panduan">
            <div class="input-group input-group-lg" style="width: 1024px;height:15px; margin: auto;">
                <input type="text" class="form-control" id="biaoti"name="title" placeholder="请输入文章标题" >
            </div>
            <div style="width:1024px;height:430px;margin:auto;margin-top: 10px;">
                <textarea id="editor" type="text/plain" name="content"></textarea>
            </div>

            <div class="col-md-12" style="left: 460px;top: 20px">
                <div class="row">
                    <div class="col-md-10">
        <script>
            function check() {
                var val=$('#biaoti').val();
                var val1=UE.getEditor('editor').getContent();
                if (val.length==0 || val1.length==0){
                    alert("标题or博客内容不能为空！");
                    $('#fbblog').attr("disable",true);
                }else {
                    $('#fbblog').attr("disable",false);
                }
            }
        </script>

                        <button type="button" class="btn btn-info" >返回</button>
                        <!-- 表示一个成功的或积极的动作 -->
                        <button type="button" id="fbblog" class="btn btn-primary"  data-toggle="modal" data-target="#myModal" onmousemove="check()" >发布博客</button>
                    </div>
                </div>
            </div>


    <!-- Modal -->
    <div class="modal fade" id="myModal"  role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel" style="color: red">发布博客</h4>
                </div>
                <div class="modal-body">
                    <!---->
                    <div class="row" style="padding: 20px">
                        <div class="col-md-4">
                            <a href="#" rel="external nofollow" id="AddMoreFileBox" class="btn btn-info">文章标签（点击添加）</a>
                        </div>
                        <div class="col-md-7">
                            <div id="InputsWrapper">
                                <div>
                                    <input type="text" name="btag" id="field_1" placeholder="请输入标签"/>
                                    <a href="#" rel="external nofollow" class="removeclass">
                                        <input type="button" value='删除'>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div >
                    <div class="row" style="padding: 40px;">
                        <div class="txt-box" >
                            <label style="width: 15px;width: 70px;">文章类型：</label>
                            <select id="Type1" name="blogtype">
                                <option value="1">原创</option>
                                <option value="2">转载</option>

                            </select>
                            <span class="required">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label style="width: 15px;width: 70px;" >博客分类：</label>
                            <select id="Type2"  name="classify">
                                <option value="1">移动开发</option>
                                <option value="2">开发技术</option>
                                <option value="3">课程资源</option>
                                <option value="4">网络技术</option>
                                <option value="5">操作系统</option>
                                <option value="6">安全技术</option>
                                <option value="7">数据库</option>
                                <option value="8">行业</option>
                                <option value="9">服务器应用</option>
                                <option value="10">存储</option>
                                <option value="11">信息化</option>
                                <option value="12">云计算</option>
                                <option value="13">大数据</option>
                                <option value="14">人工智能</option>
                                <option value="15">区块链</option>
                                <option value="16">音视频</option>
                                <option value="17">游戏开发</option>
                                <option value="18">跨平台</option>
                            </select>
                            <span class="required">*</span>
                        </div>
                        <br>
                        <br>
                        <!---->
                        <label class="control-label" for="notification1">是否设为私密</label>
                        <input id="notification1" type="checkbox"  value="1" name="ispublic" onclick="this.value=(this.value==1)?1:0"/>

                    </div>
                </div>
                <script>
                    function report() {
                     $("#panduan").val("1");
                    }
                </script>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" style="margin-top: 10px">返回</button>
                    <button type="submit" class="btn btn-primary"style="margin-top: 10px" >保存</button>
                    <button type="submit" class="btn btn-success"style="margin-top: 10px" onclick="report()">发表博客</button>
                </div>
            </div>
        </div>

        </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        var MaxInputs    = 3; //maximum input boxes allowed
        var InputsWrapper  = $("#InputsWrapper"); //Input boxes wrapper ID
        var AddButton    = $("#AddMoreFileBox"); //Add button ID
        var x = InputsWrapper.length; //initlal text box count
        var FieldCount=1; //to keep track of text box added
        $(AddButton).click(function (e) //on add input button click
        {
            if(x <= MaxInputs) //max input box allowed
            {
                FieldCount++; //text box added increment
                //add input box
                $(InputsWrapper).append('<div><input type="text" name="btag" id="field_'+ FieldCount +'" placeholder="标签 '+ FieldCount +'"/>&nbsp;<a href="#" rel="external nofollow" class="removeclass"><input type="button" value="删除"></a></div>');
                x++; //text box increment
            }
            return false;
        });
        $("body").on("click",".removeclass", function(e){ //user click on remove text
            if( x > 1 ) {
                $(this).parent('div').remove(); //remove text box
                x--; //decrement textbox
            }
            return false;
        })

        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('editor',{
            toolbars: [[
                'fullscreen', 'source', '|', 'undo', 'redo', '|',
                'bold', 'italic', 'underline', 'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                'link', 'unlink', 'simpleupload', 'insertimage', 'emotion', 'scrawl', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
                'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
                'inserttable', 'deletetable', 'preview',  'help'
            ]],
            //关闭字数统计
            wordCount:true,
            autoHeightEnabled: false,
            //关闭elementPath
            elementPathEnabled:false,
            initialFrameHeight:360,
            initialFrameWidth :1024,//设置编辑器宽度
        });


    });
</script>
</body>
</html>