package group.first.iksn.model.dao;

import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDAO {
    public boolean addUser(User u);
    List<Notice> receiveNotice();

    public User getId(int uid);
    User checkPhone(String phone);
    User checkEmail(String email);

    User loginByEmail(String email,String password);
    User loginByPhone( String phone, String password);
}
