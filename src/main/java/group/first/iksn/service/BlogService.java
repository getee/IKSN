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
    boolean sendBackIllegalblog(IllegalBlog blog,int report_id,int uid);

    //添加mGetAllReportBlog的服务层
    List<ReportBlog> getAllReportBlog(int page);
    //添加mGetAllReportResource的服务层
    List<ReportResource> getAllReportResource();
    //回违规博客，处理违规博客的安置
    boolean Reject_oneReportblog(int report_id);
    //添加Blog的服务层
    public boolean addBlogService(Blog blog);


    //搜索博客
    List<Blog> detailedBlogSearchResultMap(String s);
    List<Blog> blogClassify(String s);
    List<Blog> blogTitle(String s);
    List<String> ajaxBlogMohuSearch();
    //首页博客推送
    List<Blog> detailedBlogPush(int page);
    List<Blog> pointsPush();
    List<Blog> browsedPush(int classify);
    //ajax推送首页
    public List<Blog> ajaxBlogPush(int page);


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
    //获取被举报的博客
    ReportBlog selectReportBlog(int id);

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
    //被举报博客的数量
    int getReportBlogNum();

    // 我收藏的所有博客
    List<Blog> myCollectBlog(int uid);
    //我发布的博客
    List<Blog> myBlog(int uid);

    ArrayList<BlogComments> getComments(Integer bid);
}
