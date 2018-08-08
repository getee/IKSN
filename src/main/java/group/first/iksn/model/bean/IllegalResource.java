package group.first.iksn.model.bean;

public class IllegalResource {
    private int id;//违规资源表id
    private  int rid;//资源id
    private  String illegalcause;//违规原因

    public IllegalResource(int id, int rid, String illegalcause) {
        this.id = id;
        this.rid = rid;
        this.illegalcause = illegalcause;
    }

    public IllegalResource() {
        super();
    }

    @Override
    public String toString() {
        return "IllegalResource{" +
                "id=" + id +
                ", rid=" + rid +
                ", illegalcause='" + illegalcause + '\'' +
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

    public String getIllegalcause() {
        return illegalcause;
    }

    public void setIllegalcause(String illegalcause) {
        this.illegalcause = illegalcause;
    }
}
