package group.first.iksn.model.dao;

import group.first.iksn.model.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDAO {
    public boolean addUser(User u);
    List<Notice> receiveNotice(@Param("uid") int uid,@Param("nowPage") int nowPage);
    int listNotReadNoticeNum(@Param("uid") int uid);
    int listNotReadMessageNum(@Param("uid") int uid);
    int listAllNoticeNum(@Param("uid") int uid);
    int listAllMessageNum(@Param("toid") int uid);
    List<Message> receiveMessage(@Param("toid") int uid,@Param("nowPage") int nowPage);
    List<User> listSendMessageUser(int uid);
    boolean changeIsRead(@Param("isRead") int isRead,@Param("uid") int uid);
    boolean changeMessageIsRead(@Param("isRead") int isRead,@Param("uid") int uid);

    User checkPhone(String phone);
    User checkEmail(String email);

    User loginByEmail(String email,String password);
    User loginByPhone( String phone, String password);
    boolean addNotice(Notice notice);
    boolean deleteNotice(int uid);
    boolean deleteMessage(int uid);
    boolean deleteChooseFriend(@Param("selfid") int selfid,@Param("attenid") int attenid);
    boolean sendMessage(Message message);
    List checkIsAttention(@Param("selfid") int selfid,@Param("attenid") int attenid);
    //分页查询好友，一页5条
    List listAllFriends(@Param("selfid") int uid,@Param("nowPage") int nowPage);
    //一次性查询所有的好友
    List FindAllFriendsOfThisUser(int selfid);
    List searchFriend(@Param("nickname") String nickname,@Param("selfid") int uid);
    //查询该用户的粉丝
    List listAllFans(@Param("attenid") int uid);
    int friendNum(int selfid);

    //修改用户
    public boolean updateUser( User user);
    public User getId(int uid);
     //修改用户密码
    boolean updatePassword(User user);
    //修改用户邮箱
    boolean updateEmail(User user);
    //用户等级
    int userGrade(int uid);
    //获取用户的积分明细
    List<Scoring> getScoring(int uid);
    //积分消费
    List<Scoring> costScoring(int uid);
    //积分充值记录
    List<Scoring> rechargeScoring(int uid);


    //我的关注列表
    List<User> myAttention(int uid);
    //我的粉丝
    List<User> myFans(int uid);
}
