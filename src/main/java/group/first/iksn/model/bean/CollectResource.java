package group.first.iksn.model.bean;

public class CollectResource {
    private  int id;//收藏资源id
    private  int uid;//用户id
    private  int  rid;//资源id

    public CollectResource(int id, int uid, int rid) {
        this.id = id;
        this.uid = uid;
        this.rid = rid;
    }

    public CollectResource() {
        super();
    }

    @Override
    public String toString() {
        return "CollectResource{" +
                "id=" + id +
                ", uid=" + uid +
                ", rid=" + rid +
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
}
