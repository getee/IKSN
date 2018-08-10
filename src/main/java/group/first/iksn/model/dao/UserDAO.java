package group.first.iksn.model.dao;

import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;

import java.util.List;

public interface UserDAO {
    public boolean addUser(User u);
    List<Notice> receiveNotice();

    public User getId(int uid);
}
