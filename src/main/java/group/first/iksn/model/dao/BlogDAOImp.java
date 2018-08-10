package group.first.iksn.model.dao;

import group.first.iksn.model.bean.Blog;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("blogDAO")
public class BlogDAOImp extends BaseDAOImp implements BlogDAO {
    public String detailedBlogSearchResultMap() {
        return null;
    }


    @Override
    public boolean processAddBlog(Blog blog) {
        boolean result= getSqlSession().getMapper(BlogDAO.class).processAddBlog(blog);
        return result;
    }
}
