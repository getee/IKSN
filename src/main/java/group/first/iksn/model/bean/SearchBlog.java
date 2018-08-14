package group.first.iksn.model.bean;

import java.util.Set;

public class SearchBlog {
    private int bid;//博客id
    private String title;//博客标题
    private String content;//博客内容,根据富文本制定
    private  String time;//博客发布时间
    private  String link;//博客链接
    private  int points;//博客点赞数
    private int classify;//博客分类
    private  UserToBlog userToBlog;
    private  User user;




    public String toString() {
        return "SearchBlog{" +
                "bid=" + bid +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", time='" + time + '\'' +
                ", link='" + link + '\'' +
                ", points=" + points +
                ", classify=" + classify +
                '}';
    }

    public SearchBlog(int bid, String title, String content, String time, String link, int points, int classify) {
        this.bid = bid;
        this.title = title;
        this.content = content;
        this.time = time;
        this.link = link;
        this.points = points;
        this.classify = classify;
    }



    public UserToBlog getUserToBlog() {
        return userToBlog;
    }

    public void setUserToBlog(UserToBlog userToBlog) {
        this.userToBlog = userToBlog;
    }

    public SearchBlog() {
        super();
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getClassify() {
        return classify;
    }

    public void setClassify(int classify) {
        this.classify = classify;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}
