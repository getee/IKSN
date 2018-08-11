package group.first.iksn.service;

import group.first.iksn.model.bean.Message;
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

        //加密
        String mdpassword=MD5.MD5(u.getPassword());
        System.out.println(mdpassword);
        u.setPassword(mdpassword);
        return userDAO.addUser(u);
    }
    public List<Notice> receiveNotice(int uid) {
        return userDAO.receiveNotice(uid);

    }

    @Override
    public boolean changeIsRead(int isRead,int uid) {
        return userDAO.changeIsRead(isRead,uid);
    }

    @Override
    public boolean addNotice(Notice notice) {
        return userDAO.addNotice(notice);
    }

    @Override
    public boolean deleteNotice(int uid) {
        return userDAO.deleteNotice(uid);
    }

    @Override
    public boolean sendMessage(Message message) {
        //判断收件人是不是该用户的好友或者用户不存在
        List isAttenedResult=userDAO.checkIsAttention(message.getFromid(),message.getToid());
        if(isAttenedResult!=null){
            return userDAO.sendMessage(message);
        }else{
            return false;

        }

    }

    @Override
    public List<User> listAllFriends(int uid,int nowPage) {
        return userDAO.listAllFriends(uid,nowPage);
    }

    @Override
    public int friendNum(int uid) {
        return userDAO.friendNum(uid);
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

}
