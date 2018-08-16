package group.first.iksn.model.bean;

/**
 * @auther:BruceLee
 * @description:
 */
public class WebChat {
    private String fromid;
    private String toid;
    private String content;

    public String getFromid() {
        return fromid;
    }

    public void setFromid(String fromid) {
        this.fromid = fromid;
    }

    public String getToid() {
        return toid;
    }

    public void setToid(String toid) {
        this.toid = toid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public WebChat() {
    }

    public WebChat(String fromid, String toid, String content) {
        this.fromid = fromid;
        this.toid = toid;
        this.content = content;
    }

    @Override
    public String toString() {
        return "WebChat{" +
                "fromid='" + fromid + '\'' +
                ", toid='" + toid + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
