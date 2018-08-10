package group.first.iksn.model.dao;

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
            System.out.println("应该先判断用户已存在，避免之后再捕获");
            e.printStackTrace();
            return false;
        }

    }

    /**
     * 收到所有的通知消息并返回消息
     * @auther BruceLee
     * @return
     */
    public List<Notice> receiveNotice() {
        try {
            List<Notice> allNotice=getSqlSession().getMapper(UserDAO.class).receiveNotice();
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
    public boolean changeIsRead(int isRead) {
        try{
            getSqlSession().getMapper(UserDAO.class).changeIsRead(isRead);
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
}
