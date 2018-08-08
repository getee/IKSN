package group.first.iksn.model.bean;

public class ResourceBrowsed {
    private int id;//浏览记录id
    private  int uid;//用户id
    private  int rid;//资源id
    private  String browsetime;//浏览时间

    public ResourceBrowsed(int id, int uid, int rid, String browsetime) {
        this.id = id;
        this.uid = uid;
        this.rid = rid;
        this.browsetime = browsetime;
    }

    public ResourceBrowsed() {
        super();
    }

    @Override
    public String toString() {
        return "ResourceBrowsed{" +
                "id=" + id +
                ", uid=" + uid +
                ", rid=" + rid +
                ", browsetime='" + browsetime + '\'' +
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
}
