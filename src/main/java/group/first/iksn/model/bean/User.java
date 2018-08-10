package group.first.iksn.model.bean;

public class User {
    private int uid;
    private String email;
    private String phone;//
    private int password;//
    private String nickName;//昵称
    private int sex;//性别
    private String introduce;//自我简介
    private int grade;//等级
    private int score;//积分
    private int isadmin;//是不是管理员
    private int isspeak;//是不是能发言0能，1被禁言
    private String timeofban;//被禁截止时间

    public int getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(int isadmin) {
        this.isadmin = isadmin;
    }

    public int getIsspeak() {
        return isspeak;
    }

    public void setIsspeak(int isspeak) {
        this.isspeak = isspeak;
    }

    public String getTimeofban() {
        return timeofban;
    }

    public void setTimeofban(String timeofban) {
        this.timeofban = timeofban;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }



    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", password=" + password +
                ", nickName='" + nickName + '\'' +
                ", sex=" + sex +
                ", introduce='" + introduce + '\'' +
                ", grade=" + grade +
                ", score=" + score +
                ", isadmin=" + isadmin +
                ", isspeak=" + isspeak +
                ", timeofban='" + timeofban + '\'' +
                '}';
    }

    public User() {
    }
}
