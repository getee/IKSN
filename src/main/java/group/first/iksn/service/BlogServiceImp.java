package group.first.iksn.service;


import group.first.iksn.model.bean.*;
import group.first.iksn.model.dao.BlogDAO;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component("blogService")
public class BlogServiceImp implements BlogService {
    private BlogDAO blogDAO;

    public BlogDAO getBlogDAO() {
        return blogDAO;
    }

    public void setBlogDAO(BlogDAO blogDAO) {
        this.blogDAO = blogDAO;
    }

    /**
     * 删除违规博客，
     * wenbin
     * @return
     */
    @Override
    public boolean deleteIllegalblog(IllegalBlog blog) {
        return true;
    }

    /**
     * 退回违规博客，处理违规博客的安置
     * wenbin
     * @return
     */
    @Override
    public boolean sendBackIllegalblog(IllegalBlog blog) {
        boolean sendBack=blogDAO.addIllegalblog(blog);
        if (sendBack){
            //插入illegalblog成功，将reportblog表对应数据删除

        }
        return sendBack;
    }

    /**
     * 获取被举报的博客
     * wenbin
     * @return
     */
    @Override
    public List<ReportBlog> getAllReportBlog() {
        return blogDAO.getAllReportBlog();
    }

    /**
     * 驳回被举报的博客，（将博客去除被举报标记）
     * @param blog
     * @return
     */
    @Override
    public boolean Reject_oneReportblog(ReportBlog blog) {
        return blogDAO.deleteBlogFromReport(blog);
    }


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
    public List<Blog> scanBlogService(int bid) {

        return blogDAO.processScanBlog(bid);
    }

    @Override
    public boolean discuss(BlogComments blogComments) {
        System.out.println(blogComments);
        return blogDAO.commentBlog(blogComments);
    }

    //举报博客
    @Override
    public boolean reportBlog(ReportBlog reportBlog) {
        boolean serviceResult=blogDAO.reportBlog(reportBlog);
        return serviceResult;
    }


}
