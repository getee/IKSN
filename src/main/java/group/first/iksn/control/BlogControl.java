package group.first.iksn.control;


import group.first.iksn.model.bean.*;
import group.first.iksn.service.BlogService;
import group.first.iksn.util.EncodingTool;
import group.first.iksn.util.Responser;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/blog")
public class BlogControl {
    private BlogService blogService;


    public BlogService getBlogService() {
        return blogService;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    /**
     * 这是首页推送博客的方法
     * @return
     */
    @RequestMapping("/blogPush")
    public String blogPush(Model m){
        System.out.println("asfasd");
        List<Blog> al=blogService.detailedBlogPush();
        System.out.println(al);
        m.addAttribute("BlogsPush",al);
        return "index";
    }


    /**
     * 这是搜索博客的方法
     * @param textcontent
     * @return
     */
    @RequestMapping(value = "/blogSearch")
    public ModelAndView blogSearch(@RequestParam("content") String textcontent ){
       // textcontent=EncodingTool.encodeStr(textcontent);//先将中文码ISO-8859-1转成UTF-8
        System.out.println("controller层:"+textcontent);
        ModelAndView mv=new ModelAndView();
        List<Blog> b= blogService.detailedBlogSearchResultMap(textcontent);
        System.out.println(b);
        mv.addObject("blogSearch",b);
        mv.addObject("keyWord",textcontent);
        mv.setViewName("sousuo");
        return  mv;
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
        model.addAttribute("blogs",blogs);
        System.out.println(blogs);
             return "writingCenter";
    }

    //根据bid博客ID来查询博客的相应数据
    @RequestMapping("/listBlogByBid")
    public ModelAndView listBlogByID(@RequestParam(value = "bid",defaultValue = "8") int bid){
        Blog listblog=blogService.listBlogService(bid);
        System.out.println(listblog);
        return new ModelAndView("userArticle","listblog",listblog);
    }

    /**
     * 管理员将违规的博客添加到违规表
     * wenbin
     * @param blog_id
     * @return
     */
    @RequestMapping("/mSendBackIllegalblog/{blog_id}/{report_id}")
    @ResponseBody
    public String mSendBackIllegalblog(@PathVariable int blog_id,@PathVariable int report_id,@RequestParam("reportReason") String reportReason){
        //对中文字符转码
        String reason=EncodingTool.encodeStr(reportReason);

        IllegalBlog blog=new IllegalBlog();
        blog.setIllegalcause(reason);
        blog.setBid(blog_id);

        boolean sendBackResult=blogService.sendBackIllegalblog(blog,report_id);
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
    public String discuss(@ModelAttribute("discuss")BlogComments blogComments){
        System.out.println(blogComments);
        boolean result=blogService.discuss(blogComments);
        if(!result)
        {
            return "index";
        }else
        {
            return "userArticle";
        }
    }
    /**
     * 博客评论回复
     */

    @RequestMapping("/answerComment")
    public String answerComment(@ModelAttribute("answerComment")BlogComments blogComments){
        System.out.println(blogComments);
        boolean result=blogService.answerComment(blogComments);
        if(!result)
        {
            return "index";
        }else
        {
            return "userArticle";
        }
    }
    /**
     * 举报博客
     * @param reportBlog
     * @return
     */
    @RequestMapping("/reportBlog")
    public ModelAndView reportBlog(@ModelAttribute("reportBlog")ReportBlog reportBlog) throws UnsupportedEncodingException {
        ModelAndView mav=new ModelAndView("userArticle");
        System.out.println(reportBlog);
        boolean result=blogService.reportBlog(reportBlog);
        mav.getModel().put("result",result);
        System.out.println(result);

        return mav;
    }

    /**
     * 管理员查看被举报的博客，进行审核
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/mCheckReportblog/{id}")
    public String mCheckReportblog(@PathVariable int id,Model model){
        ReportBlog reportBlog=blogService.selectReportBlog(id);
        System.out.println(reportBlog);
        model.addAttribute("reportBlog",reportBlog);
//        EncodingTool.encodeStr(reason);
//        System.out.println(blog_id+reason);
//        model.addAttribute("blog_id",blog_id);
//        model.addAttribute("reportReason",reason);
//        model.addAttribute("report_id",id);
        return "userArticle";
    }
    @RequestMapping(value="/getFloor",method = RequestMethod.POST)
    public void getFloor( @RequestParam("bid") Integer bid , HttpServletRequest request, HttpServletResponse response) {
        System.out.println(bid);
        String resMsg = ""+blogService.getFloor(bid);//已存在相同资源
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



}