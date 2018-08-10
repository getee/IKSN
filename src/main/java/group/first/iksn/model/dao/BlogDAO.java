package group.first.iksn.model.dao;


import group.first.iksn.model.bean.Blog;

public interface BlogDAO {
    public String detailedBlogSearchResultMap();

    //处理添加博客dao
    public  boolean processAddBlog(Blog blog);



}
