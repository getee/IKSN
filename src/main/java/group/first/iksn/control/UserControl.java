package group.first.iksn.control;

import group.first.iksn.model.bean.Message;
import group.first.iksn.model.bean.Notice;
import group.first.iksn.model.bean.Scoring;
import group.first.iksn.model.bean.User;
import group.first.iksn.service.UserService;
import group.first.iksn.util.*;
import jdk.nashorn.internal.objects.Global;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.jdbc.Null;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.Base64Utils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import java.io.*;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import sun.misc.BASE64Decoder;
import sun.nio.cs.ext.ISO_8859_11;
import org.springframework.web.servlet.ModelAndView;


import java.io.UnsupportedEncodingException;
import java.rmi.server.UID;
import java.sql.Blob;
import java.sql.SQLException;
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
            session.setAttribute("loginresult",user);
            List<User> allFriendOfThisUser=userService.FindAllFriendsOfThisUser(user.getUid());
            List<User> allFansOfThisUser=userService.listAllFans(user.getUid());

            //遍历筛选出我没有关注的粉丝
//          使用Collection的removeAll方法删除两个集合中相同元素，泛型中的User必须重写HashCode
            Collection notAttenedFans=new ArrayList<User>(allFansOfThisUser);
            notAttenedFans.removeAll(allFriendOfThisUser);
            System.out.println("未关注的粉丝"+notAttenedFans);
            session.setAttribute("allFriendOfThisUser",allFriendOfThisUser);
            session.setAttribute("notAttenedFans",notAttenedFans);

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
            model.addAttribute("logmes","false");
            System.out.println(model);
        }

        return "index";
    }
    //快速登陆
    @RequestMapping(value = "/quicklogin",method = RequestMethod.POST)
    public void quicklogin(@RequestParam("emailorphone")String emailorphone,@RequestParam("password") String password, HttpSession session, HttpServletResponse response){
        User user=userService.login(emailorphone,password);
        PrintWriter pw=null;
        try {
          pw =response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (user!=null){
            session.setAttribute("loginresult",user);
            List<User> allFriendOfThisUser=userService.FindAllFriendsOfThisUser(user.getUid());
            List<User> allFansOfThisUser=userService.listAllFans(user.getUid());
            //遍历筛选出我没有关注的粉丝
//          使用Collection的removeAll方法删除两个集合中相同元素，泛型中的User必须重写HashCode
            Collection notAttenedFans=new ArrayList<User>(allFansOfThisUser);
            notAttenedFans.removeAll(allFriendOfThisUser);
            System.out.println("未关注的粉丝"+notAttenedFans);
            session.setAttribute("allFriendOfThisUser",allFriendOfThisUser);
            session.setAttribute("notAttenedFans",notAttenedFans);
            pw.print("success");
        }
        else {
            pw.print("fail");
        }
    }
    //退出登录
    @RequestMapping("/exit")
    public String  exit(HttpSession session){
        session.removeAttribute("loginresult");
        return "index";
    }
    //登录后就开始查询该用户的好友
    @RequestMapping("/FindAllFriendsOfThisUser/{uid}")
    @ResponseBody
    public void FindAllFriendsOfThisUser(@PathVariable("uid") int uid,HttpSession session){
        List<User> allFriendOfThisUser=userService.FindAllFriendsOfThisUser(uid);
        List<User> allFansOfThisUser=userService.listAllFans(uid);
        Collection notAttenedFans=new ArrayList<User>(allFansOfThisUser);
        notAttenedFans.removeAll(allFriendOfThisUser);
        System.out.println("未关注的粉丝"+notAttenedFans);
        session.setAttribute("allFriendOfThisUser",allFriendOfThisUser);
        session.setAttribute("notAttenedFans",notAttenedFans);
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
        model.addAttribute("allNotices",allNotices);//返回第一页所有的消息
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
            int notReadMessageNum=userService.listNotReadMessageNum(uid);//遍历出所有的通知

            return String.valueOf(notReadMessageNum);//ajax返回未读数量，进行实时更新
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
    @ResponseBody
    public String   sendMessage(HttpServletRequest request,@PathVariable("fromid") int fromid,Model model){


        System.out.println("toid:"+request.getParameter("toid"));
        System.out.println("content:"+EncodingTool.encodeStr(request.getParameter("content")));
        String[] everyToId=request.getParameter("toid").split(",");
        for (int i=0;i<everyToId.length;i++){
            Message message=new Message();
            message.setFromid(fromid);
            message.setToid(Integer.parseInt(everyToId[i]));
            message.setContent(EncodingTool.encodeStr(request.getParameter("content")));
            Date d = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            message.setTime(df.format(d));


          // message.setTime(new Date().toLocaleString());
            boolean result=userService.sendMessage(message);
            if(result){
               // model.addAttribute("sendResult","sendSuccess");

            }else{
                //model.addAttribute("sendResult","sendError");
                return "error";
            }
        }

        return "success";

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
    @RequestMapping("/receiveMessage/{uid}/{nowPage}")
    public String receiveMessage(@PathVariable("uid") int uid,@PathVariable("nowPage") int nowPage,Model model){
        List<User> allSendMessageUsers=userService.listSendMessageUser(uid);
        List<Message> allMessages=userService.receiveMessage(uid,nowPage);//遍历该用户第一页的私信
        int allMessageNum=userService.listAllMessageNum(uid);
        int notReadMessageNum=userService.listNotReadMessageNum(uid);
        model.addAttribute("nowMessagePage",nowPage);
        model.addAttribute("notReadMessageNum",notReadMessageNum);//返回未读的消息数量
        model.addAttribute("allMessages",allMessages);//返回所有第一页的私信
        model.addAttribute("allSendMessageUsers",allSendMessageUsers);
        model.addAttribute("allMessageNum",allMessageNum);
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
        //int nowNoticeNum=userService.listAllNoticeNum(uid);
        int notReadNoticeNum=userService.listNotReadNoticeNum(uid);
        return String.valueOf(notReadNoticeNum);
    }

    /**
     * 定时刷新新的私信及时提示用户
     * @author BruceLee
     * @return
     */
    @RequestMapping("/timingReceivingMessage/{uid}")
    @ResponseBody
    public String timingReceivingMessage(@PathVariable("uid") int uid){
        //int nowNoticeNum=userService.listAllNoticeNum(uid);
        int notReadMessageNum=userService.listNotReadMessageNum(uid);
        return String.valueOf(notReadMessageNum);
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

    /**
     * 上传头像
     * @author BruceLee
     * @return
     */
    @RequestMapping(value = "/uploadImg/{uid}",method =RequestMethod.POST)
    @ResponseBody
    public String uploadImg(@PathVariable("uid") int uid,HttpServletRequest request){
        String img=request.getParameter("img");
        if(StringUtils.isEmpty(img)){
            return null;
        }
        //使用Spring中的帮助类来解析base64
        BASE64Decoder decoder = new BASE64Decoder();

        String savePath=request.getSession().getServletContext().getRealPath("/img");
        String fileName=UUID.randomUUID().toString().replace("-","");
        String suffix = "";//文件后缀名
        String dataPrix = "";
        String data = "";
        System.out.println("jinlaile上传"+img);
        if(img==null&&img.equals("")){
            return "error";
        }else{
            String [] d = img.split("base64,");
            if(d != null && d.length == 2){
                dataPrix = d[0];
                data = d[1];
            }else{
                return "error";
            }
        }
        if("data:image/jpeg;".equalsIgnoreCase(dataPrix)){//data:image/jpeg;base64,base64编码的jpeg图片数据
            suffix = ".jpg";
        } else if("data:image/x-icon;".equalsIgnoreCase(dataPrix)){//data:image/x-icon;base64,base64编码的icon图片数据
            suffix = ".ico";
        } else if("data:image/gif;".equalsIgnoreCase(dataPrix)){//data:image/gif;base64,base64编码的gif图片数据
            suffix = ".gif";
        } else if("data:image/png;".equalsIgnoreCase(dataPrix)){//data:image/png;base64,base64编码的png图片数据
            suffix = ".png";
        }else{
            return "error";
        }
        File file=new File(savePath);
        String picPath=file+"\\"+fileName+suffix;
        try {
            byte[] buffer=decoder.decodeBuffer(data);
            OutputStream outputStream=new FileOutputStream(picPath);
            outputStream.write(buffer);
            outputStream.flush();
            outputStream.close();
            System.out.println(picPath);
            //上传成功后先删除之前的头像，在更新用户的头像
            String oldPicturePath=userService.getId(uid).getPicturepath();// img/**.png
            String oldPictureName=oldPicturePath.split("/")[1];
            File target=new File(savePath,oldPictureName);
            File moren=new File(savePath,"moren.jpg");
            if(target.exists()){
                if(!target.equals(moren)){//判断该用户旧头像存在且不为默认的就删除
                    target.delete();
                }
            }
            boolean result=userService.updateUserImg("img/"+fileName+suffix,uid);
            if(result){
                User u=userService.getId(uid);
                request.getSession().setAttribute("loginresult",u);
            }
            return "ok";
        } catch (IOException e) {
            e.printStackTrace();
            return "error";
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
            System.out.println(userService.getId(uid));
            System.out.println(MD5.MD5(password));
            String str=userService.getId(uid).getPassword();
            System.out.println(str);
            if (MD5.MD5(password).equals(str)) {

                    System.out.println("jinru");
                    userService.updatePassword(uid, newpassword);
                    model.addAttribute("msg", "修改密码成功！");
                    System.out.println("修改成功");
            } else {
                model.addAttribute("msg", "密码错误！");
            }
        return "zhanghao";
    }

    //修改用户邮箱
    @RequestMapping(value = "/updateEmail")
    public String updateEmail(@RequestParam("uid") int uid,
                                 @RequestParam("email") String email,
                                 @RequestParam("newemail") String newemail,
                                 @RequestParam("equelsemail") String equelsemail, ModelMap model) {
        System.out.println(uid);
        System.out.println(email);
        System.out.println(newemail);
            if (email.equals(userService.getId(uid).getEmail())) {
                if (!newemail.equals(equelsemail)) {
                    model.addAttribute("msg", "密码不一致");
                } else {
                    userService.updateEmail(uid, newemail);
                    model.addAttribute("msg", "修改邮箱成功！");
                    System.out.println("修改成功");
                }
            } else {
                model.addAttribute("msg", "密码错误！");
            }
        return "zhanghao";
    }
    //修改用户手机号
    @RequestMapping("updatephone")
    public  void updatePhone(@RequestParam("phone")String phone,@RequestParam("uid")int uid,HttpServletResponse response){
        boolean flag=userService.updatePhone(phone, uid);
        PrintWriter pw=null;
        try{
            pw=response.getWriter();
            if(flag==true) {
                pw.print("success");
            }
            else {
                pw.print("fail");
            }
        }
        catch (IOException e){
            e.printStackTrace();
        }
    }
    //用户等级
    @RequestMapping(value = "userGrade")
    public int  userGrade(@RequestParam("uid") int uid, Model model) {
         int grade=userService.userGrade(uid);
         model.addAttribute("等级",grade);
         return grade;
    }
    //用户积分明细
    @RequestMapping("/getScoring")
    public void getScoring(@RequestParam("uid") int uid,HttpServletResponse response) throws IOException {
        List<Scoring> scorings=userService.getScoring(uid);
        JSONArray jsonArray=new JSONArray();
        JSONObject jsonObject;
        for (int i=0;i<scorings.size();i++){
            jsonObject=new JSONObject();
            try{
                jsonObject.put("state",scorings.get(i).getState());
                jsonObject.put("number",scorings.get(i).getNumber());
                jsonObject.put("operation",scorings.get(i).getOperation());
                jsonObject.put("time",scorings.get(i).getTime());
                jsonArray.put(jsonObject);
            }catch (JSONException e){
                e.printStackTrace();
            }
        }

        System.out.println("积分明细："+scorings);
        //悄悄把数据会给他
        //用response（响应）对象中的输出流将处理好的结果输出给ajax请求对象
        response.setContentType("textml;charset=UTF-8");//  textml     ,text/xml    ,text/json
        PrintWriter  out=response.getWriter();//获取响应对象中的输出流
        out.write(jsonArray.toString());
        out.flush();
        out.close();
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

//查询用户密码
    @RequestMapping(value="/checkPassword", method = RequestMethod.POST)
    public void checkPassword(
                              HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("jinruXXXX");
        boolean result=false;
        String uid=request.getParameter("uid").trim();
        String password=request.getParameter("password").trim();
        System.out.println(password+uid);
        System.out.println(userService.getId(Integer.parseInt(uid)).getPassword());
       if (MD5.MD5(password).equals(userService.getId(Integer.parseInt(uid)).getPassword())){
           System.out.println("ok");
                  result=true;
       }else {
           System.out.println("error");
             result=false;
       }
        response.getWriter().write(""+result);
    }

    //查询用户邮箱
    @RequestMapping(value="/checkEmail", method = RequestMethod.POST)
    public void checkEmail(
            HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("jinru111");
        boolean result=false;
        String uid=request.getParameter("uid").trim();
        String email=request.getParameter("email").trim();
        System.out.println(email+uid);
        System.out.println(userService.getId(Integer.parseInt(uid)).getEmail());
        if (email.equals(userService.getId(Integer.parseInt(uid)).getEmail())){
            System.out.println("ok");
            result=true;
        }else {
            System.out.println("error");
            result=false;
        }
        response.getWriter().write(""+result);
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

    //我的粉丝
    @RequestMapping("/myFans")
    public void myFans( HttpSession session,Model model,HttpServletResponse response) throws IOException {
        User u= (User) session.getAttribute("loginresult");
        int uid=u.getUid();
        ArrayList<User> users= (ArrayList<User>) userService.myFans(uid);

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

    /**
     * 获取被禁言的用户
     * wenbin
     * @param response
     * @param request
     */
    @RequestMapping("/UserByIsSpeak/{page}")
    @ResponseBody
    public void UserByIsSpeak(@PathVariable int page,HttpServletResponse response,HttpServletRequest request){
        List<User> speakUsers=userService.getUserBySpeak(page);
       for (User u:speakUsers){
           System.out.println(u);
       }
       int num=userService.getIsspeakNum();
        JSONArray jsonArray=new JSONArray();
       for (User u:speakUsers){
           JSONObject j=new JSONObject();
           j.put("uid",u.getUid());
           j.put("nickName",u.getNickname());
           j.put("sex",u.getSex());
           j.put("email",u.getEmail());
           j.put("phone",u.getPhone());
           j.put("time",u.getTimeofban());
           jsonArray.put(j);
       }
        JSONObject jsonObjectTwo=new JSONObject();
       jsonObjectTwo.put("num",num);
       jsonArray.put(jsonObjectTwo);
        try {
            Responser.responseToJson(response,request,jsonArray.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 解除禁言
     * wenbin
     * @param uid
     * @return
     */
    @RequestMapping("/isSpeaktoTrue/{uid}")
    @ResponseBody
    public String isSpeaktoTrue(@PathVariable int uid){
        boolean result=userService.isSpeaktoTrue(uid);
        if(result==true){
            return "success";
        }else {
            return "error";
        }
    }

    /*
    点击博客页面昵称通过ID获取他人的信息到他人中心页面
     */
    @RequestMapping("/getUserInfo")
    public String getUserInfo(int uid,Model model){
        User user=userService.getUserInfo(uid);
        model.addAttribute("user",user);
        return "tarenzhongxin";
    }
}