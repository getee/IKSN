package group.first.iksn.control;


import group.first.iksn.model.bean.*;
import group.first.iksn.service.BlogService;
import group.first.iksn.util.EncodingTool;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.apache.ibatis.jdbc.Null;

import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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


@RequestMapping(value = "/addBlog",method = RequestMethod.POST)
    public  String  addBlog(@ModelAttribute ("blog")  Blog blog,@ModelAttribute ("blogTag") BlogTag blogTag,@ModelAttribute ("userToBlog") UserToBlog userToBlog) {
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    blog.setTime(df.format(d));
    blog.setTitle(EncodingTool.encodeStr(blog.getTitle()));//解决汉字乱码问题
    blog.setContent(EncodingTool.encodeStr(blog.getContent()));
    System.out.println(blog);
    boolean result = blogService.addBlogService(blog);
    //因为的多张表关联，要首先把主表的数据插入完成在进行其他副表的数据插入
    if (result == true) {
        //对blogTag表进行数据插入
        blogTag.setBid(7);
        blogTag.setBtag(EncodingTool.encodeStr(blogTag.getBtag()));
        System.out.println(blogTag);
        boolean result1 = blogService.addBlogTagService(blogTag);
        //对blogTag表进行数据插入
        userToBlog.setUid(6);
        userToBlog.setBid(7);
        userToBlog.setIsdraft(0);
        System.out.println(userToBlog);
        boolean result2=blogService.addUserToBlogService(userToBlog);
        if (result1 == true&& result2==true) {
            return "userArticle";
        } else {
            return "Writer";
        }
    }
    else
        return "Writer";
    }
    //根据bid来查询博客的相应数据
    @RequestMapping("/listBlogByBid")
    public  String selectBlogByID(){

        List<Blog> bl=blogService.scanBlogService(4);

            System.out.println(bl);
        return "index";
    }

    /**
     * 管理员将违规的博客添加到违规表
     * wenbin
     * @param blog_id
     * @return
     */
    @RequestMapping("/mSendBackIllegalblog/{blog_id}/{reportReason}/{report_id}")
    @ResponseBody
    public String mSendBackIllegalblog(@PathVariable int blog_id,@PathVariable String reportReason,@PathVariable int report_id){
        IllegalBlog blog=new IllegalBlog();
        blog.setIllegalcause(reportReason);
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
        List<ReportBlog> reportBlogs=blogService.getAllReportBlog();
        List<ReportResource> reportResources=blogService.getAllReportResource();
        System.out.println(reportBlogs);
        for (ReportBlog i:reportBlogs){
            System.out.println(i.getBlog());
        }
        System.out.println(reportResources);
        for (ReportResource r:reportResources){
            System.out.println(r.getResource());
        }
        model.addAttribute("ReportBlogList",reportBlogs);
        model.addAttribute("ReportResourceList",reportResources);
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
     * 管理员查看被举报的博客，进行审核
     * wenbin
     * @param blog_id 博客id
     * @param reason 举报原因
     * @param model
     * @return
     */
    @RequestMapping("/mCheckReportblog/{blog_id}/{id}")
    public String mCheckReportblog(@PathVariable int blog_id,String reason,@PathVariable int id,Model model){
        System.out.println(blog_id+reason);
        model.addAttribute("blog_id",blog_id);
        model.addAttribute("reportReason",reason);
        model.addAttribute("report_id",id);
        return "userArticle";
    }

}
