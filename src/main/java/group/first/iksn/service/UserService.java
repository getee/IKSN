package group.first.iksn.service;

import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;

import java.util.List;

public interface UserService {
    boolean register(User u);
    List<Notice> receiveNotice();
}
