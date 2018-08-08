package group.first.iksn.model.dao;

import group.first.iksn.model.bean.User;
import org.springframework.stereotype.Component;

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

    public User getId(int uid) {

        return null;
    }
}
