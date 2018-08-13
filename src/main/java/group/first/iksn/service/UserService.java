package group.first.iksn.service;

import group.first.iksn.model.bean.User;

import java.util.List;

public interface UserService {
    //注册用户
    boolean register(User u);
    //检查用户注册时手机号是否被注册过
    boolean checkPhone(String p);

    List receiveNotice();
    //检查邮箱是否重复
    boolean checkEmail(String eamil);

    //修改用户资料
    User updateUser(User user);

    //判断用户是否存在
    public boolean isUserExist(int uid);
    //修改用户密码
    public void updatePassword(int uid,String newpassword);

    public String getId(int uid);


}
