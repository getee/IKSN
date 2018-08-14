package group.first.iksn.model.dao;


import group.first.iksn.model.bean.*;

import java.util.List;


public interface BlogDAO {
    public String detailedBlogSearchResultMap();

    //处理添加博客dao
    public  boolean processAddBlog(Blog blog);
    //处理添加博客标签dao
    public boolean processAddBlogTag(BlogTag blogTag);
    //处理添加UserToBlog的dao
    public boolean processAddUserToBlog(UserToBlog userToBlog);

    public List<Blog> processScanBlog(int bid);
    //添加下架博客
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

    //举报博客
    public boolean reportBlog(ReportBlog reportBlog);
}
