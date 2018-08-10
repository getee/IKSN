package group.first.iksn.model.dao;

import group.first.iksn.model.bean.User;

public interface UserDAO {
    public boolean addUser(User u);

    public User getId(int uid);
    User checkPhone(String phone);
}
