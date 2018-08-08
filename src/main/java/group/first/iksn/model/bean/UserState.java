package group.first.iksn.model.bean;

public class UserState {
    private int isactivation;//激活状态
    private int isspeak;//是否禁言
    private int isadmin;//是否管理
    private String loginip;//登录IP
    private int uid;//用户ID
    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }
    public int getIsactivation() {
        return isactivation;
    }
    public void setIsactivation(int isactivation) {
        this.isactivation = isactivation;
    }
    public int getIsspeak() {
        return isspeak;
    }
    public void setIsspeak(int isspeak) {
        this.isspeak = isspeak;
    }
    public int getIsadmin() {
        return isadmin;
    }
    public void setIsadmin(int isadmin) {
        this.isadmin = isadmin;
    }
    public String getLoginip() {
        return loginip;
    }
    public void setLoginip(String loginip) {
        this.loginip = loginip;
    }
    @Override
    public String toString() {
        return "Userstate [isactivation=" + isactivation + ", isspeak=" + isspeak + ", isadmin=" + isadmin
                + ", loginip=" + loginip + ", uid=" + uid + "]";
    }

    public UserState(int isactivation, int isspeak, int isadmin, String loginip, int uid) {
        this.isactivation = isactivation;
        this.isspeak = isspeak;
        this.isadmin = isadmin;
        this.loginip = loginip;
        this.uid = uid;
    }

    public UserState() {
        super();
    }
}
