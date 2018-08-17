package group.first.iksn.model.bean;

import java.util.Objects;

/**
 * 记录评论的bean
 */
public class BlogComments implements Comparable {
    private  int id;//单条评论id
    private  int uid;//用户id
    private  int bid;//博客id
    private  int commentid;//评论id,针对哪条评论进行回复，可为空
    private  String time;//评论时间
    private  String content;//评论内容
    private  int floor;//层数
    private User user;

    public BlogComments() {
    }

    public BlogComments(int id, String time, int floor) {
        this.id = id;
        this.time = time;
        this.floor = floor;
    }

    @Override
    public String toString() {
        return "BlogComments{" +
                "id=" + id +
                ", uid=" + uid +
                ", bid=" + bid +
                ", commentid=" + commentid +
                ", time='" + time + '\'' +
                ", content='" + content + '\'' +
                ", floor=" + floor +
                ", user=" + user +
                '}';
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

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getCommentid() {
        return commentid;
    }

    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BlogComments that = (BlogComments) o;
        return Objects.equals(time, that.time);
    }

    @Override
    public int hashCode() {

        return Objects.hash(time);
    }

    @Override
    public int compareTo(Object o) {
        BlogComments b=(BlogComments)o;
        int i = 0;
        i = floor - b.floor; // 使用字符串的比较
        if(i == 0) { // 如果time一样,比较id, 返回比较年龄结果
            return time.compareTo(b.time);
        } else {
            return i; // 名字不一样, 返回比较名字的结果.
        }
    }
}
