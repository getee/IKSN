package group.first.iksn.model.bean;

import java.util.Set;

public class Resource {
    private  int rid;//资源id
    private  int uid;//用户id
    private  String name;//资源名称
    private  String md5;//MD5码
    private  String sha;//SHA码
    private  String path;//资源路径
    private  int scoring;//所需积分值
    private  int classify;//资源分类
    private  String introduce;//资源介绍
    private  String time;//时间
    private  User user;//用户
    private Set<ResourceTag> resourceTags;


    @Override
    public String toString() {
        return "Resource{" +
                "rid=" + rid +
                ", uid=" + uid +
                ", name='" + name + '\'' +
                ", md5='" + md5 + '\'' +
                ", sha='" + sha + '\'' +
                ", path='" + path + '\'' +
                ", scoring=" + scoring +
                ", classify=" + classify +
                ", introduce='" + introduce + '\'' +
                ", time='" + time + '\'' +
                '}';
    }

    public Set<ResourceTag> getResourceTags() {
        return resourceTags;
    }

    public void setResourceTags(Set<ResourceTag> resourceTags) {
        this.resourceTags = resourceTags;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMd5() {
        return md5;
    }

    public void setMd5(String md5) {
        this.md5 = md5;
    }

    public String getSha() {
        return sha;
    }

    public void setSha(String sha) {
        this.sha = sha;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getScoring() {
        return scoring;
    }

    public void setScoring(int scoring) {
        this.scoring = scoring;
    }

    public int getClassify() {
        return classify;
    }

    public void setClassify(int classify) {
        this.classify = classify;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Resource() {
        super();
    }

    public Resource(int rid, int uid, String name, String md5, String sha, String path, int scoring, int classify, String introduce, String time) {
        this.rid = rid;
        this.uid = uid;
        this.name = name;
        this.md5 = md5;
        this.sha = sha;
        this.path = path;
        this.scoring = scoring;
        this.classify = classify;
        this.introduce = introduce;
        this.time = time;
    }

}
