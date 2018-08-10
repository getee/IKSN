package group.first.iksn.control;

import group.first.iksn.service.BlogService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    /**
     *
     * @param blog_id
     * @return
     */
    @RequestMapping("/managerDeleteBlogForReported")
    @ResponseBody//此注解不能省略 否则ajax无法接受返回值
    public String managerDeleteBlogForReported(int blog_id){
        System.out.println("调用managerDeleteBlogForReported");
        return "success";
    }
}
