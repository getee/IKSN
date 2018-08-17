package group.first.iksn.service;


import group.first.iksn.model.bean.*;
import group.first.iksn.model.dao.BlogDAO;
import group.first.iksn.model.dao.UserDAO;
import group.first.iksn.util.LocalTime;
import group.first.iksn.model.dao.UserDAO;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;


@Component("blogService")
public class BlogServiceImp implements BlogService {
    private BlogDAO blogDAO;
    private UserDAO userDAO;

    public UserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public BlogDAO getBlogDAO() {
        return blogDAO;
    }

    public void setBlogDAO(BlogDAO blogDAO) {
        this.blogDAO = blogDAO;
    }

    /**
     * 删除违规博客
     * wenbin
     * @param blog_id
     * @param report_id
     * @return
     */
    @Override
    public boolean deleteIllegalblog(int blog_id,int  report_id) {
        boolean result=false;
        UserToBlog utd=blogDAO.selectUidByBid(blog_id);
        //先删除跟blog表有关的表数据
        boolean deleteResult=blogDAO.deleteBlogOthers(blog_id);
        System.out.println(blog_id);
        if(deleteResult){
            //再删除blog表数据
            result=blogDAO.deleteBlog(blog_id);
            //封装notice
            Notice notice=new Notice();
            notice.setUid(utd.getUid());
            notice.setContent("您有一个违规博客，已被删除！！");
            String time=LocalTime.getNowTime();
            notice.setTime(time);
            userDAO.addNotice(notice);
            //下午写通知----------------userDao.addNotice

        }
        System.out.println("删除blog其他"+deleteResult);
        return result;
    }

    /**
     * 退回违规博客，处理违规博客的安置
     * wenbin
     * @return
     */
    @Override
    public boolean sendBackIllegalblog(IllegalBlog blog,int report_id,int uid) {
        //开启一个线程，去执行禁言任务
            Shutup shutup=new Shutup(blog.getBid());
            shutup.start();
        //封装notice(通知)
        String time=LocalTime.getNowTime();
        System.out.println("---"+time);
        Notice notice=new Notice();
        notice.setUid(uid);
        notice.setContent("您有一个违规博客，已被下架");
        notice.setTime(time);

        boolean sendBack=blogDAO.addIllegalblog(blog);
        if (sendBack){
            //插入illegalblog成功，将reportblog表对应数据删除
            blogDAO.deleteBlogFromReport(report_id);
            //设置博客为不可见
            boolean b=blogDAO.blogIsPublic(blog.getBid());
            //添加通知
            userDAO.addNotice(notice);
        }
        return sendBack;
    }



    /**
     * 获取被举报的博客
     * wenbin
     * @return
     */
    @Override
    public List<ReportBlog> getAllReportBlog(int page) {
        return blogDAO.getAllReportBlog(page);
    }

    @Override
    public List<ReportResource> getAllReportResource() {
        return blogDAO.getAllReportResource();
    }

    /**
     * 驳回被举报的博客，（将博客去除被举报标记）
     * @param report_id
     * @return
     */
    @Override
    public boolean Reject_oneReportblog(int report_id) {
        return blogDAO.deleteBlogFromReport(report_id);
    }

    /**
     * 搜索资源的方法
     * @param
     * @return
     */
    public List<Blog> detailedBlogSearchResultMap(String s){

        return  blogDAO.detailedBlogSearchResultMap(s);
    }

    @Override
    public List<Blog> blogClassify(String s) {
        return  blogDAO.blogClassify(s);
    }

    @Override
    public List<Blog> blogTitle(String s) {
        /*String[] keyword=s.split("\\s+");*/

        return  blogDAO.blogTitle(s);
    }

    @Override
    public  List<String> ajaxBlogMohuSearch() {
        return blogDAO.ajaxBlogMohuSearch() ;
    }

    /**
     * 首页推送的方法
     * @return
     */
    @Override
    public List<Blog> detailedBlogPush(int page) {
        return blogDAO.detailedBlogPush(page);
    }
    public List<Blog> pointsPush(){ return blogDAO.pointsPush();}

    @Override
    public List<Blog> browsedPush(int classify) {
        return blogDAO.browsedPush(classify);
    }

    /**
     *
     * @param
     * @return
     */
   public List<Blog> ajaxBlogPush(int page){return blogDAO.ajaxBlogPush(page);}

    @Override
    public boolean addBlogService(Blog blog) {
        return blogDAO.processAddBlog(blog);
    }

    @Override
    public boolean addBlogTagService(BlogTag blogTag) {
        return blogDAO.processAddBlogTag(blogTag);
    }

    @Override
    public boolean addUserToBlogService(UserToBlog userToBlog) {
        return blogDAO.processAddUserToBlog(userToBlog);
    }

    @Override
    public List<Blog> scanBlogService(int uid) {
        return blogDAO.processScanBlog(uid);
    }

    @Override
    public List<Blog> scanReportedBlogService(int uid) {
        return blogDAO.processScanReportedBlog(uid);
    }

    @Override
    public List<Blog> scanSimiBlogService(int uid) {
        return blogDAO.processScanSimiBlog(uid);
    }

    @Override
    public List<Blog> scanDraftBlogService(int uid) {
        return blogDAO.processScanDraftBlog(uid);
    }

    @Override
    public Blog listBlogService(int bid) {
        return blogDAO.processListBlog(bid);
    }

    @Override
    public int selectBidService(String time) {
        return blogDAO.selectBid(time);
    }

    @Override
    public boolean updateBlogService(Blog blog) {
        return blogDAO.processUpdateBlog(blog);
    }

