package group.first.iksn.model.bean;

import java.util.Set;

/**
 * 浏览博客记录
 * */
public class BlogBrowsed {
    private  int id;//浏览记录id
    private  int  uid;//用户id
    private  int rid;//资源id
    private  String browsetime;//浏览时间
    private  Blog blog;
    private  User user;


    public BlogBrowsed(int id, int uid, int rid, String browsetime, Blog blog, User user) {
        this.id = id;
        this.uid = uid;
        this.rid = rid;
        this.browsetime = browsetime;
        this.blog = blog;
        this.user = user;
    }

    public BlogBrowsed(int id, int uid, int rid, String browsetime) {
        this.id = id;
        this.uid = uid;
        this.rid = rid;
        this.browsetime = browsetime;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public BlogBrowsed() {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getBrowsetime() {
        return browsetime;
    }

    public void setBrowsetime(String browsetime) {
        this.browsetime = browsetime;
    }

    @Override
    public String toString() {
        return "BlogBrowsed{" +
                "id=" + id +
                ", uid=" + uid +
                ", rid=" + rid +
                ", browsetime='" + browsetime + '\'' +
                '}';
    }
}
