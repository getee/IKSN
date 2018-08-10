package group.first.iksn.model.dao;

import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;

import java.util.List;

public interface UserDAO {
    public boolean addUser(User u);
    List<Notice> receiveNotice();
    boolean changeIsRead(int isRead);
    public User getId(int uid);
    User checkPhone(String phone);
    boolean addNotice(Notice notice);
    boolean deleteNotice(int uid);
}
