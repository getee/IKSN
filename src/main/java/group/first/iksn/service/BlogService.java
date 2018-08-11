package group.first.iksn.service;

import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.IllegalBlog;
import group.first.iksn.model.bean.ReportBlog;

import java.util.List;

public interface BlogService {

    boolean deleteIllegalblog(IllegalBlog blog);
    boolean sendBackIllegalblog(IllegalBlog blog);
    List<ReportBlog> getAllReportBlog();
    boolean Reject_oneReportblog(ReportBlog blog);
    public boolean addBlogService(Blog blog);
}
