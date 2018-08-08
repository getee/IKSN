package group.first.iksn.service;

import group.first.iksn.model.bean.User;
import group.first.iksn.model.dao.UserDAO;
import org.springframework.stereotype.Component;

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

        return userDAO.addUser(u);
    }
}
