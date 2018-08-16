package group.first.iksn.service;

import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.Message;
import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.Scoring;
import group.first.iksn.model.bean.User;

import java.util.List;

public interface UserService {
    //注册用户
    boolean register(User u);
    //检查用户注册时手机号是否被注册过
    boolean checkPhone(String p);
    //查询该用户所有的通知
    List receiveNotice(int uid,int nowPage);
    //查询未读通知数量
    int listNotReadMessageNum(int uid);
    //查询未读私信数量
    int listNotReadNoticeNum(int uid);
    //查询所有通知数量
    int listAllNoticeNum(int uid);
    //查询该用户所有的私信
    List receiveMessage(int uid);
    //查询发送私信方的用户信息
    List listSendMessageUser(int uid);
;    //检查邮箱是否重复
    boolean checkEmail(String eamil);

    //修改用户资料
    User updateUser(User user);

    //修改用户密码
    public void updatePassword(int uid,String newpassword);

    //修改用户邮箱
    public void updateEmail(int uid,String newemail );

    //获取用户id
    public User getId(int uid);
    //用户等级
    int userGrade(int uid);

    //更改通知是否已读的状态
    boolean changeIsRead(int isRead,int uid);
    //更改私信是否已读的状态
    boolean changeMessageIsRead(int isRead,int uid);
    //给需要收到通知的操作加通知
    boolean addNotice(Notice notice);
    //删除该id的用户的所有通知消息
    boolean deleteNotice(int uid);
    //删除该id的用户的所有私信
    boolean deleteMessage(int uid);
    boolean deleteChooseFriend(int selfid,int attenid);
    //给某个用户发私信
    boolean sendMessage(Message message);
    //列出该用户的所有关注的人(分页)
    List FindAllFriendsOfThisUser(int selfid);
    //列出该用户的所有关注的人(不分页)
    List<User> listAllFriends(int uid,int nowPage);
    int friendNum(int uid);
    //根据登录方法
    User login(String emailorphone,String password);
    //根据昵称搜索好友
    List searchFriend(String nickname, int uid);
    //获取登录用户积分详情
    List<Scoring> getScoring (int uid);
    //用户积分消费记录
    List<Scoring> costScoring(int uid);
    //用户积分充值记录
    List<Scoring> rechargeScoring(int uid);


}
