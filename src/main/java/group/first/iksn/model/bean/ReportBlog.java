package group.first.iksn.model.bean;

public class ReportBlog {
    private int id;//举报博客表id
    private  int  rid;//资源id
    private  int uid;//举报者id
    private  String  reason;//举报原因

    public ReportBlog(int id, int rid, int uid, String reason) {
        this.id = id;
        this.rid = rid;
        this.uid = uid;
        this.reason = reason;
    }

    public ReportBlog() {
        super();
    }

    @Override
    public String toString() {
        return "ReportBlog{" +
                "id=" + id +
                ", rid=" + rid +
                ", uid=" + uid +
                ", reason='" + reason + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
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
}
