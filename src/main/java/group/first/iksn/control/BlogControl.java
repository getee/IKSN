package group.first.iksn.control;


import group.first.iksn.model.bean.IllegalBlog;
import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.BlogTag;
import group.first.iksn.model.bean.UserToBlog;
import group.first.iksn.model.bean.ReportBlog;
import group.first.iksn.service.BlogService;
import group.first.iksn.util.EncodingTool;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.apache.ibatis.jdbc.Null;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping(value = "/blogSearch")
    public String bSearch(@RequestParam("content") String textcontent ){
        textcontent=EncodingTool.encodeStr(textcontent);//先将中文乱码转成UTF-8

        System.out.println(textcontent);
        return "sousuo";
    }
    /**
     *管理员删除被用户举报且不合法的博客
     * wenbin
     * @param blog_id
     * @return
     */
    @RequestMapping("/mDeleteBlogForReported")
    @ResponseBody//此注解不能省略 否则ajax无法接受返回值
    public String mDeleteBlogForReported(int blog_id){
        System.out.println("调用managerDeleteBlogForReported"+blog_id);
        return "success";
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
    @RequestMapping("/mSendBackIllegalblog")
    @ResponseBody
    public String mSendBackIllegalblog(int blog_id){
        IllegalBlog blog=new IllegalBlog();
        blog.setIllegalcause("文采不好，毫无趣味");
        blog.setBid(blog_id);


        boolean sendBackResult=blogService.sendBackIllegalblog(blog);
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
        List<ReportBlog> reportBlogs=blogService.getAllReportBlog();
        System.out.println(reportBlogs);
        for (ReportBlog i:reportBlogs){
            System.out.println(i.getBlog());
        }
        model.addAttribute("ReportBlogList",reportBlogs);
        return  "gerenzhongxin";
    }

    /**
     * 管理员驳回举报信息，认为该博客并无违规之处
     * wenbin
     * @return
     */
    @RequestMapping("/mReject_oneReportblog/{id}")
    @ResponseBody
    public String mReject_oneReportblog(@PathVariable int id){
        ReportBlog blog=new ReportBlog();
        blog.setId(id);

        boolean RejectResult=blogService.Reject_oneReportblog(blog);
        if(RejectResult){
            return "success";
        }else{
            return "error";
        }
    }

}
