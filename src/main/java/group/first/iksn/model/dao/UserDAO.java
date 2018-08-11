package group.first.iksn.model.dao;

import group.first.iksn.model.bean.Attention;
import group.first.iksn.model.bean.Message;
import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDAO {
    public boolean addUser(User u);
    List<Notice> receiveNotice(int uid);
    boolean changeIsRead(@Param("isRead") int isRead,@Param("uid") int uid);
    public User getId(int uid);
    User checkPhone(String phone);
    User checkEmail(String email);
    boolean addNotice(Notice notice);
    boolean deleteNotice(int uid);
    boolean sendMessage(Message message);
    List checkIsAttention(@Param("selfid") int selfid,@Param("attenid") int attenid);
    List listAllFriends(@Param("selfid") int uid,@Param("nowPage") int nowPage);
    int friendNum(int selfid);
}
