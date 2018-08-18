<%--
  Created by IntelliJ IDEA.
  User: Y-Yong
  Date: 2018/8/17/017
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="js/chinese2pinyin.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <script type="text/javascript">
        $(function() {
            var t = "tf他们xiao";
            var result = chineseToPinYin(t);

            alert(result);
        });
</script>


</body>
</html>
