package group.first.iksn.service;

import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.BlogBrowsed;
import group.first.iksn.model.bean.IllegalBlog;

import java.util.List;
import group.first.iksn.model.bean.SearchBlog;

import java.util.ArrayList;

public interface BlogService {

    boolean deleteIllegalblog(IllegalBlog blog);
    boolean sendBackIllegalblog(IllegalBlog blog);
    List<IllegalBlog> getAllReportBlog();

    public boolean addBlogService(Blog blog);

    List<Blog> detailedBlogSearchResultMap(String s);
    List<Blog> detailedBlogPush();
}
