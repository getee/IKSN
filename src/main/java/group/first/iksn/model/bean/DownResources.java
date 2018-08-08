package group.first.iksn.model.bean;

public class DownResources {
    private  int id;//下载资源id
    private  int uid;//用户id
    private  int rid;//资源id
    private  String time;//时间

    public DownResources(int id, int uid, int rid, String time) {
        this.id = id;
        this.uid = uid;
        this.rid = rid;
        this.time = time;
    }

    public DownResources() {
        super();
    }

    @Override
    public String toString() {
        return "DownResources{" +
                "id=" + id +
                ", uid=" + uid +
                ", rid=" + rid +
                ", time='" + time + '\'' +
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
