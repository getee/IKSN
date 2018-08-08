package group.first.iksn.control;

import group.first.iksn.model.bean.User;
import group.first.iksn.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
