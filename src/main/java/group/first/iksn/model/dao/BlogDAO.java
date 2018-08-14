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

    boolean addIllegalblog(IllegalBlog blog);
    List<ReportBlog> getAllReportBlog();
    boolean deleteBlogFromReport(ReportBlog blog);

    boolean commentBlog(BlogComments blogComments);

    //举报博客
    public boolean reportBlog(ReportBlog reportBlog);
}
