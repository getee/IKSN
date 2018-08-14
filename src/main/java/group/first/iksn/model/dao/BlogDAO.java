package group.first.iksn.model.dao;



import group.first.iksn.model.bean.Blog;

import group.first.iksn.model.bean.BlogBrowsed;
import group.first.iksn.model.bean.IllegalBlog;

import java.util.List;


import java.util.ArrayList;

public interface BlogDAO {
    public List<Blog> detailedBlogSearchResultMap(String s);

    List<Blog> detailedBlogPush();



    //处理添加博客dao
    public  boolean processAddBlog(Blog blog);

    boolean addIllegalblog(IllegalBlog blog);
    List<IllegalBlog> getAllReportBlog();
}
