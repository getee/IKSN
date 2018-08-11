package group.first.iksn.model.dao;


import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.IllegalBlog;
import group.first.iksn.model.bean.ReportBlog;

import java.util.List;

public interface BlogDAO {
    public String detailedBlogSearchResultMap();

    //处理添加博客dao
    public  boolean processAddBlog(Blog blog);

    boolean addIllegalblog(IllegalBlog blog);
    List<ReportBlog> getAllReportBlog();
    boolean deleteBlogFromReport(ReportBlog blog);
}
