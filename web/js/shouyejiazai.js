aaaa=0;
function xuanze(a) {
        $("#allBlogs").css("display","none");
        $("#jztp").css("display","block");
        $("#all").html("");
        $(window).off('scroll',tsscroll);
        $(window).scroll(qitascroll);
        aaaa=a;
        setTimeout(function () {
            var dm="";
            $.get("/blog/classifyPush?classify="+a+"&page=1",function(data) {
                for (var n = 0; n < 5; n++) {
                    var newblog = "<div class=\"span12\" style=\"border-radius: 10px;background-color:#FFFFFF;margin-top: 30px\">\n" +
                        "\t\t\t\t\t\t\t<h2>\n" +
                        "\t\t\t\t\t\t\t\t<a href=\"/blog/getBlogAndUser?blogid=" + data[n].bid + "\">" + data[n].title + "</a>\n" +
                        "\t\t\t\t\t\t\t</h2>\n" +
                        "\t\t\t\t\t\t\t<p>\n" +
                        "\t\t\t\t\t\t\t\t" + data[n].content + ".........\n" +
                        "\t\t\t\t\t\t\t</p>\n" +
                        "\t\t\t\t\t\t\t<h5 style=\"color:#928F8F;float: right\">\n" +
                        "                                类型: " + data[n].classify + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "                                时间: " + data[n].time + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "                                阅读数: " + data[n].bid + "</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "\t\t\t\t\t\t\t<p>\n" +
                        "\t\t\t\t\t\t\t\t<a class=\"btn\" href=\"/blog/getBlogAndUser?blogid=" + data[n].bid + "\">查看更多 »</a>\n" +
                        "\t\t\t\t\t\t\t</p>\n" +
                        "\t\t\t\t\t\t</div>";
                    dm=dm+newblog;
                }
                $("#all").html(dm)
            });
            $("#jztp").css("display","none");
        },2000);
}
function qitascroll() {
    page=1;
    var scrollTop = $(this).scrollTop();
    var scrollHeight = $(document).height();
    var windowHeight = $(this).height();
    if(Math.round(scrollTop) + windowHeight >= scrollHeight){
        $("#loading").css("display","block");
        setTimeout(function(){
            //1.当滚动到网页地步当时候应该发起ajax请求下一页当数据
            $.get("/blog/classifyPush?classify="+aaaa+"&page="+(page+1),function(data){
                for(var n=0;n<5;n++)
                {
                    var newblog="<div class=\"span12\" style=\"border-radius: 10px;background-color:#FFFFFF;margin-top: 30px\">\n" +
                        "\t\t\t\t\t\t\t<h2>\n" +
                        "\t\t\t\t\t\t\t\t<a href=\"/blog/getBlogAndUser?blogid="+data[n].bid+"\">"+data[n].title+"</a>\n" +
                        "\t\t\t\t\t\t\t</h2>\n" +
                        "\t\t\t\t\t\t\t<p>\n" +
                        "\t\t\t\t\t\t\t\t"+data[n].content+".........\n" +
                        "\t\t\t\t\t\t\t</p>\n" +
                        "\t\t\t\t\t\t\t<h5 style=\"color:#928F8F;float: right\">\n" +
                        "                                类型: "+data[n].classify+" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "                                时间: "+data[n].time+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "                                阅读数: "+data[n].points+"</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "\t\t\t\t\t\t\t<p>\n" +
                        "\t\t\t\t\t\t\t\t<a class=\"btn\" href=\"/blog/getBlogAndUser?blogid="+data[n].bid+"\">查看更多 »</a>\n" +
                        "\t\t\t\t\t\t\t</p>\n" +
                        "\t\t\t\t\t\t</div>";
                    $("#all").append(newblog);
                }
                page+=1;
            });
            $("#loading").css("display","none");
        }, 2000);

    }
}
