package group.first.iksn.control;


import group.first.iksn.model.bean.*;
import group.first.iksn.service.BlogService;
import group.first.iksn.service.UserService;
import group.first.iksn.util.EncodingTool;
import org.apache.ibatis.annotations.Param;
import group.first.iksn.util.Responser;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import group.first.iksn.util.Responser;
import group.first.iksn.util.LocalTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.apache.ibatis.jdbc.Null;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.json.Json;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/blog")
public class BlogControl {
    private BlogService blogService;
    private UserService userService;

    public BlogService getBlogService() {
        return blogService;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }


    /**
     * 首页分类推荐
     */
    @RequestMapping("/classifyPush")
    public String classifyPush(@RequestParam("classify") String classi,@RequestParam("page")String pp,HttpServletResponse response, HttpServletRequest request){
        int p=Integer.parseInt(pp);
        int classify=Integer.parseInt(classi);
        System.out.println("page:"+p);
        int page=p*5-5;
        List<Blog> al=blogService.classifyPush(classify,page);
        System.out.println(al);

        JSONArray ja=new JSONArray();
        for(Blog bl:al){
            JSONObject jo=new JSONObject();
            jo.put("bid",bl.getBid());
            jo.put("title",bl.getTitle());
            jo.put("content",bl.getContent().length()>100?bl.getContent().substring(0,100):bl.getContent());
            jo.put("points",bl.getPoints());
            jo.put("time",bl.getTime());
            if(bl.getClassify()==1){  jo.put("classify","移动开发");}
            else if(bl.getClassify()==2){  jo.put("classify","开发技术");}
            else if(bl.getClassify()==3){  jo.put("classify","课程资源");}
            else if(bl.getClassify()==4){  jo.put("classify","网络技术");}
            else if(bl.getClassify()==5){  jo.put("classify","操作系统");}
            else if(bl.getClassify()==6){  jo.put("classify","安全技术");}
            else  if(bl.getClassify()==7){  jo.put("classify","数据库");}
            else  if(bl.getClassify()==8){  jo.put("classify","服务器应用");}
            else if(bl.getClassify()==9){  jo.put("classify","存储");}
            else if(bl.getClassify()==10){  jo.put("classify","信息化");}
            ja.put(jo) ;
        }
        try {
            Responser.responseToJson( response,request,ja.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
        return  "index";


    }


    /**
     * 这是首页ajax推送的方法
     * @param pp
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/ajaxPush")
    public String ajaxPush(@RequestParam("page") String pp,HttpServletResponse response, HttpServletRequest request){
        int p=Integer.parseInt(pp);
        System.out.println("page:"+p);
        int page=p*5-5;
        System.out.println(page);

            List<Blog> al=blogService.ajaxBlogPush(page);
            System.out.println(al);

        JSONArray ja=new JSONArray();
        for(Blog bl:al){
            JSONObject jo=new JSONObject();
            jo.put("bid",bl.getBid());
            jo.put("title",bl.getTitle());
            jo.put("content",bl.getContent().length()>100?bl.getContent().substring(0,100):bl.getContent());
            jo.put("points",bl.getPoints());
            jo.put("time",bl.getTime());
            if(bl.getClassify()==1){  jo.put("classify","移动开发");}
            else if(bl.getClassify()==2){  jo.put("classify","开发技术");}
            else if(bl.getClassify()==3){  jo.put("classify","课程资源");}
            else if(bl.getClassify()==4){  jo.put("classify","网络技术");}
            else if(bl.getClassify()==5){  jo.put("classify","操作系统");}
            else if(bl.getClassify()==6){  jo.put("classify","安全技术");}
            else if(bl.getClassify()==7){  jo.put("classify","数据库");}
            else  if(bl.getClassify()==8){  jo.put("classify","服务器应用");}
            else  if(bl.getClassify()==9){  jo.put("classify","存储");}
            else if(bl.getClassify()==10){  jo.put("classify","信息化");}
            System.out.println();
             ja.put(jo);
        }
        try {
            Responser.responseToJson( response,request,ja.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
        return  "index";
    }


    /**
     * 这是搜索博客的方法
     * @param textcontent
     * @return
     */
    @RequestMapping(value = "/blogSearch")
    public ModelAndView blogSearch(@RequestParam("content") String textcontent ){
       // textcontent=EncodingTool.encodeStr(textcontent);//先将中文码ISO-8859-1转成UTF-8
        System.out.println("搜索的关键字:"+textcontent);
        ModelAndView mv=new ModelAndView();

       List<Blog> b= blogService.detailedBlogSearchResultMap(textcontent);
        System.out.println("标签:"+b);
        //添加blog分List<Blog>类和标题搜索
         b=blogService.blogTitle(textcontent);
       // b.addAll(blogService.blogClassify(textcontent));
        System.out.println("类型:"+b);

        b=blogService.blogClassify(textcontent);

        System.out.println("标题:"+b);
        mv.addObject("blogSearch",b);
        mv.addObject("keyWord",textcontent);
        mv.setViewName("sousuo");
        return  mv;
    }


/**
 * 搜索框检索title转成拼音
 */
@RequestMapping("/ajaxBlogSearch")
public String ajaxBlogSearch(HttpServletResponse response, HttpServletRequest request ){

    List<String> a=getBlogService().ajaxBlogMohuSearch();

    JSONArray ja=new JSONArray();
    for(String st:a){
        JSONObject jo=new JSONObject();
        if(st.length()>7){
            jo.put("word",  st.substring(0,7));}//截取八位字符
          else{jo.put("word",st);}
        ja.put(jo);
    }
    System.out.println(ja.toString());
    try {
        Responser.responseToJson( response,request,ja.toString());
    }catch (Exception e){
        e.printStackTrace();
    }
    return  "top";
}


    /**
     * 管理员删除被用户举报且不合法的博客
     * wenbin
     * @param blog_id
     * @param report_id
     * @return
     */
    @RequestMapping("/mDeleteBlogForReported/{blog_id}/{report_id}")
    @ResponseBody
    public String mDeleteBlogForReported(@PathVariable  int blog_id,@PathVariable int report_id){
        System.out.println("调用managerDeleteBlogForReported"+blog_id);
        boolean deleteResult=blogService.deleteIllegalblog(blog_id,report_id);
        if(deleteResult){
            return "success";
        }else{
            return "error";
        }
    }


@RequestMapping(value = "/addBlog")
    public  ModelAndView  addBlog(@ModelAttribute ("blog")  Blog blog,@ModelAttribute ("blogTag") BlogTag blogTag,@ModelAttribute ("userToBlog") UserToBlog userToBlog) {
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String time=df.format(d);
    blog.setTime(time);
    blog.setPoints(0);
    System.out.println(blog);
    System.out.println(userToBlog.getUid());
    boolean result = blogService.addBlogService(blog);
    //因为的多张表关联，要首先把主表的数据插入完成在进行其他副表的数据插入
    if (result == true) {
        System.out.println(time);
        int bid=blogService.selectBidService(time);
        System.out.println(bid);
        //对blogTag表进行数据插入
        blogTag.setBid(bid);
        boolean result1 = blogService.addBlogTagService(blogTag);
        //对userToBlog表进行数据插入
        userToBlog.setBid(bid);
        System.out.println(userToBlog.getIsdraft());
        System.out.println(userToBlog);
        boolean result2=blogService.addUserToBlogService(userToBlog);
        if (result1 == true&& result2==true) {
            return new ModelAndView("writingCenter","blog",blog);
        } else {
            return new ModelAndView("Writer");
        }
    }
    else
        return new ModelAndView("Writer");
    }
    //根据uid用户ID来查询博客的相应数据
    @RequestMapping("/listBlogByUid/{uid}")
    public String selectBlogByID(@PathVariable("uid") int uid,Model model){
        System.out.println("222222");
        List<Blog> blogs=blogService.scanBlogService(uid);
        List<Blog> reportedblogs=blogService.scanReportedBlogService(uid);
        List<Blog> simiblogs=blogService.scanSimiBlogService(uid);
        List<Blog> draftblogs=blogService.scanDraftBlogService(uid);
        model.addAttribute("blogs",blogs);
        model.addAttribute("reportedblogs",reportedblogs);
        model.addAttribute("simiblogs",simiblogs);
        model.addAttribute("draftblogs",draftblogs);
        System.out.println(blogs);
             return "writingCenter";
    }
    //根据bid用户ID来查询博客的相应数据
    @RequestMapping("/scanBlog/{bid}")
    public String scanBlog(@PathVariable("bid") int bid,Model model){
        System.out.println("222222");
        Blog blogs=blogService.listBlogService(bid);
        model.addAttribute("scanblog",blogs);
        System.out.println(blogs);
        return "alterBlog";
    }
    //根据bid用户ID来删除博客
    @RequestMapping("/deleteBlog")
    @ResponseBody
    public String deleteBlog(@Param("bid") int bid) {
        System.out.println("222222");
       boolean result1=blogService.deleteBlogOther(bid);
        System.out.println(result1);
        if(result1){
            return "success";
        }else {
            return "error";
        }
    }

    //修改博客
    @RequestMapping("/updateBlog/{bid}")
    public String  updateBlog(@PathVariable("bid") int bid,@ModelAttribute ("blog")  Blog blog,@ModelAttribute ("blogTag") BlogTag blogTag,@ModelAttribute ("userToBlog") UserToBlog userToBlog,Model model){
        System.out.println("33333修改");
        Date d = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=df.format(d);
        blog.setTime(time);
        boolean result=blogService.updateBlogService(blog);
        boolean result1=blogService.updateBlogTagService(blogTag);
        boolean result2=blogService.updateUserToBlogService(userToBlog);
        System.out.println("修改博客");
        if(result==true&&result1==true&&result2==true){
            Map<String,Object> map=blogService.getBlogAndUser(bid);
            Blog listblog=blogService.listBlogService(bid);
            model.addAttribute("listblog",listblog);
            model.addAttribute("boke",map.get("boke"));
            model.addAttribute("yonghu",map.get("yonghu"));
            model.addAttribute("original",map.get("original"));
            model.addAttribute("fans",map.get("fans"));
            model.addAttribute("attention",map.get("attention"));
            return "blogDetail";
        }
        else {
            return "alterBlog";
        }
    }

    //根据bid博客ID来查询博客的相应数据
    @RequestMapping("/listBlogByBid/{bid}")
    public String  listBlogByID(@PathVariable("bid") int bid,Model model){
        Blog listblog=blogService.listBlogService(bid);
        model.addAttribute("listblog",listblog);
        Map<String,Object> map=blogService.getBlogAndUser(bid);
        model.addAttribute("boke",map.get("boke"));
        model.addAttribute("yonghu",map.get("yonghu"));
        model.addAttribute("original",map.get("original"));
        model.addAttribute("fans",map.get("fans"));
        model.addAttribute("attention",map.get("attention"));
        return "blogDetail";
    }

    /**
     * 管理员将违规的博客添加到违规表
     * wenbin
     * @param blog_id
     * @return
     */
    @RequestMapping("/mSendBackIllegalblog/{blog_id}/{report_id}/{uid}")
    @ResponseBody
    public String mSendBackIllegalblog(@PathVariable int blog_id,@PathVariable int report_id,@PathVariable int uid,@RequestParam("reportReason") String reportReason){
        //对中文字符转码
        String reason=EncodingTool.encodeStr(reportReason);

        IllegalBlog blog=new IllegalBlog();
        blog.setIllegalcause(reason);
        blog.setBid(blog_id);


        boolean sendBackResult=blogService.sendBackIllegalblog(blog,report_id,uid);
        if(sendBackResult){
            return "success";
        }else{
            return "error";
        }
    }

    /**
     * 管理员获取所有被举报的博客
     * wenbin
     * @param model
     * @return
     */
    @RequestMapping(value = "/mGetAllReportBlog")
    public String mGetAllReportBlog(Model model){
        List<ReportBlog> reportBlogs=blogService.getAllReportBlog(1);
        //List<ReportResource> reportResources=blogService.getAllReportResource();
        int num=blogService.getReportBlogNum();
        System.out.println(reportBlogs);
        for (ReportBlog i:reportBlogs){
            System.out.println(i.getBlog());
        }
        model.addAttribute("ReportBlogList",reportBlogs);
        model.addAttribute("rBlNum",num);
        //model.addAttribute("ReportResourceList",reportResources);
        return  "jubaoguanl";
    }

    /**
     * 管理员驳回举报信息，认为该博客并无违规之处
     * wenbin
     * @return
     */
    @RequestMapping("/mReject_oneReportblog/{id}")
    @ResponseBody
    public String mReject_oneReportblog(@PathVariable int id){
//        ReportBlog blog=new ReportBlog();
//        blog.setId(id);

        boolean RejectResult=blogService.Reject_oneReportblog(id);
        if(RejectResult){
            return "success";
        }else{
            return "error";
        }
    }


/**
 * 博客评论
 */
    @RequestMapping("/discuss")
    public String discuss(@ModelAttribute("discuss")BlogComments blogComments,Model model){
        System.out.println(blogComments);
        blogComments.setTime(LocalTime.getNowTime());
        boolean result=blogService.discuss(blogComments);
        if(!result)
        {
            return "index";
        }else
        {
            Date d = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            int bid=blogComments.getBid();

            Map<String,Object> map=blogService.getBlogAndUser(bid);
            model.addAttribute("boke",map.get("boke"));
            model.addAttribute("yonghu",map.get("yonghu"));
            model.addAttribute("original",map.get("original"));
            model.addAttribute("fans",map.get("fans"));
            model.addAttribute("attention",map.get("attention"));

            return "userArticle";
        }
    }

    @RequestMapping("/personaldiscuss/{bid}")
    public String personaldiscuss(@ModelAttribute("discuss")BlogComments blogComments,Model model,@PathVariable("bid") int bid){
        System.out.println(blogComments);
        blogComments.setTime(LocalTime.getNowTime());
        boolean result=blogService.discuss(blogComments);
        if(!result)
        {
            return "index";
        }else
        {
            Blog listblog=blogService.listBlogService(bid);
            model.addAttribute("listblog",listblog);
            Map<String,Object> map=blogService.getBlogAndUser(bid);
            model.addAttribute("boke",map.get("boke"));
            model.addAttribute("yonghu",map.get("yonghu"));
            model.addAttribute("original",map.get("original"));
            model.addAttribute("fans",map.get("fans"));
            model.addAttribute("attention",map.get("attention"));
            return "blogDetail";
        }
    }
    /**
     * 博客评论回复
     */

    @RequestMapping("/answerComment")
    public String answerComment(@ModelAttribute("answerComment")BlogComments blogComments,Model model){
        System.out.println(blogComments);
        blogComments.setTime(LocalTime.getNowTime());
        boolean result=blogService.answerComment(blogComments);
        if(!result)
        {
            return "index";
        }else
        {
            Date d = new Date();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            int bid=blogComments.getBid();

            Map<String,Object> map=blogService.getBlogAndUser(bid);
            model.addAttribute("boke",map.get("boke"));
            model.addAttribute("yonghu",map.get("yonghu"));
            model.addAttribute("original",map.get("original"));
            model.addAttribute("fans",map.get("fans"));
            model.addAttribute("attention",map.get("attention"));

            return "userArticle";
        }
    }
    @RequestMapping("/answerPersonalComment/{bid}")
    public String answerPersonalComment(@ModelAttribute("answerComment")BlogComments blogComments,Model model,@PathVariable("bid") int bid){
        System.out.println(blogComments);
        blogComments.setTime(LocalTime.getNowTime());
        boolean result=blogService.answerComment(blogComments);
        if(!result)
        {
            return "index";
        }else
        {
            Blog listblog=blogService.listBlogService(bid);
            model.addAttribute("listblog",listblog);
            Map<String,Object> map=blogService.getBlogAndUser(bid);
            model.addAttribute("boke",map.get("boke"));
            model.addAttribute("yonghu",map.get("yonghu"));
            model.addAttribute("original",map.get("original"));
            model.addAttribute("fans",map.get("fans"));
            model.addAttribute("attention",map.get("attention"));
            return "blogDetail";
        }
    }
    /**
     * 举报博客
     *
     */
    @RequestMapping("/reportBlog")
    public void reportBlog(HttpServletResponse response,
    int bid,int uid,String reason) throws IOException {
        ReportBlog reportBlog=new ReportBlog();
        String r=new String(reason.getBytes("ISO-8859-1"),"UTF-8");
        reportBlog.setBid(bid);
        reportBlog.setUid(uid);
        reportBlog.setReason(r);
        System.out.println("举报博客："+reportBlog);
        boolean result=blogService.reportBlog(reportBlog);
        System.out.println(result);
        response.setContentType("textml;charset=UTF-8");//  textml     ,text/xml    ,text/json
        PrintWriter out=response.getWriter();//获取响应对象中的输出流
        out.write(result+"");
        out.flush();
        out.close();
    }
    /**
     * 管理员查看被举报的博客，进行审核
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/mCheckReportblog/{id}")
    public String mCheckReportblog(@PathVariable int id,Model model,HttpSession session){
        ReportBlog reportBlog=blogService.selectReportBlog(id);
        System.out.println(reportBlog);
        int bid=reportBlog.getBid();
        model.addAttribute("reportBlog",reportBlog);

        Map<String,Object> map=blogService.getBlogAndUser(bid);
        model.addAttribute("boke",map.get("boke"));
        model.addAttribute("yonghu",map.get("yonghu"));
        model.addAttribute("original",map.get("original"));
        model.addAttribute("fans",map.get("fans"));
        model.addAttribute("attention",map.get("attention"));

        return "userArticle";
    }

    /**
     * 获取博客评论楼层
     * @param bid
     * @param request
     * @param response
     */
    @RequestMapping(value="/getFloor",method = RequestMethod.POST)
    public void getFloor( @RequestParam("bid") Integer bid , HttpServletRequest request, HttpServletResponse response) {
        System.out.println("getfloor"+bid);
        String resMsg =blogService.getFloor(bid);
       // request.setAttribute("Foor",99);
        System.out.println("DDD"+bid+resMsg);
        try {
            response.getWriter().write(resMsg);
            System.out.println("XXX"+bid+resMsg);
        }catch (Exception e){
            e.printStackTrace();
        }
        return;
    }

    /**
     * 分页
     * @param page
     * @param response
     * @param request
     */
    @RequestMapping("mGetReportBlog/{page}")
    @ResponseBody
    public void mGetReportBlog(@PathVariable int page,HttpServletResponse response, HttpServletRequest request){
        //int count=1;
        System.out.println("进入blog分页");
        List<ReportBlog> reportBlogList= blogService.getAllReportBlog(page);
        System.out.println(reportBlogList+"ssssssssss");
        for (ReportBlog r:reportBlogList){
            System.out.println(r.getBlog());
        }
        int reportBlogNum=blogService.getReportBlogNum();//被举报博客的数量
        JSONArray jsonArray=new JSONArray();
        for (ReportBlog rb:reportBlogList) {
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("id",rb.getId());
            jsonObject.put("reason",rb.getReason());
            jsonObject.put("title",rb.getBlog().getTitle());
            jsonObject.put("time",rb.getBlog().getTime());
            jsonObject.put("bid",rb.getBid());
            jsonArray.put(jsonObject);
        }
        JSONObject jsonObjectTwo=new JSONObject();
        jsonObjectTwo.put("reportBlNum",reportBlogNum);
        jsonArray.put(jsonObjectTwo);
        try {
            Responser.responseToJson(response, request, jsonArray.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //我收藏的博客
    @RequestMapping(value = "/myCollectBlog" )
    public void  myCollectBlog(HttpServletResponse response,HttpSession session,Model model) throws IOException {
        System.out.println("进入myCollectBlog");
        User u= (User) session.getAttribute("loginresult");
        System.out.println(u);
        List<Blog> collectblog=blogService.myCollectBlog(u.getUid());
        System.out.println(collectblog);
        //session.setAttribute("collectblog",collectblog);
        JSONArray jsonArray=new JSONArray();
        JSONObject jsonObject=null;
        for (int i=0;i<collectblog.size();i++){
            jsonObject=new JSONObject();
            try{
                jsonObject.put("title",collectblog.get(i).getTitle());
                jsonObject.put("time",collectblog.get(i).getTime());
                jsonArray.put(jsonObject);
            }catch (JSONException e){
                e.printStackTrace();
            }
        }
        System.out.println(jsonArray);
        //悄悄把数据会给他
        //用response（响应）对象中的输出流将处理好的结果输出给ajax请求对象
        response.setContentType("textml;charset=UTF-8");//  textml     ,text/xml    ,text/json
        PrintWriter out=response.getWriter();//获取响应对象中的输出流
        out.write(jsonArray.toString());
        out.flush();
        out.close();

    }
    @RequestMapping("/getBlogAndUser")
    //处理点击标题进入博客详情页的方法
    public String getBlogAndUser(@RequestParam("blogid") String blogid, Model model, HttpSession session){
        Date d = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        int bid=Integer.parseInt(blogid);

        Map<String,Object> map=blogService.getBlogAndUser(bid);
        model.addAttribute("boke",map.get("boke"));
        model.addAttribute("yonghu",map.get("yonghu"));
        model.addAttribute("original",map.get("original"));
        model.addAttribute("fans",map.get("fans"));
        model.addAttribute("attention",map.get("attention"));
        //获取登录用户
        User u=(User)session.getAttribute("loginresult");
        System.out.println(u);
        System.out.println("DDDDD"+bid);
        if(u!=null){
            blogService.insertBlogBrowse(u.getUid(),bid,df.format(d));
        }
        else {
            blogService.insertBlogBrowse(1,bid,df.format(d));

        }

        return "userArticle";
    }
    //点赞方法
    @RequestMapping("dianzan")
    public void dianZan(@RequestParam("bid") int bid){

        boolean flag=blogService.addBlogPoints(bid);
        System.out.println("点赞"+flag);
    }
    //收藏方法
    @RequestMapping("shoucang")
    public  void shouCang(@RequestParam("uid")int uid,@RequestParam("bid")int bid,HttpServletResponse response){
        PrintWriter pw = null;
        try{
            pw=response.getWriter();
            try{
                boolean b= blogService.collectBlog(uid,bid);
                pw.print("success");
                System.out.println(b);
            }
            catch (Exception e){
                pw.print("fail");
            }
        }
        catch (IOException e){
            shouCang(uid,bid,response);
        }
    }
    //添加关注
    @RequestMapping("guanzhu")
    public  void guanZhu(@RequestParam("selfid")int selfid,@RequestParam("attenid")int attenid,@RequestParam("nickname")String nickname, HttpServletResponse response){
        Notice notice=new Notice();
        Date d = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        notice.setUid(attenid);
        notice.setTime(df.format(d));
        notice.setContent(nickname+"关注了你");
        PrintWriter pw = null;
        try{
            pw=response.getWriter();
            try{
                boolean b= blogService.addAttention(selfid,attenid);
                pw.print("success");
                userService.addNotice(notice);
                System.out.println();
                System.out.println(b);
            }
            catch (Exception e){
                pw.print("fail");
            }
        }
        catch (IOException e){
            guanZhu(selfid,attenid,nickname,response);
        }
        }
        //检查是否关注
        @RequestMapping("checkguanzhu")
        public  void checkGuanZhu(@RequestParam("selfid")int selfid,@RequestParam("attenid")int attenid,HttpServletResponse response){
            Attention a=blogService.checkIsAttention(selfid, attenid);
            PrintWriter pw=null;
            try{
                pw=response.getWriter();
            }
            catch (IOException e){
                e.printStackTrace();
            }
            if(a!=null){
               pw.print("success");
            }
            else {
                pw.print("fail");
            }
        }
        //取消关注
        @RequestMapping("quguan")
        public void quGuan(@RequestParam("selfid")int selfid,@RequestParam("attenid")int attenid,HttpServletResponse response){
            boolean b=blogService.deleteAttention(selfid, attenid);
            System.out.println(b+"取消关注成功");
            try{
                PrintWriter pw=response.getWriter();
                if(b==true){
                    pw.print("success");
                }
            }
            catch (IOException e){
                e.printStackTrace();
            }
        }
        //取推送的博客
        @RequestMapping("twotui")
        public  void getTwoTuiBlog(@RequestParam("uid")int uid,HttpServletRequest request,HttpServletResponse response){
            System.out.println("******************************************");
           List<Blog> l=blogService.selectTwoBlogByUser(uid);
            System.out.println(l);
            JSONArray ja=new JSONArray();
           for (Blog b:l){
               JSONObject jo=new JSONObject();
               jo.put("bid",b.getBid());
               jo.put("title",b.getTitle());
               jo.put("content",b.getContent());
               jo.put("time",b.getTime());
               jo.put("link",b.getLink());
               jo.put("points",b.getPoints());
               jo.put("classify",b.getClassify());
               ja.put(jo);
           }
           String con=ja.toString();
            System.out.println(con);
           try{
               Responser.responseToJson(response,request,con);
           }
           catch (Exception e){
               e.printStackTrace();
           }

        }

    //我发布的博客
    @RequestMapping(value = "/myBlog" )
    public void  myBlog(HttpServletResponse response,HttpSession session,Model model) throws IOException {
        System.out.println("进入myBlog");
        User u= (User) session.getAttribute("loginresult");
        System.out.println(u);
        List<Blog> blog=blogService.myBlog(u.getUid());
        System.out.println(blog);
        //session.setAttribute("collectblog",collectblog);
        JSONArray jsonArray=new JSONArray();
        JSONObject jsonObject=null;
        for (int i=0;i<blog.size();i++){
            jsonObject=new JSONObject();
            try{
                jsonObject.put("title",blog.get(i).getTitle());
                jsonObject.put("time",blog.get(i).getTime());
                jsonArray.put(jsonObject);
            }catch (JSONException e){
                e.printStackTrace();
            }
        }
        System.out.println(jsonArray);
        //悄悄把数据会给他
        //用response（响应）对象中的输出流将处理好的结果输出给ajax请求对象
        response.setContentType("textml;charset=UTF-8");//  textml     ,text/xml    ,text/json
        PrintWriter out=response.getWriter();//获取响应对象中的输出流
        out.write(jsonArray.toString());
        out.flush();
        out.close();
    }
    /**
     *
     * @param bid
     * @param request
     * @param response
     */
    @ResponseBody
    @RequestMapping(value="/getComments",method = RequestMethod.POST)
    public void getComments( @RequestParam("bid") Integer bid , HttpServletRequest request, HttpServletResponse response) {
        ArrayList<BlogComments> getBlogcomments=(ArrayList<BlogComments>)blogService.getComments(bid);
        Collections.sort(getBlogcomments );
        System.out.println(getBlogcomments);
        JSONArray jsonArray=new JSONArray();
        JSONObject jsonObject;
        for (int i=0;i<getBlogcomments.size();i++){
            jsonObject=new JSONObject();
            jsonObject.put("nickname",getBlogcomments.get(i).getUser().getNickname());
            jsonObject.put("floor",getBlogcomments.get(i).getFloor());
            jsonObject.put("time",getBlogcomments.get(i).getTime());
            jsonObject.put("content",getBlogcomments.get(i).getContent());
            jsonObject.put("commentid",getBlogcomments.get(i).getCommentid());
            jsonObject.put("id",getBlogcomments.get(i).getId());
            jsonObject.put("uid",getBlogcomments.get(i).getUid());
            jsonObject.put("bid",getBlogcomments.get(i).getBid());
            jsonArray.put(jsonObject);
        }
        System.out.println(getBlogcomments);
        response.setContentType("text/json;charset=UTF-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(jsonArray.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
