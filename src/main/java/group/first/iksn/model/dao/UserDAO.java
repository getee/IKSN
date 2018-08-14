package group.first.iksn.model.dao;

import group.first.iksn.model.bean.Attention;
import group.first.iksn.model.bean.Message;
import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDAO {
    public boolean addUser(User u);
    List<Notice> receiveNotice(@Param("uid") int uid,@Param("nowPage") int nowPage);
    int listNotReadNoticeNum(@Param("uid") int uid);
    int listAllNoticeNum(@Param("uid") int uid);
    List<Message> receiveMessage(int uid);
    List<User> listSendMessageUser(int uid);
    boolean changeIsRead(@Param("isRead") int isRead,@Param("uid") int uid);
    boolean changeMessageIsRead(@Param("isRead") int isRead,@Param("uid") int uid);
    public User getId(int uid);
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
    List listAllFriends(@Param("selfid") int uid,@Param("nowPage") int nowPage);
    int friendNum(int selfid);

    //修改用户
    public boolean updateUser( User user);

     //修改用户密码
    boolean updatePassword(User user);
    //用户等级
    int userGrade(int uid);
}
