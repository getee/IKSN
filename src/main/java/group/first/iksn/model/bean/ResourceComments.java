package group.first.iksn.model.bean;

public class ResourceComments {
    private  int id;//
    private  int rid;//资源id
    private  int uid;//下载者id
    private  int star;//打星星评价
    private  String comment;//评论
    private  User user;

    @Override
    public String toString() {
        return "ResourceComments{" +
                "id=" + id +
                ", rid=" + rid +
                ", uid=" + uid +
                ", star=" + star +
                ", comment='" + comment + '\'' +
                ", user=" + user +
                '}';
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ResourceComments(int id, int rid, int uid, int star, String comment) {
        this.id = id;
        this.rid = rid;
        this.uid = uid;
        this.star = star;
        this.comment = comment;
    }

    public ResourceComments() {
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

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
