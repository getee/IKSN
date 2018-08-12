package group.first.iksn.control;

import com.sun.org.glassfish.gmbal.ParameterNames;
import group.first.iksn.model.bean.Message;
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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import org.springframework.web.bind.annotation.*;


import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Date;
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
    //登录方法
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String emailorphone, String password, HttpSession session,Model model){
        User user=userService.login(emailorphone,password);

        if (user!=null){
            session.setAttribute("loginresult",user);
            model.addAttribute("logmes",true);
            System.out.println(model);
        }
        else {
            model.addAttribute("logmes",false);
            System.out.println(model);
        }


        return "index";
    }

    /**
     * 查询收到的通知消息
     * @author BruceLee
     * @return
     */
    @RequestMapping("/receiveNotice/{uid}")
    public String receiveNotice(@PathVariable("uid") int uid, Model model){
        int index=0;//定义一个计数器来记录未读的通知数量
        List<Notice> allNotices=userService.receiveNotice(uid);//遍历出所有的通知
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
    @RequestMapping("/changeIsRead/{isRead}/{uid}")
    @ResponseBody
    public String changeIsRead(@PathVariable("isRead") int isRead,@PathVariable("uid") int uid){
        boolean result=userService.changeIsRead(isRead,uid);//isRead 为前台传入的参数0或者1，表示已读或者未读
        if(result){
            int index=0;//定义一个计数器来记录未读的通知数量
            List<Notice> allNotices=userService.receiveNotice(uid);//遍历出所有的通知
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
     * 更改私信是已读或者是未读
     * @author BruceLee
     * @return
     */
    @RequestMapping("/changeMessageIsRead/{isRead}/{uid}")
    @ResponseBody
    public String changeMessageIsRead(@PathVariable("isRead") int isRead,@PathVariable("uid") int uid){
        boolean result=userService.changeMessageIsRead(isRead,uid);//isRead 为前台传入的参数0或者1，表示已读或者未读
        if(result){
            int index=0;//定义一个计数器来记录未读的通知数量
            List<Message> allMessage=userService.receiveMessage(uid);//遍历出所有的通知
            for (Message message:allMessage) {
                if(message.getIsread()==0){
                    index+=1;
                }
            }
            return String.valueOf(index);//ajax返回未读数量，进行实时更新
        }else{
            return null;
        }
    }

    /**
     * 清空该用户下所有的通知消息
     * @author BruceLee
     */
    @RequestMapping("/deleteNotice/{uid}")
    @ResponseBody
    public void deleteNotice(@PathVariable("uid") int uid){
        boolean result=userService.deleteNotice(uid);

    }
    /**
     * 清空该用户所有的私信
     * @author BruceLee
     */
    @RequestMapping("/deleteMessage/{uid}")
    @ResponseBody
    public void deleteMessage(@PathVariable("uid") int uid){
        boolean result=userService.deleteMessage(uid);

    }

    /**
     * 该方法用来发送私信,从前台取到登录用户的id，表单取到发送的id和内容
     * @author BruceLee
     * @return
     */
    @RequestMapping("/sendMessage/{fromid}")
    public String  sendMessage(@ModelAttribute("sendMessage")Message message,@PathVariable("fromid") int fromid,Model model){
        //Calendar calendar=Calendar.getInstance();
        message.setFromid(fromid);
//        try {
//            String content=new String(message.getContent().getBytes("ISO-8859-1"),"utf-8");
//            message.setContent(content);
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        message.setTime(new Date().toLocaleString());
        try{
            System.out.println(message);
            boolean result=userService.sendMessage(message);
            if(result){
                model.addAttribute("sendResult","sendSuccess");

            }else{
                model.addAttribute("sendResult","sendError");

            }
        }catch (Exception e){
            model.addAttribute("sendResult","sendError");
            e.printStackTrace();
        }
        return "wodexiaoxi";
    }

    /**
     * 列出该用户所有关注的好友
     * @author BruceLee
     * @param uid
     * @return
     */
    @RequestMapping("/listAllFriends/{uid}/{nowPage}")
        public String listAllFriends(@PathVariable("uid") int uid,@PathVariable("nowPage") int nowPage,Model model){
        List<User> allFriends=userService.listAllFriends(uid, nowPage);
        System.out.println("1111");
        int friendNums=userService.friendNum(uid);
        System.out.println("2222");
        model.addAttribute("allFriends",allFriends);
        model.addAttribute("nowPage",nowPage);
        model.addAttribute("friendNums",friendNums);
        return "wodexiaoxi";
        }
    /**
     * 查询该用户收到的私信
     * @author BruceLee
     * @return
     */
    @RequestMapping("/receiveMessage/{uid}")
    public String receiveMessage(@PathVariable("uid") int uid,Model model){
        int index=0;//定义一个计数器来记录未读的通知数量
        List<User> allSendMessageUsers=userService.listSendMessageUser(uid);
        List<Message> allMessages=userService.receiveMessage(uid);//遍历该用户所有的私信
        for (Message message:allMessages) {
            if(message.getIsread()==0){
                index+=1;
            }
        }
        model.addAttribute("notReadMessageNum",index);//返回未读的消息数量
        model.addAttribute("allMessages",allMessages);//返回所有的消息
        model.addAttribute("allSendMessageUsers",allSendMessageUsers);
        return "shouxiaoxi";
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
