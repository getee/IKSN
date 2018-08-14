package group.first.iksn.model.dao;


import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.IllegalBlog;
import group.first.iksn.model.bean.ReportBlog;

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
    //根据uid来查询Blog
    public List<Blog> processScanBlog(int uid);
    //根据bid来查询Blog
    public Blog processListBlog(int bid);
    //查询bid
    public int  selectBid(String time);

    boolean addIllegalblog(IllegalBlog blog);
    List<ReportBlog> getAllReportBlog();
    boolean deleteBlogFromReport(ReportBlog blog);
}
