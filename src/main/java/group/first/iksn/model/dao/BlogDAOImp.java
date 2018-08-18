package group.first.iksn.model.dao;

import group.first.iksn.model.bean.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.rmi.server.UID;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component("blogDAO")
public class BlogDAOImp extends BaseDAOImp implements BlogDAO {
    /**
     * 博客搜索
     * @param s
     * @return
     */
    public List<Blog> detailedBlogSearchResultMap(String s) {
        List<Blog> b=getSqlSession().getMapper(BlogDAO.class).detailedBlogSearchResultMap(s);
        return b;
    }

    @Override
    public List<Blog> blogClassify(String s) {
        List<Blog> b=getSqlSession().getMapper(BlogDAO.class).blogClassify(s);
        return b;
    }

    @Override
    public List<Blog> blogTitle(String s) {
        List<Blog> b=getSqlSession().getMapper(BlogDAO.class).blogTitle(s);
        return b;
    }

    @Override
    public  List<String> ajaxBlogMohuSearch() {
        List<String> a=getSqlSession().getMapper(BlogDAO.class).ajaxBlogMohuSearch();
        return a ;
    }


    /**
     * 首页推送
     * @return
     */
    @Override
    public List<Blog> detailedBlogPush(int page) {
        List<Blog> b=getSqlSession().getMapper(BlogDAO.class).detailedBlogPush(page);
        return b;
    }

    public List<Blog> pointsPush(){
        List<Blog> b=getSqlSession().getMapper(BlogDAO.class).pointsPush();
        return b;

    }

    @Override
    public List<Blog> browsedPush(int classify) {
        List<Blog> b=getSqlSession().getMapper(BlogDAO.class).browsedPush(classify);
        return b;
    }

    /**
     * 首页ajax推送
     * @param page
     * @return
     */
    @Override
    public List<Blog> ajaxBlogPush(int page) {
        List<Blog> b=getSqlSession().getMapper(BlogDAO.class).ajaxBlogPush(page);
        return b;
    }


    @Override
    public boolean processAddBlog(Blog blog) {
        boolean result= getSqlSession().getMapper(BlogDAO.class).processAddBlog(blog);
        return result;
    }

    /**
     * 向Illegalblog表添加一个对象
     * wenbin
     * @param blog
     * @return
     */
    @Override
    public boolean addIllegalblog(IllegalBlog blog) {
        boolean isOK=false;
        try{
            isOK=getSqlSession().getMapper(BlogDAO.class).addIllegalblog(blog);
            isOK=true;
        }catch (Exception e){
            System.out.println("这是添加违规博客出错了");
            e.printStackTrace();
        }
        return isOK;
    }

    /**
     * 获取违规表的所有行（此处应该获取举报表的，后续更改）
     * wenbin
     * @return
     */
    @Override
    public List<ReportBlog> getAllReportBlog(int page) {
        List<ReportBlog> allReportBlog=null;
        try {
            allReportBlog=getSqlSession().getMapper(BlogDAO.class).getAllReportBlog((page-1)*3);
            System.out.println("22222");
        }catch (Exception e){
            System.out.println("这是获取违规博客出错了");
            e.printStackTrace();
        }
        return allReportBlog;
    }

    /**
     * 获取所有被举报资源
     * wenbin
     * @return
     */
    @Override
    public List<ReportResource> getAllReportResource() {
        List<ReportResource> allReportResource=null;
        try {
            allReportResource=getSqlSession().getMapper(BlogDAO.class).getAllReportResource();
            System.out.println("获取举报资源成功");
        }catch (Exception e){
            System.out.println("这是获取违规资源出错了");
            e.printStackTrace();
        }
        return allReportResource;
    }

    @Override
    public boolean processAddBlogTag(BlogTag blogTag) {
        boolean result= getSqlSession().getMapper(BlogDAO.class).processAddBlogTag(blogTag);
        return result;
    }

    @Override
    public boolean processAddUserToBlog(UserToBlog userToBlog) {
        boolean result= getSqlSession().getMapper(BlogDAO.class).processAddUserToBlog(userToBlog);
        return result;
    }

    @Override
    public List<Blog> processScanBlog(int uid) {
        List<Blog> blog= getSqlSession().getMapper(BlogDAO.class).processScanBlog(uid);
        return blog;
    }

    @Override
    public List<Blog> processScanReportedBlog(int uid) {
        return getSqlSession().getMapper(BlogDAO.class).processScanReportedBlog(uid);
    }

