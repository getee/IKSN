package group.first.iksn.service;


import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.dao.BlogDAO;
import org.springframework.stereotype.Component;

@Component("blogService")
public class BlogServiceImp implements BlogService {
    private BlogDAO blogDAO;

    public BlogDAO getBlogDAO() {
        return blogDAO;
    }

    public void setBlogDAO(BlogDAO blogDAO) {
        this.blogDAO = blogDAO;
    }

    /**
     *
     * @return
     */
    public String deleteIllegalblog() {
        return null;
    }



    @Override
    public boolean addBlogService(Blog blog) {
        return blogDAO.processAddBlog(blog);
    }
}
