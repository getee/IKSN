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
    public List<Blog> scanBlogService(int uid);

    public Blog listBlogService(int bid);

    public int selectBidService(String time);



    //举报博客
    public boolean reportBlog(ReportBlog reportBlog);

    //处理点击标题进入博客详情页的方法
    public Map<String,Object>getBlogAndUser(int bid);
    //获得原创博客数
    public int getOriginalBlog(int uid);
    //获得粉丝数
    public int getFans(int uid) ;
    //    //获得关注数
    public int getAttention(int uid);
    //增加点赞数
    public  boolean addBlogPoints(int bid);
    //收藏博客
    public  boolean collectBlog(int uid,int bid);
    //添加关注
    public boolean addAttention(int selfid, int attenid);
    //检查是否关注
    public  Attention checkIsAttention(int selfid, int attenid);
    //取消关注
    public boolean deleteAttention(int selfid, int attenid);
    //博客页面取两个最近的博客推送
    public  List<Blog> selectTwoBlogByUser(int uid);
    //存入浏览记录
    public  boolean insertBlogBrowse(int uid, int bid, String browsetime);
    String getFloor(Integer bid);

}
