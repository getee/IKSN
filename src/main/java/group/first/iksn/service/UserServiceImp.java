package group.first.iksn.service;

import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;
import group.first.iksn.model.dao.UserDAO;
import group.first.iksn.util.MD5;
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

        //加密
        String mdpassword=MD5.MD5(u.getPassword());
        System.out.println(mdpassword);
        u.setPassword(mdpassword);
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

    @Override
    public boolean checkEmail(String eamil) {
        User u=userDAO.checkEmail(eamil);
        if (u==null){
            return false;
        }
        else
            return  true;
    }


    //修改用户资料
    @Override
    public User updateUser(User user) {
            System.out.println(user.getUid());
           boolean b=userDAO.updateUser(user);
            //在进行查询
           return user;
    }


    //判断用户是否存在
    @Override
    public boolean isUserExist(int uid) {
            if (userDAO.getId(uid) == null) {
                return false;
            } else {
                return true;
            }
        }
    //修改用户密码
    @Override
    public void updatePassword(int uid,String newpassword) {
        User user=userDAO.getId(uid);
        user.setUid(uid);
        user.setPassword(MD5.MD5(newpassword));
        userDAO.updatePassword(user);
    }
    //根据提供的id获取密码
    @Override
    public String getId(int uid) {
       return userDAO.getId(uid).getPassword();
    }


}




