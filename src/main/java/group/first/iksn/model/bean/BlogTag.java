package group.first.iksn.model.bean;

public class BlogTag {
    private  int id;//博客标签id
    private  int rid;//资源id
    private  String btag;//博客标签

    public BlogTag(int id, int rid, String btag) {
        this.id = id;
        this.rid = rid;
        this.btag = btag;
    }

    public BlogTag() {
        super();
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

    public String getBtag() {
        return btag;
    }

    public void setBtag(String btag) {
        this.btag = btag;
    }

    @Override
    public String toString() {
        return "BlogTag{" +
                "id=" + id +
                ", rid=" + rid +
                ", btag='" + btag + '\'' +
                '}';
    }
}
