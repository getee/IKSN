package group.first.iksn.model.bean;

public class Notice {
    private  int id;//通知表id
    private  int uid;//用户id
    private  String  content;//内容
    private  String time;//时间
    private  int isread;//是否已读
    private  int type;//通知类型

    public Notice(int id, int uid, String content, String time, int isread, int type) {
        this.id = id;
        this.uid = uid;
        this.content = content;
        this.time = time;
        this.isread = isread;
        this.type = type;
    }

    public Notice() {
        super();
    }

    @Override
    public String toString() {
        return "Notice{" +
                "id=" + id +
                ", uid=" + uid +
                ", content='" + content + '\'' +
                ", time='" + time + '\'' +
                ", isread=" + isread +
                ", type=" + type +
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getIsread() {
        return isread;
    }

    public void setIsread(int isread) {
        this.isread = isread;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
