package group.first.iksn.model.bean;

public class ReportResource {
    private  int id;//举报资源id
    private  int rid;//资源id
    private  int uid;//举报者id（userid）
    private  String reason;//举报原因

    public ReportResource(int id, int rid, int uid, String reason) {
        this.id = id;
        this.rid = rid;
        this.uid = uid;
        this.reason = reason;
    }

    public ReportResource() {
        super();
    }

    @Override
    public String toString() {
        return "ReportResource{" +
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
