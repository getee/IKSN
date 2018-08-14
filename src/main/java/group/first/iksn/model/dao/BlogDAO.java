package group.first.iksn.model.dao;



import group.first.iksn.model.bean.*;

import java.util.List;


import java.util.ArrayList;


public interface BlogDAO {
    public List<Blog> detailedBlogSearchResultMap(String s);

    List<Blog> detailedBlogPush();



    //处理添加博客dao
    public  boolean processAddBlog(Blog blog);
    //处理添加博客标签dao
    public boolean processAddBlogTag(BlogTag blogTag);
    //处理添加UserToBlog的dao
    public boolean processAddUserToBlog(UserToBlog userToBlog);

    //添加下架博客
    //根据uid来查询Blog
    public List<Blog> processScanBlog(int uid);
    //根据bid来查询Blog
    public Blog processListBlog(int bid);
    //查询bid
    public int  selectBid(String time);

    boolean addIllegalblog(IllegalBlog blog);
    //获取所有被举报博客
    List<ReportBlog> getAllReportBlog();

    boolean commentBlog(BlogComments blogComments);
    //获取所有被举报资源
    List<ReportResource> getAllReportResource();
    //删除Reportblog表数据
    boolean deleteBlogFromReport(int report_id);
    //删除博客
    boolean deleteBlog(int bid);
    //删除与博客相关的表信息
    boolean deleteBlogOthers(int bid);
    //设置博客为不公开
    boolean blogIsPublic(int bid);

    boolean answerDiscuss(BlogComments blogComments);
}
