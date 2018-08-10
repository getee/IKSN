package group.first.iksn.control;

import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;
import group.first.iksn.service.UserService;
import group.first.iksn.util.HttpUtil;
import group.first.iksn.util.IndustrySMS;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



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
    public String register(@ModelAttribute("register") User user) {
        System.out.println("register");
        boolean isRegister = userService.register(user);
        if (isRegister) {
            return "index";
        }
        return "zhuce";
    }

    /**
     * 收到的通知消息
     * @author BruceLee
     * @return
     */
    @RequestMapping("/receiveNotice")
    public String receiveNotice(Model model){
        System.out.println("receiveNotice");
        List<Notice> allNotices=userService.receiveNotice();
        model.addAttribute("allNotices",allNotices);
        return "tongzhi";
    }
    /**
     * 本方法用于前台注册页面获取手机验证码
     */
    @RequestMapping("/captcha")
    public void getCaptcha(@RequestParam("to") String p, Model model){
        String  captcha= HttpUtil.captcha();
        String smsContent = "【联知科技】您的验证码为{"+captcha+"}，请于{1}分钟内正确输入，如非本人操作，请忽略此短信。";
        IndustrySMS.execute(smsContent,p);
        model.addAttribute("caprcha",captcha);
    }
    //判断手机号是否重复
    @RequestMapping("checkphone")
    public  String checkPhone(@RequestParam("phone") String phone,Model model) {
        boolean flag=userService.checkPhone(phone);
        model.addAttribute("chmessage",flag);
        System.out.println("手机号是否存在结果："+flag);
        return "index";
    }
}
