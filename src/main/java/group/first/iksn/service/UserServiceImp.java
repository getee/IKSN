package group.first.iksn.service;

import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;
import group.first.iksn.model.dao.UserDAO;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("userService")
public class UserServiceImp implements UserService {
    private UserDAO userDAO;

    public UserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public boolean register(User u) {
        System.out.println(u);

        return userDAO.addUser(u);
    }
    public List<Notice> receiveNotice() {
        return userDAO.receiveNotice();


    }
    public boolean checkPhone(String p) {
        User u=userDAO.checkPhone(p);
        if (u==null){
            return false;
        }
        else
            return  true;
    }

}
