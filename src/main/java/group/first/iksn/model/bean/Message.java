package group.first.iksn.model.bean;

public class Message {
    private int id;//消息表id
    private  int fromid;//发送用户id
    private  int toid;//接收用户id
    private  String content;//消息内容
    private  String time;//日期
    private  int isread;//是否已读

    public Message(int id, int fromid, int toid, String content, String time, int isread) {
        this.id = id;
        this.fromid = fromid;
        this.toid = toid;
        this.content = content;
        this.time = time;
        this.isread = isread;
    }

    public Message() {
        super();
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", fromid=" + fromid +
                ", toid=" + toid +
                ", content='" + content + '\'' +
                ", time='" + time + '\'' +
                ", isread=" + isread +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFromid() {
        return fromid;
    }

    public void setFromid(int fromid) {
        this.fromid = fromid;
    }

    public int getToid() {
        return toid;
    }

    public void setToid(int toid) {
        this.toid = toid;
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
}