    @Override
    public List<Blog> processScanSimiBlog(int uid) {
        return getSqlSession().getMapper(BlogDAO.class).processScanSimiBlog(uid);
    }

    @Override
    public List<Blog> processScanDraftBlog(int uid) {
        return getSqlSession().getMapper(BlogDAO.class).processScanDraftBlog(uid);
    }

    @Override
    public Blog processListBlog(int bid) {
        Blog blog= getSqlSession().getMapper(BlogDAO.class).processListBlog(bid);
        return blog;
    }


    @Override
    public int selectBid(String time) {
        return getSqlSession().getMapper(BlogDAO.class).selectBid(time);
    }

    @Override
    public boolean processUpdateBlog(Blog blog) {
        return getSqlSession().getMapper(BlogDAO.class).processUpdateBlog(blog);
    }

    @Override
    public boolean processUpdateBlogtag(BlogTag blogTag) {
        return getSqlSession().getMapper(BlogDAO.class).processUpdateBlogtag(blogTag);
    }

    @Override
    public boolean processUpdateUserToBlog(UserToBlog userToBlog) {
        return getSqlSession().getMapper(BlogDAO.class).processUpdateUserToBlog(userToBlog);
    }


    /**
     * 从reportBlog表中删除一个选中行
     * wenbin
     * @param bid
     * @return
     */
    @Override
    public boolean deleteBlogFromReport(int bid) {
        boolean isOK=false;
        try{
            isOK=getSqlSession().getMapper(BlogDAO.class).deleteBlogFromReport(bid);
        }catch (Exception e){
            System.out.println("这是添加违规博客出错了");
            e.printStackTrace();
        }
        return isOK;
    }
//博客评论
    @Override
    public boolean commentBlog(BlogComments blogComments) {
        System.out.println(blogComments);
        return  getSqlSession().getMapper(BlogDAO.class).commentBlog(blogComments);
    }
//博客评论回复
    @Override
    public boolean answerDiscuss(BlogComments blogComments) {
        System.out.println(blogComments);
        return getSqlSession().getMapper(BlogDAO.class).answerDiscuss(blogComments);
    }
//获取楼层
    @Override
    public String selectFloor(Integer bid) {
        return getSqlSession().getMapper(BlogDAO.class).selectFloor(bid);
    }
//获取评论
    @Override
    public ArrayList<BlogComments> getComments(Integer bid) {
        return getSqlSession().getMapper(BlogDAO.class).getComments(bid);
    }

    @Override

    public Blog selectLinkByBid(int bid) {
        Blog blog=null;
        try {
            blog=getSqlSession().getMapper(BlogDAO.class).selectLinkByBid(bid);
        }catch (Exception e){ e.printStackTrace(); }
        return blog;
    }

    @Override
    public boolean updateLink(String numLink, int bid) {
        boolean isOk=false;
        try {
            isOk=getSqlSession().getMapper(BlogDAO.class).updateLink(numLink,bid);
        }catch (Exception e){e.printStackTrace();}
        return isOk;
    }

