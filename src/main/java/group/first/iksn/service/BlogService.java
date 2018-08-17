package group.first.iksn.service;

import group.first.iksn.model.bean.*;

import java.util.List;
import group.first.iksn.model.bean.SearchBlog;

import java.util.ArrayList;

import java.util.Map;

public interface BlogService {
    //删除违规博客
    boolean deleteIllegalblog(int Blog_id,int  report_id);
    //下架违规博客
    boolean sendBackIllegalblog(IllegalBlog blog,int report_id);

    //添加mGetAllReportBlog的服务层
    List<ReportBlog> getAllReportBlog();
    //添加mGetAllReportResource的服务层
    List<ReportResource> getAllReportResource();
    //回违规博客，处理违规博客的安置
    boolean Reject_oneReportblog(int report_id);
    //添加Blog的服务层
    public boolean addBlogService(Blog blog);

    List<Blog> detailedBlogSearchResultMap(String s);
    List<Blog> detailedBlogPush();
    //添加BlogTag的服务层
    public boolean addBlogTagService(BlogTag blogTag);
    //添加UserToBlog的服务层
    public  boolean addUserToBlogService(UserToBlog userToBlog);

    boolean discuss(BlogComments blogComments);

    boolean answerComment(BlogComments blogComments);
    //根据用户ID查询博客的服务层
    public List<Blog> scanBlogService(int uid);
    //查询已发表的博客
    public  List<Blog> scanReportedBlogService(int uid);
    //查询私密的博客
    public  List<Blog> scanSimiBlogService(int uid);
    //查询草稿的博客
    public  List<Blog> scanDraftBlogService(int uid);
    //根据博客ID查询博客的服务层
    public Blog listBlogService(int bid);
    //根据添加时间查询Bid
    public int selectBidService(String time);
    //修改博客Blog的服务层
    public  boolean updateBlogService(Blog blog);
    //修改BlogTag的服务层
    public  boolean updateBlogTagService(BlogTag blogTag);
    //修改UserToBlog的服务层
    public  boolean updateUserToBlogService(UserToBlog userToBlog);

    public  boolean deleteBlogOther(int bid);

    public boolean deleteBlog(int bid);



    //举报博客
    public boolean reportBlog(ReportBlog reportBlog);
}
