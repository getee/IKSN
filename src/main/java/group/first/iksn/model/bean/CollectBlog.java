package group.first.iksn.model.bean;

public class CollectBlog {
    private  int id;//收藏博客表id
    private  int uid;//用户id
    private  int bid;//博客id

    public CollectBlog(int id, int uid, int bid) {
        this.id = id;
        this.uid = uid;
        this.bid = bid;
    }

    public CollectBlog() {
        super();
    }

    @Override
    public String toString() {
        return "CollectBlog{" +
                "id=" + id +
                ", uid=" + uid +
                ", bid=" + bid +
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
}
