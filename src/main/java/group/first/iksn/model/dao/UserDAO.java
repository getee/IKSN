package group.first.iksn.model.dao;

import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;

import java.util.List;

public interface UserDAO {
    public boolean addUser(User u);
    List<Notice> receiveNotice();

    public User getId(int uid);
    User checkPhone(String phone);
    User checkEmail(String email);

    //修改用户
    public boolean updateUser( User user);

     //修改用户密码
    boolean updatePassword(User user);
}
