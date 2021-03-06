package group.first.iksn.model.dao;

import group.first.iksn.model.bean.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("userDAO")
public class UserDAOImp extends BaseDAOImp implements UserDAO {
    public boolean addUser(User u) {
        boolean isOK=false;
        try{
            isOK=getSqlSession().getMapper(UserDAO.class).addUser(u);
            return isOK;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }

    /**
     * 收到所有的通知消息并返回消息
     * @auther BruceLee
     * @return
     */
    public List<Notice> receiveNotice(int uid,int nowPage) {
        try {
            List<Notice> allNotice=getSqlSession().getMapper(UserDAO.class).receiveNotice(uid,(nowPage-1)*7);
            System.out.println("查询到的通知消息："+allNotice);
            return allNotice;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    /**
     * 收到未读通知的数量
     * @auther BruceLee
     * @return
     */
    @Override
    public int listNotReadNoticeNum(int uid) {
        try {
            int notReadNoticeNum=getSqlSession().getMapper(UserDAO.class).listNotReadNoticeNum(uid);
            return notReadNoticeNum;

        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /**
     * 收到未读私信的数量
     * @auther BruceLee
     * @return
     */
    @Override
    public int listNotReadMessageNum(int uid) {
        try {
            int notReadMessageNum=getSqlSession().getMapper(UserDAO.class).listNotReadMessageNum(uid);
            return notReadMessageNum;

        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
    /**
     * 收到所有通知的数量
     * @auther BruceLee
     * @return
     */
    @Override
    public int listAllNoticeNum(int uid) {
        try {
            int AllNoticeNum=getSqlSession().getMapper(UserDAO.class).listAllNoticeNum(uid);
            return AllNoticeNum;

        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public int listAllMessageNum(int uid) {
        try {
            int allMessageNum=getSqlSession().getMapper(UserDAO.class).listAllMessageNum(uid);
            return allMessageNum;

        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public List<Message> receiveMessage(int uid,int nowPage) {
        try {
            List<Message> allMessages=getSqlSession().getMapper(UserDAO.class).receiveMessage(uid,(nowPage-1)*5);
            System.out.println("查询到的私信："+allMessages);
            return allMessages;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 查询消息发送方的用户信息
     * @param uid
     * @return
     */
    @Override
    public List<User> listSendMessageUser(int uid) {
        try{
            List<User> sendMessageUsers=getSqlSession().getMapper(UserDAO.class).listSendMessageUser(uid);
            return sendMessageUsers;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 根据传入的参数来判断通知是已读还是未读进行更改状态
     * @author BruceLee
     * @param isRead
     * @return
     */
    @Override
    public boolean changeIsRead(int isRead,int uid) {
        try{
            getSqlSession().getMapper(UserDAO.class).changeIsRead(isRead,uid);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }


    }
    /**
     * 根据传入的参数来判断私信是已读还是未读进行更改状态
     * @author BruceLee
     * @param isRead
     * @return
     */
    @Override
    public boolean changeMessageIsRead(int isRead, int uid) {
        try{
            getSqlSession().getMapper(UserDAO.class).changeMessageIsRead(isRead,uid);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public User getId(int uid) {
        User u=getSqlSession().getMapper(UserDAO.class).getId(uid);
        return u;
    }

    @Override
    public User checkPhone(String phone) {
       User u=getSqlSession().getMapper(UserDAO.class).checkPhone(phone);
        return u;
    }

    @Override
    public User checkEmail(String email) {
        User u=getSqlSession().getMapper(UserDAO.class).checkEmail(email);
        return u;
    }

    /**
     * 添加基于某个用户的各种通知信息（被关注，评论，点赞，举报等消息）
     * @author BruceLee
     * @param notice
     * @return
     */
    @Override
    public boolean addNotice(Notice notice) {
        try{
            getSqlSession().getMapper(UserDAO.class).addNotice(notice);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;

        }
    }

    /**
     * 清空某个用户所有的通知消息
     * @author BruceLee
     * @param uid
     * @return
     */
    @Override
    public boolean deleteNotice(int uid) {
        try{
            getSqlSession().getMapper(UserDAO.class).deleteNotice(uid);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    /**
     * 清空某个用户所有的私信
     * @author BruceLee
     * @param uid
     * @return
     */
    @Override
    public boolean deleteMessage(int uid) {
        try{
            getSqlSession().getMapper(UserDAO.class).deleteMessage(uid);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
    /**
     * 删除用户选中的关注好友
     * @author BruceLee
     * @return
     */
    @Override
    public boolean deleteChooseFriend(int selfid, int attenid) {
        try{
            getSqlSession().getMapper(UserDAO.class).deleteChooseFriend(selfid, attenid);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 发送私信fromID--toID
     * @author BruceLee
     * @param message
     * @return
     */
    @Override
    public boolean sendMessage(Message message) {
        try{
            getSqlSession().getMapper(UserDAO.class).sendMessage(message);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 检测发送消息的双方是否为关注与被关注的关系
     * @author BruceLee
     * @param selfid
     * @param attenid
     * @return
     */
    @Override
    public List checkIsAttention(int selfid, int attenid) {
        try{
            System.out.println(selfid+"+"+attenid);
            List result= getSqlSession().getMapper(UserDAO.class).checkIsAttention(selfid,attenid);
            System.out.println("result="+result);
            if(result!=null){
                return result;
            }else{
                return null;

            }
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    /**
     * 根据登录的用户id查询到该用户关注的所有的用户
     * @author BruceLee
     * @param uid
     * @return
     */
    @Override
    public List listAllFriends(int uid,int nowPage) {
        try{
            List allFriends=getSqlSession().getMapper(UserDAO.class).listAllFriends(uid,(nowPage-1)*5);
            return allFriends;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public List FindAllFriendsOfThisUser(int selfid) {
        try{
            List allFriendsOfThisUser=getSqlSession().getMapper(UserDAO.class).FindAllFriendsOfThisUser(selfid);
            return allFriendsOfThisUser;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List searchFriend(String nickname, int uid) {
        try{
            List searchedFriend=getSqlSession().getMapper(UserDAO.class).searchFriend(nickname, uid);
            return searchedFriend;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List listAllFans(int uid) {
        try{
            List allFans=getSqlSession().getMapper(UserDAO.class).listAllFans(uid);
            return allFans;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 查询该用户好友的数量用来做分页限制
     * @author BruceLee
     * @param selfid
     * @return
     */
    @Override
    public int friendNum(int selfid) {
        try{
            int friendNum=getSqlSession().getMapper(UserDAO.class).friendNum(selfid);
            System.out.println("好友数量"+friendNum);
            return friendNum;
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public User loginByEmail(String email, String password) {
        System.out.println("XXXX"+email+password);
        return  getSqlSession().getMapper(UserDAO.class).loginByEmail(email,password);
    }

    @Override
    public User loginByPhone(String phone, String password) {
        return getSqlSession().getMapper(UserDAO.class).loginByPhone(phone,password);
    }

    //修改用户资料
    @Override
    public boolean updateUser(User  user) {
        boolean b=getSqlSession().getMapper(UserDAO.class).updateUser(user);
        return b;
    }

    @Override
    public boolean updateUserImg(String picturepath, int uid) {
        return getSqlSession().getMapper(UserDAO.class).updateUserImg(picturepath,uid);
    }

    //修改用户密码
    @Override
    public boolean updatePassword(User user) {
        boolean b=getSqlSession().getMapper(UserDAO.class).updatePassword(user);
        return b;
    }
    //修改用户邮箱
    @Override
    public boolean updateEmail(User user) {
        boolean b=getSqlSession().getMapper(UserDAO.class).updateEmail(user);
        return b;
    }

    @Override
    public boolean updatePhone(@Param("phone") String phone,@Param("uid") int uid) {
        return getSqlSession().getMapper(UserDAO.class).updatePhone(phone, uid);
    }

    //用户等级
    @Override
    public int  userGrade(int uid) {
        int score=getSqlSession().getMapper(UserDAO.class).userGrade(uid);
        return score;
    }

    /**
     * 通过登录的用户ID获取其积分记录
     * @param uid
     * @return
     */
    @Override
    public List<Scoring> getScoring(int uid) {
        List<Scoring> scorings=getSqlSession().getMapper(UserDAO.class).getScoring(uid);
        return scorings;
    }

    //积分消费账单
    @Override
    public List<Scoring> costScoring(int uid) {
        List<Scoring> scorings=getSqlSession().getMapper(UserDAO.class).costScoring(uid);
        return scorings;
    }
    //积分充值
    @Override
    public List<Scoring> rechargeScoring(int uid) {
        List<Scoring> scorings=getSqlSession().getMapper(UserDAO.class).rechargeScoring(uid);
        return scorings;
    }

    /**
     * 我的关注列表
     * @param uid
     * @return
     */
    @Override
    public List<User> myAttention(int uid) {
        List<User> users=getSqlSession().getMapper(UserDAO.class).myAttention(uid);
        return users;
    }

    /**
     * 我的粉丝
     * @param uid
     * @return
     */
    @Override
    public List<User> myFans(int uid) {
        List<User> users=getSqlSession().getMapper(UserDAO.class).myFans(uid);
        return users;
    }

    @Override
    public List<User> getUserBySpeak(int page) {
        List<User> isSpeakUser=null;
        try {
            isSpeakUser=getSqlSession().getMapper(UserDAO.class).getUserBySpeak((page-1)*5);
        }catch (Exception e){
            e.printStackTrace();
        }
        return isSpeakUser;
    }

    @Override
    public boolean isSpeaktoTrue(int uid) {
        boolean isOk=false;
        try {
            isOk=getSqlSession().getMapper(UserDAO.class).isSpeaktoTrue(uid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return isOk;
    }

    @Override
    public int getIsspeakNum() {
        int num=0;
        try {
            num=getSqlSession().getMapper(UserDAO.class).getIsspeakNum();
        }catch (Exception e){
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public User getUserInfo(int uid) {
        return getSqlSession().getMapper(UserDAO.class).getUserInfo(uid);
    }


}
