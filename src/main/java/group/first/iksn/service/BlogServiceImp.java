package group.first.iksn.service;


import group.first.iksn.model.bean.Blog;

import group.first.iksn.model.bean.BlogBrowsed;
import group.first.iksn.model.bean.IllegalBlog;
import group.first.iksn.model.dao.BlogDAO;
import org.springframework.stereotype.Component;

import java.util.List;

import group.first.iksn.model.bean.SearchBlog;


import java.util.ArrayList;


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

        return blogDAO.addIllegalblog(blog);
    }


    @Override
    public List<IllegalBlog> getAllReportBlog() {
        return blogDAO.getAllReportBlog();
    }


    /**
     * 搜索资源的方法
     * @param s
     * @return
     */
    public List<Blog> detailedBlogSearchResultMap(String s){

        return  blogDAO.detailedBlogSearchResultMap(s);
    }

    /**
     * 首页推送的方法
     * @return
     */
    @Override
    public List<Blog> detailedBlogPush() {
        return blogDAO.detailedBlogPush();
    }




    @Override
    public boolean addBlogService(Blog blog) {
        return blogDAO.processAddBlog(blog);
    }
    }
