package group.first.iksn.control;

import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;
import group.first.iksn.service.UserService;
import group.first.iksn.util.HttpUtil;
import group.first.iksn.util.IndustrySMS;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


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

    //注册方法
    @RequestMapping(value="/register",method= RequestMethod.POST)
    public String register(@ModelAttribute("register") User user,Model model) {
        System.out.println("register");
        boolean isRegister = userService.register(user);
        System.out.println(user);
        model.addAttribute("result",isRegister);
        return "index";
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
    /**
     * 本方法用于前台注册页面获取手机验证码
     */
    @RequestMapping("/captcha")
    public void getCaptcha(@RequestParam("to") String p, HttpServletRequest request, HttpServletResponse response){
            String  captcha= HttpUtil.captcha();
            String smsContent = "【联知科技】您的验证码为{"+captcha+"}，请于{1}分钟内正确输入，如非本人操作，请忽略此短信。";
            IndustrySMS.execute(smsContent,p);
        try  {
            PrintWriter pw = response.getWriter();
            pw.print(captcha);
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }
    //判断手机号是否重复
    @RequestMapping(value="/checkphone",method= RequestMethod.GET)
    public  void checkPhone(@RequestParam("phone") String phone, HttpServletRequest request, HttpServletResponse response) {
        boolean flag=userService.checkPhone(phone);
        System.out.println("手机号是否存在结果："+flag);

            try {
                PrintWriter pw=response.getWriter();
                if(flag==false){//证明数据库没有此手机号用户可以注册
                    pw.print("success");
                    return;
                }
                return;
            } catch (IOException e) {
                e.printStackTrace();
            }
    }
    //检查邮箱是否重复
    @RequestMapping(value="/checkemail",method= RequestMethod.GET)
    public  void checkEmail(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) {
        boolean flag=userService.checkEmail(email);
        try {
            PrintWriter pw=response.getWriter();
            if(flag==false){//证明数据库没有此手机号用户可以注册
                pw.print("success");
                return;
            }
            return;
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
