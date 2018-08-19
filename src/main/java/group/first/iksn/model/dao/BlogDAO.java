package group.first.iksn.model.dao;


import group.first.iksn.model.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.ArrayList;


public interface BlogDAO {
    //搜索博客
    public List<Blog> detailedBlogSearchResultMap(String s);
    List<Blog> blogClassify(int s);
    List<Blog> blogTitle(String s);
    List<String> ajaxBlogMohuSearch();

    //博客首页推送
    List<Blog> detailedBlogPush(int page);
    List<Blog> pointsPush();
    List<Blog> browsedPush(int classify);
    //ajax分页推送
    List<Blog> ajaxBlogPush(int page);
    //首页博客分类推送
    List<Blog> classifyPush(int classify,int page);
    //首页今日推荐
    List<Blog> newBlogPush();



    //处理添加博客dao
    public  boolean processAddBlog(Blog blog);
    //处理添加博客标签dao
    public boolean processAddBlogTag(BlogTag blogTag);
    //处理添加UserToBlog的dao
    public boolean processAddUserToBlog(UserToBlog userToBlog);

    //添加下架博客
    //根据uid来查询Blog
    public List<Blog> processScanBlog(int uid);
    //查询已经发表的博客
    public List<Blog> processScanReportedBlog(int uid);
    //查询私密个人的博客
    public List<Blog> processScanSimiBlog(int uid);
    //查询草稿的博客
    public List<Blog> processScanDraftBlog(int uid);
    //根据bid来查询Blog
    public Blog processListBlog(int bid);
    //查询bid
    public int  selectBid(String time);
    //修改博客
    public  boolean processUpdateBlog(Blog blog);
    //修改博客标签
    public  boolean processUpdateBlogtag(BlogTag blogTag);
    //修改UserToBlog
    public  boolean processUpdateUserToBlog(UserToBlog userToBlog);


    boolean addIllegalblog(IllegalBlog blog);
    //获取所有被举报博客
    List<ReportBlog> getAllReportBlog(int page);

    boolean commentBlog(BlogComments blogComments);
    //获取所有被举报资源
    List<ReportResource> getAllReportResource();
    //删除Reportblog多个表数据
    boolean deleteBlogFromReport(int bid);
    //删除Reportblog一个表数据
    boolean deleteOneReportBlog(int report_id);
    //删除博客
    boolean deleteBlog(int bid);
    //删除与博客相关的表信息
    boolean deleteBlogOthers(int bid);
    boolean deleteBlogOther(int bid);
    //设置博客为不公开
    boolean blogIsPublic(int bid);

    boolean answerDiscuss(BlogComments blogComments);

    //举报博客
    public boolean reportBlog(ReportBlog reportBlog);
    //获取被举报博客
    ReportBlog selectReportBlog(int id);

    String selectFloor(Integer bid);
    //被举报的博客数量
    int reportBlogNum();
    //查看user是否被禁言
    UserToBlog getUserIsSpeak(int bid);
    //设置禁言
    boolean shutUptoUser(User user);
    //我收藏的博客
    List<Blog> myCollectBlog(int uid);
    //我发布的博客
    List<Blog> myBlog(int uid);

    //点击打开博客使用
    List<UserToBlog> getBlogAndUser(int bid);
    int getOriginalBlog(int uid);
    int getFans(int uid);
    int getAttention(int uid);
    Blog getbokeByid(int bid);
    boolean addBlogPoints(int bid);
    boolean collectBlog(int uid,int bid);
    boolean addAttention(int selfid,int attenid);
    Attention checkIsAttention(int selfid,int attenid);
    boolean deleteAttention(int selfid,int attenid);
    boolean insertBlogBrowse(int uid,int bid,String browsetime);
    List<Blog> selectTwoBlogByUser(int uid);
    //根据bid查uid
    UserToBlog selectUidByBid(int bid);

    ArrayList<BlogComments> getComments(Integer bid);

    //根据bid查询link
    Blog selectLinkByBid(int bid);
    //对blog.link加一
    boolean updateLink(String numLink,int bid);
    //查询他人发布的所有博客
    List<Blog> allPublishedBlog(int uid);
}
