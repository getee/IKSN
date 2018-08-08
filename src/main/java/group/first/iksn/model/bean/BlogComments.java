package group.first.iksn.model.bean;

/**
 * 记录评论的bean
 */
public class BlogComments {
    private  int id;//单条评论id
    private  int uid;//用户id
    private  int bid;//博客id
    private  int commentid;//评论id,针对哪条评论进行回复，可为空
    private  String time;//评论时间
    private  String content;//评论内容
    private  int floor;//层数


    public BlogComments() {
        super();
    }

    public BlogComments(int id, int uid, int bid, int commentid, String time, String content, int floor) {
        this.id = id;
        this.uid = uid;
        this.bid = bid;
        this.commentid = commentid;
        this.time = time;
        this.content = content;
        this.floor = floor;
    }

    @Override
    public String toString() {
        return "BlogComments{" +
                "id=" + id +
                ", uid=" + uid +
                ", bid=" + bid +
                ", commentid=" + commentid +
                ", time='" + time + '\'' +
                ", content='" + content + '\'' +
                ", floor=" + floor +
                '}';
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
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

    public int getCommentid() {
        return commentid;
    }

    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


}
