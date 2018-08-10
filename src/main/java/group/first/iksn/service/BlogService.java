package group.first.iksn.service;

import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.IllegalBlog;

import java.util.List;

public interface BlogService {

    boolean deleteIllegalblog(IllegalBlog blog);
    boolean sendBackIllegalblog(IllegalBlog blog);
    List<IllegalBlog> getAllReportBlog();

    public boolean addBlogService(Blog blog);
}
