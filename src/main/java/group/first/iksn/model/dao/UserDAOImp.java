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

    @Override
    public User loginByEmail(String email, String password) {
        return  getSqlSession().getMapper(UserDAO.class).loginByEmail(email,password);
    }

    @Override
    public User loginByPhone(String phone, String password) {
        return getSqlSession().getMapper(UserDAO.class).loginByPhone(phone,password);
    }
}
