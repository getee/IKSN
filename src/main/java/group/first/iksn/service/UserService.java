package group.first.iksn.service;

import group.first.iksn.model.bean.Message;
import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;

import java.util.List;

public interface UserService {
    //注册用户
    boolean register(User u);
    //检查用户注册时手机号是否被注册过
    boolean checkPhone(String p);
    //查询该用户所有的通知
    List receiveNotice(int uid);
    //检查邮箱是否重复
    boolean checkEmail(String eamil);
    //更改通知是否已读的状态
    boolean changeIsRead(int isRead,int uid);
    //给需要收到通知的操作加通知
    boolean addNotice(Notice notice);
    //删除该id的用户的所有通知消息
    boolean deleteNotice(int uid);
    //给某个用户发私信
    boolean sendMessage(Message message);
    //列出该用户的所有关注的人
    List<User> listAllFriends(int uid,int nowPage);
    int friendNum(int uid);
    //根据登录方法
    User login(String emailorphone,String password);
}
