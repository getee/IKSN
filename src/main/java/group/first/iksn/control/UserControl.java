package group.first.iksn.control;

import com.sun.org.glassfish.gmbal.ParameterNames;
import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.User;
import group.first.iksn.service.UserService;
import group.first.iksn.util.HttpUtil;
import group.first.iksn.util.IndustrySMS;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


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
     * 查询收到的通知消息
     * @author BruceLee
     * @return
     */
    @RequestMapping("/receiveNotice")
    public String receiveNotice(Model model){
        int index=0;//定义一个计数器来记录未读的通知数量
        List<Notice> allNotices=userService.receiveNotice();//遍历出所有的通知
        for (Notice notice:allNotices) {
            if(notice.getIsread()==0){
                index+=1;
            }
        }
        model.addAttribute("notReadNum",index);//返回未读的消息数量
        model.addAttribute("allNotices",allNotices);//返回所有的消息
        return "tongzhi";
    }
    /**
     * 更改通知消息是已读或者是未读
     * @author BruceLee
     * @return
     */
    @RequestMapping("/changeIsRead/{isRead}")
    @ResponseBody
    public String changeIsRead(@PathVariable("isRead") int isRead){
        boolean result=userService.changeIsRead(isRead);//isRead 为前台传入的参数0或者1，表示已读或者未读
        if(result){
            int index=0;//定义一个计数器来记录未读的通知数量
            List<Notice> allNotices=userService.receiveNotice();//遍历出所有的通知
            for (Notice notice:allNotices) {
                if(notice.getIsread()==0){
                    index+=1;
                }
            }
            return String.valueOf(index);//ajax返回未读数量，进行实时更新
        }else{
            return null;
        }
    }

    /**
     * 清空所有的通知消息
     * @author BruceLee
     */
    @RequestMapping("/deleteNotice/{uid}")
    @ResponseBody
    public void deleteNotice(@PathVariable("uid") int uid){
        boolean result=userService.deleteNotice(uid);

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
