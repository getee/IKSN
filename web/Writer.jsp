<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>写博客</title>
<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7/dist/css/bootstrap.min.css">
<script src="js/jquery-3.3.1.js"></script>
<script src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>

 <script type="text/javascript" charset="utf-8" src="ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>

<body>
<div class="container-fluid">
 
 <!--	导航栏-->
	<div class="row">
		<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->


    <!-- Collect the nav links, forms, and other content for toggling -->
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
	<!--	导航栏结束-->

  <div class="row">
  	<div class="col-md-1"></div>
    <!--主干  -->
    <div class="col-md-10">
    	<div class="row">
        <!-- 右侧标题链接开始 -->
      <div class="col-xs-8 col-sm-2">
        <ul class="nav nav-list" contenteditable="false">
<p>内容</p>
<ul class="nav nav-pills nav-stacked">
<li class="active"><a href="#">文章管理</a></li>
<!-- 这里的active属性就是使得所在的li的背景色变为蓝色-->
<li><a href="#">专栏管理</a></li>
<li><a href="#">评论管理</a></li>
<li><a href="#">个人分类管理</a></li>
<li><a href="#">Char快问</a></li>
<li><a href="#">博客搬家</a></li>
</ul>
<p>内容</p>
<ul>
<li><a href="#">博客设置</a></li>
<li><a href="#">栏目管理</a></li>
			</ul></ul>
      </div>
      <!-- 右侧链接结束 -->
      <!-- 输入文本开始 -->
      <div class="col-xs-4 col-sm-10">
        <div class="row">
  <div class="col-md-1"></div>
  <!-- 博客标题开始-->
  <div class="col-md-11">
  <div class="input-group input-group-lg">
          <input type="text" class="form-control" placeholder="请输入文章标题">
          
        </div>
  </div>
   <!--博客标题结束 -->
		</div>
        <div class="row">
  <div class="col-md-1"></div>
          <!-- 文章主干开始-->
  <div class="col-md-11">
  <div class="row">
  <div class="col-md-12">
<div>
    <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
</div>

  </div>
</div>

  </div>
		</div>
          <!-- 文章主干结束-->
        <div class="row">

  <div class="col-md-12">
  <div class="row">
<div class="col-md-1"></div>
  <div class="col-md-10">
  <a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" id="AddMoreFileBox" class="btn btn-info">文章标签（点击添加）</a></span></p>
<div id="InputsWrapper">
<div><input type="text" name="mytext[]" id="field_1" value="标签 1"/><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="removeclass"><input type='button' value='删除'></a></div>
</div>

</div>
</div>
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-2">
<div class="btn-group">
  <button type="button" class="btn btn-info">文章类型</button>
  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu">
    <li><a href="#">原创</a></li>
    <li><a href="#">转载</a></li>
    <li><a href="#">翻译</a></li>
  </ul>
</div>
</div>
<div class="col-md-9">
<div class="btn-group">
  <button type="button" class="btn btn-info">Action</button>
  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li role="separator" class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div>
</div>

</div>
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-2">
 <div class="control-group">
        <label class="control-label" for="notification1">是否设为私密</label>
        <div class="controls">
            <div class="switch" tabindex="0">
                <input id="notification1" type="checkbox" />
            </div>
        </div>
    </div>
</div>
</div>
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
<button type="button" class="btn btn-primary">发布博客</button>
<!-- 表示一个成功的或积极的动作 -->
<button type="button" class="btn btn-success">保存为草稿</button>
<!-- 信息警告消息的上下文按钮 -->
<button type="button" class="btn btn-info">返回</button>
</div>
<div class="col-md-1"></div>

</div>
</div>
		</div>
        
      </div>
      <!-- 输入文本结束-->
    </div>
    
    </div>
    <!-- 主干结束 -->
    <div class="col-md-1"></div>
  </div>
</div>
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
</script>
<script>

$(document).ready(function() {
var MaxInputs    = 8; //maximum input boxes allowed
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
      $(InputsWrapper).append('<div><input type="text" name="mytext[]" id="field_'+ FieldCount +'" value="标签 '+ FieldCount +'"/><a href="#" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="removeclass"><input type="button" value="删除"></a></div>');
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