    @Override
    public boolean updateBlogTagService(BlogTag blogTag) {
        return blogDAO.processUpdateBlogtag(blogTag);
    }

    @Override
    public boolean updateUserToBlogService(UserToBlog userToBlog) {
        return blogDAO.processUpdateUserToBlog(userToBlog);
    }

    @Override
    public boolean deleteBlogOther(int bid) {
        boolean result=false;
        //boolean deleteResult=blogDAO.deleteBlog(blog_id);
        boolean deleteResult=blogDAO.deleteBlogOther(bid);
        System.out.println(bid);
        if(deleteResult){
            result=blogDAO.deleteBlog(bid);
        }
        System.out.println("删除blog其他"+deleteResult);
        return result;
    }

    @Override
    public boolean deleteBlog(int bid) {
        return blogDAO.deleteBlog(bid);
    }

    @Override
    public boolean discuss(BlogComments blogComments) {
        System.out.println(blogComments);
        return blogDAO.commentBlog(blogComments);
    }

    @Override
    public boolean answerComment(BlogComments blogComments) {
        System.out.println(blogComments);
        return blogDAO.answerDiscuss(blogComments);
    }

    //举报博客
    @Override
    public boolean reportBlog(ReportBlog reportBlog) {
        boolean serviceResult=blogDAO.reportBlog(reportBlog);
        return serviceResult;
    }
    //获取被举报的博客
    @Override
    public ReportBlog selectReportBlog(int id) {
        return blogDAO.selectReportBlog(id);
    }

    @Override
    public String getFloor(Integer bid) {
        return blogDAO.selectFloor(bid);
    }

    @Override
    public int getReportBlogNum() {
        return blogDAO.reportBlogNum();
    }

    /**
     * 开启一个线程对user禁言
     * sendBackIllegalblog方法中调用
     */
    class Shutup extends Thread{
        int id;
        private Shutup(int id){
            this.id=id;
        }

        @Override
        public void run() {
            System.out.println("小样进线程了"+id);
            User user=new User();

            //禁言截止时间
            Calendar curr = Calendar.getInstance();
            curr.set(Calendar.DAY_OF_MONTH,curr.get(Calendar.DAY_OF_MONTH)+7);
            Date date=curr.getTime();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time=df.format(date);

            //根据bid查user
            UserToBlog utb=blogDAO.getUserIsSpeak(id);
            int isSpeak=utb.getUser().getIsspeak();
            int uid=utb.getUid();
            //封装notice(通知)
            String nowtime=LocalTime.getNowTime();
            Notice notice=new Notice();
            notice.setUid(uid);
            notice.setContent("由于您违规发表博客，以对您实施禁言！！截止："+time);
            notice.setTime(nowtime);
            //封装user
            user.setUid(uid);
            user.setTimeofban(time);
            System.out.println("禁言的uid"+uid);
            //对user实施禁言
            if(isSpeak==0){
                boolean a=blogDAO.shutUptoUser(user);
                userDAO.addNotice(notice);
                System.out.println("禁言"+a);
            }else {
                System.out.println("该用户已经被禁言");
            }
        }
    }

    // 我收藏的所有博客
    @Override
    public List<Blog> myCollectBlog(int uid) {
        return blogDAO.myCollectBlog(uid);
    }

    //我发布的博客
    @Override
    public List<Blog> myBlog(int uid) {
        return blogDAO.myBlog(uid);
    }


    //处理点击标题进入博客详情页的方法
    public Map<String,Object> getBlogAndUser(int bid){
        Map<String,Object> map=new HashMap<String, Object>();
        //取页面博客
        Blog blog=blogDAO.getbokeByid(bid);

        List<UserToBlog> l=blogDAO.getBlogAndUser(bid);
        UserToBlog ub=l.get(0);
        User user=userDAO.getId(ub.getUid());

        map.put("boke",blog);
        map.put("yonghu",user);
        map.put("original",getOriginalBlog(user.getUid()));
        map.put("fans",getFans(user.getUid()));
        map.put("attention",getAttention(user.getUid()));

        return  map;
    }

    @Override
    public int getOriginalBlog(int uid) {
        return blogDAO.getOriginalBlog(uid);
    }

    @Override
    public int getFans(int uid) {
        return blogDAO.getFans(uid);
    }

    @Override
    public int getAttention(int uid) {
        return blogDAO.getAttention(uid);
    }

    @Override
    public boolean addBlogPoints(int bid){
        return blogDAO.addBlogPoints(bid);
    }

    @Override
    public boolean collectBlog(int uid, int bid) {
        return blogDAO.collectBlog(uid,bid);
    }
    @Override
    public ArrayList<BlogComments> getComments(Integer bid) {
        ArrayList<BlogComments> keys=blogDAO.getComments(bid);
        System.out.println("KKKK"+keys);
        return keys;
    }


    @Override
    public boolean addAttention(int selfid, int attenid) {
        return blogDAO.addAttention(selfid,attenid);
    }

    @Override
    public Attention checkIsAttention(int selfid, int attenid) {
        return blogDAO.checkIsAttention(selfid, attenid);
    }

    @Override
    public boolean deleteAttention(int selfid, int attenid) {
        return blogDAO.deleteAttention(selfid, attenid);
    }

    @Override
    public List<Blog> selectTwoBlogByUser(int uid) {
        return blogDAO.selectTwoBlogByUser(uid);
    }

    @Override
    public boolean insertBlogBrowse(int uid, int bid, String browsetime) {
        return blogDAO.insertBlogBrowse(uid, bid, browsetime);
    }
}
