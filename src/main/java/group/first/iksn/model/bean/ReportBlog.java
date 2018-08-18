package group.first.iksn.model.bean;

public class ReportBlog {
    private int id;//举报博客表id
    private  int  bid;//博客id
    private  int uid;//举报者id
    private  String  reason;//举报原因

    private Blog blog;


    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public ReportBlog() {
    }

    public ReportBlog(int id, int bid, int uid, String reason) {
        this.id = id;
        this.bid = bid;
        this.uid = uid;
        this.reason = reason;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return "ReportBlog{" +
                "id=" + id +
                ", bid=" + bid +
                ", uid=" + uid +
                ", reason='" + reason + '\'' +
                '}';
    }
}
