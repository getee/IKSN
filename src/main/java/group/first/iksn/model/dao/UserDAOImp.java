package group.first.iksn.model.dao;

import group.first.iksn.model.bean.Attention;
import group.first.iksn.model.bean.Message;
import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;
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
    public List<Notice> receiveNotice(int uid) {
        try {
            List<Notice> allNotice=getSqlSession().getMapper(UserDAO.class).receiveNotice(uid);
            System.out.println("查询到的通知消息："+allNotice);
            return allNotice;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 根据传入的参数来判断是已读还是未读进行更改状态
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

    public User getId(int uid) {

        return null;
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
}
