package group.first.iksn.model.bean;
//记录用户之间关注信息的bean
public class Attention {
    private  int id;//关注表id
    private  int selfid;//本用户id
    private  int attenid;//被关注用户id

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSelfid() {
        return selfid;
    }

    public void setSelfid(int selfid) {
        this.selfid = selfid;
    }

    public int getAttenid() {
        return attenid;
    }

    public void setAttenid(int attenid) {
        this.attenid = attenid;
    }

    public Attention() {
        super();
    }

    public Attention(int id, int selfid, int attenid) {
        this.id = id;
        this.selfid = selfid;
        this.attenid = attenid;
    }

    @Override
    public String toString() {
        return "Attention{" +
                "id=" + id +
                ", selfid=" + selfid +
                ", attenid=" + attenid +
                '}';
    }
}
