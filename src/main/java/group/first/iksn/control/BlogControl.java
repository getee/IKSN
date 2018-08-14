package group.first.iksn.control;


import group.first.iksn.model.bean.BlogBrowsed;
import group.first.iksn.model.bean.IllegalBlog;
import group.first.iksn.model.bean.Blog;
import group.first.iksn.model.bean.SearchBlog;
import group.first.iksn.service.BlogService;
import group.first.iksn.util.EncodingTool;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;


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


@RequestMapping(value = "/addBlog",method = RequestMethod.POST)
    public  String  addBlog(@ModelAttribute ("blog")  Blog blog) {
    Date d = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String nowtime = df.format(d);
    blog.setTime(nowtime);
    System.out.println(blog);
    boolean result = blogService.addBlogService(blog);
    if (result == false) {
        return "Writer";
    } else {
        return "index";
    }
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
        List<IllegalBlog> reportBlogs=blogService.getAllReportBlog();
        System.out.println(reportBlogs);
        for (IllegalBlog i:reportBlogs){
            System.out.println(i.getBlog());
        }
        model.addAttribute("ReportBlogList",reportBlogs);
        return  "gerenzhongxin";
    }
}
