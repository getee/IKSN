package group.first.iksn.model.bean;

public class BlogTag {
    private  int id;//博客标签id
    private  int bid;//博客id
    private  String btag;//博客标签

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

    public String getBtag() {
        return btag;
    }

    public void setBtag(String btag) {
        this.btag = btag;
    }

    public BlogTag(int id, int bid, String btag) {
        this.id = id;
        this.bid = bid;
        this.btag = btag;
    }

    public BlogTag() {
    }

    @Override
    public String toString() {
        return "BlogTag{" +
                "id=" + id +
                ", bid=" + bid +
                ", btag='" + btag + '\'' +
                '}';
    }
}
