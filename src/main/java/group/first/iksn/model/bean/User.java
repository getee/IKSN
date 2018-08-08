package group.first.iksn.model.bean;

public class User {
    private int uid;
    private String email;
    private int phone;//
    private int password;//
    private String nickName;//昵称
    private int sex;//性别
    private String introduce;//自我简介
    private int grade;//等级
    private int score;//积分

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

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
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

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", email='" + email + '\'' +
                ", phone=" + phone +
                ", password=" + password +
                ", nickName='" + nickName + '\'' +
                ", sex=" + sex +
                ", introduce='" + introduce + '\'' +
                ", grade=" + grade +
                ", score=" + score +
                '}';
    }

    public User(int uid, String email, int phone, int password, String nickName, int sex, String introduce, int grade, int score) {
        this.uid = uid;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.nickName = nickName;
        this.sex = sex;
        this.introduce = introduce;
        this.grade = grade;
        this.score = score;
    }

    public User() {
    }
}