    @Override
    public int reportBlogNum() {
        int num=0;
        try {
            num=getSqlSession().getMapper(BlogDAO.class).reportBlogNum();
        }catch (Exception e){
            System.out.println("reportBlogNum这时获取num出错了");
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public UserToBlog getUserIsSpeak(int bid) {
        UserToBlog userToBlog=null;
        try{
            userToBlog=getSqlSession().getMapper(BlogDAO.class).getUserIsSpeak(bid);
        }catch (Exception e){
            System.out.println("getUserIsSpeak这是获取isSpeak出错了");
            e.printStackTrace();
        }
        return userToBlog;
    }

    @Override
    public boolean shutUptoUser(User user){
        boolean isOK=false;
        System.out.println(user);
        try{
            isOK=getSqlSession().getMapper(BlogDAO.class).shutUptoUser(user);
        }catch (Exception e){
            System.out.println("shutUptoUser这是设置禁言出错了");
            e.printStackTrace();
        }
        return isOK;
    }

    @Override
    public UserToBlog selectUidByBid(int bid) {
        UserToBlog userToBlog=null;
        try{
            userToBlog=getSqlSession().getMapper(BlogDAO.class).selectUidByBid(bid);
        }catch (Exception e){
            System.out.println("selectUidByBid这是获取uid出错了");
            e.printStackTrace();
        }
        return userToBlog;
    }

    /**
     * 删除博客
     * wenbin
     * @param bid
     * @return
     */
    @Override
    public boolean deleteBlog(int bid) {
        boolean isOK=false;
        System.out.println(bid);
        try{
            isOK=getSqlSession().getMapper(BlogDAO.class).deleteBlog(bid);
        }catch (Exception e){
            System.out.println("这是删除博客出错了");
            e.printStackTrace();
        }
        return isOK;
    }

    @Override
    public boolean deleteBlogOthers(int bid) {
        boolean isOK=false;
        try{
            isOK=getSqlSession().getMapper(BlogDAO.class).deleteBlogOthers(bid);
        }catch (Exception e){
            System.out.println("这是删除博客其它出错了");
            e.printStackTrace();
        }
        return isOK;
    }

    @Override
    public boolean deleteBlogOther(int bid) {
        return getSqlSession().getMapper(BlogDAO.class).deleteBlogOther(bid);
    }

    @Override
    public boolean blogIsPublic(int bid) {
        boolean isOK=false;
        try{
            isOK=getSqlSession().getMapper(BlogDAO.class).blogIsPublic(bid);
        }catch (Exception e){
            System.out.println("这是更改博客不公开出错了");
            e.printStackTrace();
        }
        return isOK;
    }

    /**
     * 把前台举报的博客保存到数据库中
     * @param reportBlog
     * @return
     */
    @Override
    public boolean reportBlog(ReportBlog reportBlog) {
        boolean result=getSqlSession().getMapper(BlogDAO.class).reportBlog(reportBlog);
        return result;
    }
    //点击打开博客
    public  List<UserToBlog> getBlogAndUser(int bid){
        return getSqlSession().getMapper(BlogDAO.class).getBlogAndUser(bid);
    }
    //获得原创博客数
    @Override
    public int getOriginalBlog(int uid) {
        try{
            return getSqlSession().getMapper(BlogDAO.class).getOriginalBlog(uid);
        }
        catch (Exception e){
            return 0;
        }

    }
    //获得粉丝数
    @Override
    public int getFans(int uid) {
        try{
            return getSqlSession().getMapper(BlogDAO.class).getFans(uid);
        }
        catch (Exception e){
            return 0;
        }

    }
    //获得关注数
    @Override
    public int getAttention(int uid) {
        try{
          int  n=getSqlSession().getMapper(BlogDAO.class).getAttention(uid);
            return n;
        }catch (Exception e){
            return 0;
        }

    }
    //根据id查询博客
    public Blog getbokeByid(int bid){
        return getSqlSession().getMapper(BlogDAO.class).getbokeByid(bid);
    }
    public  boolean addBlogPoints(int bid){
        return getSqlSession().getMapper(BlogDAO.class).addBlogPoints(bid);
    }

    //收藏博客方法
    @Override
    public boolean collectBlog(@Param("uid") int uid, @Param("bid") int bid) {
        return getSqlSession().getMapper(BlogDAO.class).collectBlog(uid,bid);
    }
    //添加关注
    @Override
    public boolean addAttention(@Param("selfid")int selfid,@Param("attenid") int attenid) {
        return getSqlSession().getMapper(BlogDAO.class).addAttention(selfid,attenid);
    }

    @Override
    public Attention checkIsAttention(@Param("selfid")int selfid,@Param("attenid") int attenid) {
        return getSqlSession().getMapper(BlogDAO.class).checkIsAttention(selfid, attenid);
    }

    @Override
    public boolean deleteAttention(@Param("selfid")int selfid,@Param("attenid") int attenid) {
        return  getSqlSession().getMapper(BlogDAO.class).deleteAttention(selfid,attenid);
    }

    @Override
    public boolean insertBlogBrowse(@Param("uid") int uid, @Param("bid") int bid, @Param("browsetime") String browsetime) {
        return getSqlSession().getMapper(BlogDAO.class).insertBlogBrowse(uid,bid,browsetime);
    }

    @Override
    public List<Blog> selectTwoBlogByUser(int uid) {
        return getSqlSession().getMapper(BlogDAO.class).selectTwoBlogByUser(uid);
    }

    @Override
    public ReportBlog selectReportBlog(int id) {
        ReportBlog reportBlog=getSqlSession().getMapper(BlogDAO.class).selectReportBlog(id);
        return reportBlog;
    }



    //我收藏的博客
    @Override
    public List<Blog> myCollectBlog(int uid) {
        List<Blog> collectblog=getSqlSession().getMapper(BlogDAO.class).myCollectBlog(uid);
        return collectblog;

    }

    //我发布的博客
    @Override
    public List<Blog> myBlog(int uid) {
        return getSqlSession().getMapper(BlogDAO.class).myBlog(uid);
    }
}
