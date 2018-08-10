package group.first.iksn.model.bean;

public class UserInfo {
    private int id;
    private int uid;
    private String loginip;

    public UserInfo() {
    }

    public UserInfo(int id, int uid, String loginip) {
        this.id = id;
        this.uid = uid;
        this.loginip = loginip;
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

    public String getLoginip() {
        return loginip;
    }

    public void setLoginip(String loginip) {
        this.loginip = loginip;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", uid=" + uid +
                ", loginip='" + loginip + '\'' +
                '}';
    }
}
