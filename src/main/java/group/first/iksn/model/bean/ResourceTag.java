package group.first.iksn.model.bean;

public class ResourceTag {
    private  int id;//资源标签表id
    private  int rid;//资源id
    private  String rtag;//资源自定义标签

    public ResourceTag(int id, int rid, String rtag) {
        this.id = id;
        this.rid = rid;
        this.rtag = rtag;
    }

    public ResourceTag() {
        super();
    }

    @Override
    public String toString() {
        return "ResourceTag{" +
                "id=" + id +
                ", rid=" + rid +
                ", rtag='" + rtag + '\'' +
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

    public String getRtag() {
        return rtag;
    }

    public void setRtag(String rtag) {
        this.rtag = rtag;
    }
}
