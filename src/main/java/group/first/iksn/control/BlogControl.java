package group.first.iksn.control;

import group.first.iksn.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
