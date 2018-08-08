package group.first.iksn.model.bean;

public class Blog {
    private int bid;//博客id
    private String title;//博客标题
    private String context;//博客内容,根据富文本制定
    private  String time;//博客发布时间
    private  String link;//博客链接
    private  int points;//博客点赞数
    private int classify;//博客分类

    public Blog(int bid, String title, String context, String time, String link, int points, int classify) {
        this.bid = bid;
        this.title = title;
        this.context = context;
        this.time = time;
        this.link = link;
        this.points = points;
        this.classify = classify;
    }

    public Blog() {
        super();
    }

    @Override
    public String toString() {
        return "Blog{" +
                "bid=" + bid +
                ", title='" + title + '\'' +
                ", context='" + context + '\'' +
                ", time='" + time + '\'' +
                ", link='" + link + '\'' +
                ", points=" + points +
                ", classify=" + classify +
                '}';
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getClassify() {
        return classify;
    }

    public void setClassify(int classify) {
        this.classify = classify;
    }
}
