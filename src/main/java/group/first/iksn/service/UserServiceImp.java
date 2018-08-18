package group.first.iksn.service;

import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.Message;
import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.Scoring;
import group.first.iksn.model.bean.User;
import group.first.iksn.model.dao.UserDAO;
import group.first.iksn.util.MD5;
import org.springframework.stereotype.Component;

import java.rmi.server.UID;
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
    public List<Notice> receiveNotice(int uid,int nowPage) {
        return userDAO.receiveNotice(uid,nowPage);

    }

    @Override
    public int listNotReadNoticeNum(int uid) {
        return userDAO.listNotReadNoticeNum(uid);
    }

    @Override
    public int listAllMessageNum(int uid) {
        return userDAO.listAllMessageNum(uid);
    }

    @Override
    public int listNotReadMessageNum(int uid) {
        return userDAO.listNotReadMessageNum(uid);
    }
    @Override
    public int listAllNoticeNum(int uid) {
        return userDAO.listAllNoticeNum(uid);
    }

    @Override
    public List receiveMessage(int uid,int nowPage) {
        return userDAO.receiveMessage(uid,nowPage);
    }

    @Override
    public List listSendMessageUser(int uid) {
        return userDAO.listSendMessageUser(uid);
    }

    @Override
    public boolean changeIsRead(int isRead,int uid) {
        return userDAO.changeIsRead(isRead,uid);
    }

    @Override
    public boolean changeMessageIsRead(int isRead, int uid) {
        return userDAO.changeMessageIsRead(isRead, uid);
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
    public boolean deleteMessage(int uid) {
        return userDAO.deleteMessage(uid);
    }

    @Override
    public boolean deleteChooseFriend(int selfid, int attenid) {
        return userDAO.deleteChooseFriend(selfid, attenid);
    }

    @Override
    public boolean sendMessage(Message message) {
    /*    //判断收件人是不是该用户的好友或者用户不存在
        List isAttenedResult=userDAO.checkIsAttention(message.getFromid(),message.getToid());
        if(isAttenedResult!=null){
            return userDAO.sendMessage(message);
        }else{
            return false;

        }*/
        return userDAO.sendMessage(message);
    }

    @Override
    public List FindAllFriendsOfThisUser(int selfid) {
        return userDAO.FindAllFriendsOfThisUser(selfid);
    }

    @Override
    public List<User> listAllFriends(int uid,int nowPage) {
        return userDAO.listAllFriends(uid,nowPage);
    }

    @Override
    public List listAllFans(int uid) {
        return userDAO.listAllFans(uid);
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

    @Override
    public User login(String emailorphone, String password) {

        System.out.println(emailorphone+":"+password);
        String email= "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        String phone="^(13[0-9]|15[0-9]|153|15[6-9]|180|18[23]|18[5-9])\\d{8}$";
        password=MD5.MD5(password);
        if(emailorphone.matches(email)){
            System.out.println("邮箱");
            email=emailorphone;
            return userDAO.loginByEmail(email,password);
        }
        else if (emailorphone.matches(phone)){
            System.out.println("手机号");
            phone=emailorphone;
            return userDAO.loginByPhone(phone,password);
        }
        else {
            System.out.println("都不是");
            return null;
        }

    }

    @Override
    public List searchFriend(String nickname, int uid) {
        return userDAO.searchFriend(nickname, uid);
    }

    /**
     * 查询积分
     * @param uid
     * @return
     */
    @Override
    public List<Scoring> getScoring(int uid) {
        List<Scoring> scorings=userDAO.getScoring(uid);
        for(Scoring s:scorings){
            System.out.println(s);
        }
        return scorings;
    }

    /**
     * 积分消费账单
     * @param uid
     * @return
     */
    @Override
    public List<Scoring> costScoring(int uid) {
        List<Scoring> scorings=userDAO.costScoring(uid);
        for(Scoring s:scorings){
            System.out.println(s);
        }
        return scorings;
    }

    /**
     * 用户充值记录
     * @param uid
     * @return
     */
    @Override
    public List<Scoring> rechargeScoring(int uid) {
        List<Scoring> scorings=userDAO.rechargeScoring(uid);
        for(Scoring s:scorings){
            System.out.println(s);
        }
        return scorings;
    }


    /**
     * 我的关注列表
     * @param uid
     * @return
     */
    @Override
    public List<User> myAttention(int uid) {
        List<User> users=userDAO.myAttention(uid);
        for (User u:users){
            System.out.println(u.getNickname());
        }
        return users;
    }

    /**
     * 我的粉丝
     * @param uid
     * @return
     */
    @Override
    public List<User> myFans(int uid) {
        List<User> users=userDAO.myFans(uid);
        for (User u:users){
            System.out.println(u.getNickname());
        }
        return users;
    }

    @Override
    public List<User> getUserBySpeak(int page) {
        return userDAO.getUserBySpeak(page);
    }

    @Override
    public boolean isSpeaktoTrue(int uid) {
        return userDAO.isSpeaktoTrue(uid);
    }

    @Override
    public int getIsspeakNum() {
        return userDAO.getIsspeakNum();
    }

    //修改用户资料
    @Override
    public User updateUser(User user) {
            System.out.println(user.getUid());
           boolean b=userDAO.updateUser(user);
            //在进行查询
           return user;
    }

    //修改用户密码
    @Override
    public void updatePassword(int uid,String newpassword) {
        User user=userDAO.getId(uid);
        user.setUid(uid);
        user.setPassword(MD5.MD5(newpassword));
        userDAO.updatePassword(user);
    }

    //修改用户邮箱
    @Override
    public void updateEmail(int uid, String newemail) {
        User user=userDAO.getId(uid);
        user.setUid(uid);
        user.setEmail(newemail);
        userDAO.updateEmail(user);

    }
    //根据提供的id获取用户
    @Override
    public User getId(int uid) {
        return userDAO.getId(uid);
    }
    //用户等级
    @Override
    public int userGrade(int uid) {
        int score=userDAO.userGrade(uid);
        int grade=score/100;
        return grade;
    }



}




