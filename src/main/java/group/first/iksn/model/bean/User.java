package group.first.iksn.model.bean;

public class User {
    private int uid;
    private String email;
    private String phone;//
    private String password;//
    private String nickname;//昵称
    private int sex;//性别
    private String introduce;//自我简介
    private int grade;//等级
    private int score;//积分
    private int isadmin;//是不是管理员
    private int isspeak;//是不是能发言0能，1被禁言
    private String timeofban;//被禁截止时间

    public User() {
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
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

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", sex=" + sex +
                ", introduce='" + introduce + '\'' +
                ", grade=" + grade +
                ", score=" + score +
                ", isadmin=" + isadmin +
                ", isspeak=" + isspeak +
                ", timeofban='" + timeofban + '\'' +
                '}';
    }
}
