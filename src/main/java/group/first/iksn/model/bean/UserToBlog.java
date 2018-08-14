package group.first.iksn.model.bean;

public class UserToBlog {
    private int id;//
    private  int uid;//用户id
    private  int bid;//blogid
    private  int isdraft;//是否存入草稿箱
    private  int ispublic;//是否公开博客
    private  int blogtype;//是否原创,翻译，转载..
    private  User user;

    public UserToBlog(int id, int uid, int bid, int isdraft, int ispublic, int blogtype, User user) {
        this.id = id;
        this.uid = uid;
        this.bid = bid;
        this.isdraft = isdraft;
        this.ispublic = ispublic;
        this.blogtype = blogtype;
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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

    public int getIsdraft() {
        return isdraft;
    }

    public void setIsdraft(int isdraft) {
        this.isdraft = isdraft;
    }

    public int getIspublic() {
        return ispublic;
    }

    public void setIspublic(int ispublic) {
        this.ispublic = ispublic;
    }

    public int getBlogtype() {
        return blogtype;
    }

    public void setBlogtype(int blogtype) {
        this.blogtype = blogtype;
    }

    public UserToBlog(int id, int uid, int bid, int isdraft, int ispublic, int blogtype) {
        this.id = id;
        this.uid = uid;
        this.bid = bid;
        this.isdraft = isdraft;
        this.ispublic = ispublic;
        this.blogtype = blogtype;
    }

    public UserToBlog() {
    }

    @Override
    public String toString() {
        return "UserToBlog{" +
                "id=" + id +
                ", uid=" + uid +
                ", bid=" + bid +
                ", isdraft=" + isdraft +
                ", ispublic=" + ispublic +
                ", blogtype=" + blogtype +
                '}';
    }
}
