package group.first.iksn.service;

import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.IllegalBlog;
import group.first.iksn.model.bean.ReportBlog;

import java.util.List;
import group.first.iksn.model.bean.BlogTag;
import group.first.iksn.model.bean.UserToBlog;

import java.util.Map;

public interface BlogService {

    boolean deleteIllegalblog(IllegalBlog blog);
    boolean sendBackIllegalblog(IllegalBlog blog);

    //添加Blog的服务层
    List<ReportBlog> getAllReportBlog();
    boolean Reject_oneReportblog(ReportBlog blog);
    public boolean addBlogService(Blog blog);
    //添加BlogTag的服务层
    public boolean addBlogTagService(BlogTag blogTag);
    //添加UserToBlog的服务层
    public  boolean addUserToBlogService(UserToBlog userToBlog);

    public List<Blog> scanBlogService(int bid);

    //举报博客
    public boolean reportBlog(ReportBlog reportBlog);
}
