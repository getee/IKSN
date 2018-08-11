package group.first.iksn.model.dao;


import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.IllegalBlog;

import java.util.List;
import group.first.iksn.model.bean.BlogTag;
import group.first.iksn.model.bean.UserToBlog;



public interface BlogDAO {
    public String detailedBlogSearchResultMap();

    //处理添加博客dao
    public  boolean processAddBlog(Blog blog);
    //处理添加博客标签dao
    public boolean processAddBlogTag(BlogTag blogTag);
    //处理添加UserToBlog的dao
    public boolean processAddUserToBlog(UserToBlog userToBlog);

    public List<Blog> processScanBlog(int bid);

    boolean addIllegalblog(IllegalBlog blog);
    List<IllegalBlog> getAllReportBlog();
}
