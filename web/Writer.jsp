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
    <script type="text/javascript" charset="utf-8" src="ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7/dist/css/bootstrap-theme.min.css" crossorigin="anonymous">

    <script src="js/depend.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>

</head>
<div style="background: #f8f8f8;">
    <div class="container-fluid">
        <!--   导航栏-->
        <div class="row">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="index.jsp">首页 <span class="sr-only">(current)</span></a></li>
                            <li><a href="#">博客</a></li>
                            <li><a href="#">学院</a></li>
                            <li><a href="xiazai.jsp">下载</a></li>
                            <li><a href="#">GitChat</a></li>
                            <li><a href="#">TinyMind</a></li>
                            <li><a href="#">论坛</a></li>
                            <li><a href="#">问答</a></li>
                            <li><a href="#">商城</a></li>
                            <li><a href="#">VIP</a></li>
                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a class="glyphicon glyphicon-pencil" href="#"> 写博客</a></li>
                            <li><a class="glyphicon glyphicon-leaf" href="#">发Chat</a></li>
                            <li><a class="glyphicon glyphicon-user" href="gerenzhongxin.jsp"></a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>
        </div>
    </div>
    <div>
        <form id="form" action="/blog/addBlog" method="post">
            <div class="input-group input-group-lg" style="width: 1024px;height:15px; margin: auto;">
                <input type="text" class="form-control" id="biaoti"name="title" placeholder="请输入文章标题">
            </div>
            <div style="width:1024px;height:450px;margin:auto;margin-top: 10px;">
                <textarea id="editor" type="text/plain" name="content"></textarea>
            </div>

            <div class="col-md-12" style="left: 460px;top: 20px">
                <div class="row">
                    <div class="col-md-10">
                        <button type="button" class="btn btn-info">返回</button>

                        <!-- 表示一个成功的或积极的动作 -->
                        <button type="button" class="btn btn-info">保存</button>
                        <button type="button"  class="btn btn-primary" data-toggle="modal" data-target="#myModal">发布博客</button>
                    </div>
                </div>
            </div>


    <div>
        <button onclick="getContent()">获得内容</button>
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
                                    <input type="text" name="btag" id="field_1" value="标签 1"/>
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
                                <option value="0">请选择</option>
                                <option value="1">原创</option>
                                <option value="2">转载</option>
                                <option value="3">翻译</option>
                            </select>
                            <span class="required">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label style="width: 15px;width: 70px;" >博客分类：</label>
                            <select id="Type2"  name="classify">
                                <option value="0">选择分类</option>
                                <option value="2">人工智能</option>
                                <option value="1">移动开发</option>
                            </select>
                            <span class="required">*</span>
                        </div>
                        <br>
                        <br>
                        <!---->
                    </div>
                    <div class="row" style="padding: 40px;position: absolute;top: 160px">
                        <label class="control-label" for="notification1">是否设为私密</label>
                        <input id="notification1" type="checkbox" />
                    </div>
                </div>
                <div class="modal-footer" >
                    <button type="button" class="btn btn-default" style="margin-top: 10px">返回</button>
                    <button type="button" class="btn btn-primary"style="margin-top: 10px">保存</button>
                    <button type="submit" class="btn btn-success"style="margin-top: 10px">发表博客</button>
                </div>
            </div>
        </div>

        </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor',{
        toolbars: [[
            'fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', 'simpleupload', 'insertimage', 'emotion', 'scrawl', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
            'inserttable', 'deletetable', 'preview',  'help'
        ]],
        //关闭字数统计
        wordCount:true,
        //关闭elementPath
        elementPathEnabled:false,
        initialFrameHeight:380,
        initialFrameWidth :1024,//设置编辑器宽度
    });
    function getContent() {
        var arr = [];
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
</script>
<script>
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
                $(InputsWrapper).append('<div><input type="text" name="btag" id="field_'+ FieldCount +'" value="标签 '+ FieldCount +'"/><a href="#" rel="external nofollow" class="removeclass"><input type="button" value="删除"></a></div>');
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
    });
</script>
</body>
</html>