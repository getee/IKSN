package group.first.iksn.control;

import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;
import group.first.iksn.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserControl {
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public UserService getUserService() {
        return userService;
    }

    @RequestMapping("/register")
    public String register(@ModelAttribute("user") User user) {
        System.out.println("register");
        boolean isRegister = userService.register(user);
        if (isRegister) {
            return "index";
        }
        return "zhuce";
    }

    /**
     * 收到的通知消息
     * @return
     */
    @RequestMapping("/receiveNotice")
    public String receiveNotice(Model model){
        System.out.println("receiveNotice");
        List<Notice> allNotices=userService.receiveNotice();
        model.addAttribute("allNotices",allNotices);
        return "tongzhi";
    }
}
