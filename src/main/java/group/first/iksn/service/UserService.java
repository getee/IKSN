package group.first.iksn.service;

import group.first.iksn.model.bean.User;

public interface UserService {
    boolean register(User u);
    //检查用户注册时手机号是否被注册过
    boolean checkPhone(String p);
}
