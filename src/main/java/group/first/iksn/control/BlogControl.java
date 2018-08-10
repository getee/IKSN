package group.first.iksn.control;


import group.first.iksn.service.BlogService;
import group.first.iksn.util.EncodingTool;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;




@Controller
@RequestMapping("/blog")
public class BlogControl {
    private BlogService blogService;


    public BlogService getBlogService() {
        return blogService;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    @RequestMapping(value = "/blogSearch")
    public String bSearch(@RequestParam("content") String textcontent ){
        textcontent=EncodingTool.encodeStr(textcontent);//先将中文乱码转成UTF-8

        System.out.println(textcontent);
        return "sousuo";
    }

}
