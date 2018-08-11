package group.first.iksn.model.bean;

public class IllegalBlog {
    private int id;//违规表id
    private  int bid;//违规博客id
    private  String illegalcause;//违规原因
    private Blog blog;

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public IllegalBlog(int id, int bid, String illegalcause) {
        this.id = id;
        this.bid = bid;
        this.illegalcause = illegalcause;
    }

    public IllegalBlog() {
        super();
    }

    @Override
    public String toString() {
        return "IllegalBlog{" +
                "id=" + id +
                ", bid=" + bid +
                ", illegalcause='" + illegalcause + '\'' +
                '}';
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

    public String getIllegalcause() {
        return illegalcause;
    }

    public void setIllegalcause(String illegalcause) {
        this.illegalcause = illegalcause;
    }
}
