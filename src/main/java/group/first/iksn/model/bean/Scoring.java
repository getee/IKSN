package group.first.iksn.model.bean;

public class Scoring {
    private  int id;//积分记录表
    private  int uid;//用户id
    private int state;//判断增加或减少
    private  int number;//积分数量
    private  String operation;//操作内容
    private  String time;//日期

    public Scoring(int id, int uid, int state, int number, String operation, String time) {
        this.id = id;
        this.uid = uid;
        this.state = state;
        this.number = number;
        this.operation = operation;
        this.time = time;
    }

    public Scoring() {
        super();
    }

    @Override
    public String toString() {
        return "Scoring{" +
                "id=" + id +
                ", uid=" + uid +
                ", state=" + state +
                ", number=" + number +
                ", operation='" + operation + '\'' +
                ", time='" + time + '\'' +
                '}';
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

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
