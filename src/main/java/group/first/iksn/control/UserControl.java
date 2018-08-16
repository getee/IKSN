package group.first.iksn.control;

import com.sun.org.glassfish.gmbal.ParameterNames;
import group.first.iksn.model.bean.Message;
import com.sun.deploy.net.HttpResponse;
import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.Scoring;
import group.first.iksn.model.bean.User;
import group.first.iksn.service.UserService;
import group.first.iksn.util.EncodingTool;
import group.first.iksn.util.HttpUtil;
import group.first.iksn.util.IndustrySMS;
import org.apache.ibatis.jdbc.Null;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import org.springframework.web.bind.annotation.*;
import sun.nio.cs.ext.ISO_8859_11;
import org.springframework.web.servlet.ModelAndView;


import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

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
    public String login(String iscollect, String emailorphone, String password, HttpSession session, HttpServletResponse response,Model model){
        User user=userService.login(emailorphone,password);
        Cookie nameCookie=new Cookie("nameCookie",emailorphone);
        Cookie passwordCookie=new Cookie("passwordCookie",password);
        System.out.println(iscollect);
        if (user!=null){
            List<User> allFriendOfThisUser=userService.FindAllFriendsOfThisUser(user.getUid());
            session.setAttribute("loginresult",user);
            session.setAttribute("allFriendOfThisUser",allFriendOfThisUser);
            model.addAttribute("logmes",true);
            System.out.println(model);
            if(iscollect!=null){
                nameCookie.setMaxAge(60*60*24*7);
                passwordCookie.setMaxAge(60*60*24*7);
                nameCookie.setPath("/");
                passwordCookie.setPath("/");
                response.addCookie(nameCookie);
                response.addCookie(passwordCookie);
            }
        }
        else {
            model.addAttribute("logmes",false);
            System.out.println(model);
        }

        return "index";
    }
    //退出登录
    @RequestMapping("/exit")
    public String  exit(HttpSession session){
        session.removeAttribute("loginresult");
        return "index";
    }

    /**
     * 查询收到的通知消息
     * @author BruceLee
     * @return
     */
    @RequestMapping("/receiveNotice/{uid}/{nowPage}")
    public String receiveNotice(@PathVariable("uid") int uid,@PathVariable("nowPage") int nowPage,Model model){
        List<Notice> allNotices=userService.receiveNotice(uid,nowPage);//遍历出所有的通知
        int notReadNoticeNum=userService.listNotReadNoticeNum(uid);
        int AllNoticeNum=userService.listAllNoticeNum(uid);
        model.addAttribute("nowNoticePage",nowPage);
        model.addAttribute("AllNoticeNum",AllNoticeNum);
        model.addAttribute("notReadNum",notReadNoticeNum);//返回未读的消息数量
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
            int notReadNoticeNum=userService.listNotReadNoticeNum(uid);
            return String.valueOf(notReadNoticeNum);//ajax返回未读数量，进行实时更新
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
    public String  sendMessage(HttpServletRequest request,@PathVariable("fromid") int fromid,Model model){

        String[] everyToId=request.getParameter("toid").split(",");
        for (int i=0;i<everyToId.length;i++){
            Message message=new Message();
            message.setFromid(fromid);
            message.setToid(Integer.parseInt(everyToId[i]));
            message.setContent(request.getParameter("content"));
            Date d = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            message.setTime(df.format(d));


          // message.setTime(new Date().toLocaleString());
            boolean result=userService.sendMessage(message);
            if(result){
                model.addAttribute("sendResult","sendSuccess");

            }else{
                model.addAttribute("sendResult","sendError");

            }
        }

        return "wodexiaoxi";
    }

    /**
     * 列出该用户所有关注的好友(分页查询，并不是所有的用户)
     * @author BruceLee
     * @param uid
     * @return
     */
    @RequestMapping("/listAllFriends/{uid}/{nowPage}")
        public String listAllFriends(@PathVariable("uid") int uid,@PathVariable("nowPage") int nowPage,Model model){
        List<User> allFriends=userService.listAllFriends(uid, nowPage);

        int friendNums=userService.friendNum(uid);
        model.addAttribute("allFriends",allFriends);
        model.addAttribute("nowPage",nowPage);
        model.addAttribute("friendNums",friendNums);

        return "wodexiaoxi";
        }

    /**
     * 根据NickName查询该用户的好友
     * @author BruceLee
     * @return
     */
    @RequestMapping("/searchFriend/{uid}/{friendNickName}")
    @ResponseBody
        public void searchFriend(HttpServletResponse response,@PathVariable("uid") int uid, @PathVariable("friendNickName") String friendNickName){
        System.out.println(EncodingTool.encodeStr(friendNickName));
        List<User> searchedFriend=userService.searchFriend(EncodingTool.encodeStr(friendNickName),uid);
            JSONArray jsonArray=new JSONArray();
        for (User u:searchedFriend) {
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("uid",u.getUid());
            jsonObject.put("nickname",u.getNickname());
            jsonObject.put("picturepath",u.getPicturepath());
            jsonObject.put("introduce",u.getIntroduce());
            jsonArray.put(jsonObject);
        }
            response.setContentType("text/json;charset=utf-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(jsonArray.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //return null;
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
     * 定时刷新新的通知及时提示用户
     * @author BruceLee
     * @return
     */
    @RequestMapping("/timingReceivingNotice/{uid}")
    @ResponseBody
    public String timingReceivingNotice(@PathVariable("uid") int uid){
        int nowNoticeNum=userService.listAllNoticeNum(uid);
        return String.valueOf(nowNoticeNum);
    }

    /**
     * 删除该用户选中的所有要删除关注的好友
     * @author BruceLee
     * @return
     */
    @RequestMapping("/deleteFriend/{uid}/{allFriendId}")
    @ResponseBody
    public String deleteFriend(@PathVariable("uid") int uid,@PathVariable("allFriendId") String  allFriendId){
        String[] everyFriendId=allFriendId.split(",");
        boolean deleteFriendResult=true;
        for (int i=0;i<everyFriendId.length;i++){
            deleteFriendResult=userService.deleteChooseFriend(uid,Integer.parseInt(everyFriendId[i]));
        }
        return deleteFriendResult==true?"success":"error";
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

    //修改用户资料
    @RequestMapping(value = "/updateuser")
    public String updateUser(User user, Model model) {
        System.out.println(user.getNickname() + "VVVVV" + user.getUid());
        System.out.println(user);
        User u = userService.updateUser(user);
        model.addAttribute("user", u);//把对象u传到前台；
        return "gerenzhongxin";
    }



    //修改用户密码
    @RequestMapping(value = "/updatePassword")
    public String updatePassword(@RequestParam("uid") int uid,
                                 @RequestParam("password") String password,
                                 @RequestParam("newpassword") String newpassword,
                                 @RequestParam("equelspassword") String equelspassword, ModelMap model) {
        System.out.println(uid);
        System.out.println(password);
        System.out.println(newpassword);
        if (!userService.isUserExist(uid)) {
            model.addAttribute("msg", "用户名不存在！");
        } else {
            if (password.equals(userService.getId(uid))) {
                if (!newpassword.equals(equelspassword)) {
                    model.addAttribute("msg", "密码不一致");
                } else {
                    userService.updatePassword(uid, newpassword);
                    model.addAttribute("msg", "修改密码成功！");
                    System.out.println("修改成功");
                }
            } else {
                model.addAttribute("msg", "密码错误！");
            }
        }
        return "zhanghao";
    }


    @RequestMapping(value = "userGrade")
    public int  userGrade(@RequestParam("uid") int uid, Model model) {
         int grade=userService.userGrade(uid);
         model.addAttribute("等级",grade);
         return grade;
    }
    //用户积分明细
    @RequestMapping("/getScoring")
    public ModelAndView getScoring(@RequestParam("uid") int uid){
        List<Scoring> scorings=userService.getScoring(uid);
        ModelAndView mav=new ModelAndView("myscore");
        mav.addObject("scorings",scorings);
        return mav;
    }
    //积分消费记录
    @RequestMapping("/costScoring")
    public ModelAndView costScoring(@RequestParam("uid") int uid){
        ModelAndView mad=new ModelAndView("jifenzhongxin");
        List<Scoring> scorings=userService.costScoring(uid);
        mad.addObject("cost",scorings);
        return mad;
    }
    //积分充值记录
    @RequestMapping("/rechargeScoring")
    public ModelAndView rechargeScoring(@RequestParam("uid") int uid){
        ModelAndView mad=new ModelAndView("jifenzhongxin");
        List<Scoring> scorings=userService.rechargeScoring(uid);
        mad.addObject("recharge",scorings);
        return mad;
    }

    //我的关注列表
    @RequestMapping("/myAttention")
    public void myAttention( HttpSession session,Model model,HttpServletResponse response) throws IOException {
        User u= (User) session.getAttribute("loginresult");
        int uid=u.getUid();
        ArrayList<User> users= (ArrayList<User>) userService.myAttention(uid);

        JSONArray jsonArray=new JSONArray();
        JSONObject jsonObject;
        for (int i=0;i<users.size();i++){
           jsonObject=new JSONObject();
           try{
               jsonObject.put("picturepath",users.get(i).getPicturepath());
               jsonObject.put("nickname",users.get(i).getNickname());
               jsonArray.put(jsonObject);
           }catch (JSONException e){
               e.printStackTrace();
           }
        }

        System.out.println(users);
        //悄悄把数据会给他
        //用response（响应）对象中的输出流将处理好的结果输出给ajax请求对象
        response.setContentType("textml;charset=UTF-8");//  textml     ,text/xml    ,text/json
        PrintWriter  out=response.getWriter();//获取响应对象中的输出流
        out.write(jsonArray.toString());
        out.flush();
        out.close();

    }
}