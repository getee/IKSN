package group.first.iksn.control;

import group.first.iksn.model.bean.*;
import group.first.iksn.service.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import  group.first.iksn.util.EncodingTool;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.io.IOException;


import org.springframework.web.bind.annotation.RequestParam;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping("/resource")
public class ResourceControl {
    private ResourceService resourceService;

    public ResourceService getResourceService() {
        return resourceService;
    }

    public void setResourceService(ResourceService resourceService) {
        this.resourceService = resourceService;
    }


    /**
     * 对资源进行评价评论
     * @param resourceComments
     * @return
     */
    @RequestMapping("/assess")
    public String assess(@ModelAttribute("assess") ResourceComments resourceComments) {
        System.out.println("assess resourceComments");
        System.out.println(resourceComments);
        boolean result=resourceService.assess(resourceComments);
        if(!result)
        {
            return "assess";
        }else
        {
            return "xq";
        }

    }
/**
 * 对资源进行收藏
 */
    @RequestMapping("/houseResource")
    public String houseResource(@ModelAttribute("houseResource")CollectResource collectResource){
        System.out.println(collectResource);
        boolean result=resourceService.houseResource(collectResource);
        if (!result)
        {
            return "shoucang";
        }else
        {
            return "xq";
        }
    }

    @RequestMapping(value="/upLoadMag",method = RequestMethod.POST)
    public String upLoadMag(Resource resource ,@RequestParam("mytext") String[] mytext, HttpServletRequest request, HttpServletResponse response) {

        System.out.println("Length"+mytext.length);

        try{
            resourceService.upLoadResourc(resource,mytext);
        }catch (Exception e){
            e.printStackTrace();
            return "upload";
        }
        return "myresource";
    }

    @RequestMapping(value="/upLoadFile",method = RequestMethod.POST)
    public void upLoadFile(@RequestParam("file") CommonsMultipartFile file,@RequestParam("uid") Integer uid ,HttpServletRequest request, HttpServletResponse response) {

        String resMsg = "0";
        try {

            System.out.println("fileName：" + file.getOriginalFilename()+"XX"+uid);
            //String path="/resource/files/"+new Date().getTime()+file.getOriginalFilename();

            //获取项目输出路径
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            rootPath = rootPath.substring(0, rootPath.lastIndexOf('\\'));
            String filepath = rootPath.substring(0, rootPath.lastIndexOf('\\')) + "/resourcefile/" +uid+"/"+ file.getOriginalFilename();
            //System.out.println("rootPath:" + rootPath);//D:\AppSCM\IKSN\out\artifacts\IKSN_war_exploded
            System.out.println("path:" + filepath);//D:\AppSCM\IKSN\out\artifacts/resourcefile/
            //String quotePath="resourcefile/" +uid+"/"+ file.getOriginalFilename();//资源引用路径

            boolean isRepeat=resourceService.checkResource(file,filepath);
            if(!isRepeat){
                resMsg = "0";//已存在相同资源
                response.getWriter().write(resMsg);
            }else {
                resMsg = filepath;
                response.getWriter().write(resMsg);
            }
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 资源下载次数
      */
        @RequestMapping("/downResource")
        public String downResource(@RequestParam("rid") Integer rid,HttpServletRequest request){
            System.out.println(rid);
            int c=resourceService.downResource(rid);
            request.setAttribute("num",c);
            return  "xq";
        }

    /**
     * 资源举报被取消
     * wenbin
     * @param id
     * @return
     */
    @RequestMapping("/mReject_oneReportResource/{id}")
    @ResponseBody
    public String mReject_oneReportResource(@PathVariable int id){
        boolean RejectResult=resourceService.Reject_oneReportResource(id);
        if(RejectResult){
            return "success";
        }else{
            return "error";
        }
    }

    /**
     * 管理员查看被举报的资源详情
     * wenbin
     * @param resourceid
     * @param id
     * @param reason
     * @param model
     * @return
     */
    @RequestMapping("/mCheckReportResource/{resourceid}/{id}")
    public String mCheckReportResource(@PathVariable int resourceid, @PathVariable int id,String reason, Model model){
        System.out.println(reason);

        model.addAttribute("resourceid",resourceid);
        model.addAttribute("reportRid",id);
        model.addAttribute("reportRReason",reason);

        return "xq";
    }

    /**
     * 管理员删除被举报且违规的资源
     * wenbin
     * @param resourceid
     * @return
     */
    @RequestMapping("/mDeleteResourceForReport/{resourceid}")
    public String mDeleteResourceForReport(@PathVariable int resourceid){
        resourceService.deleteIllegalResource(resourceid);
        return "jubaoguanl";
    }


    /**
     * 搜索资源的方法
     * @param content
     * @return
     */
    @RequestMapping("/resourceSearch")
    public ModelAndView resourceSearch(@RequestParam("content") String content){
       ModelAndView mv=new ModelAndView();
       ArrayList<Resource> re=getResourceService().searchResource(content);
       System.out.println(re);
       mv.addObject("resource",re);
       mv.setViewName("xiazai");
       return  mv;
    }

    //资源举报
    @RequestMapping("/reportResource")
    public ModelAndView reportResource(@ModelAttribute("reportResource")ReportResource reportResource) throws UnsupportedEncodingException {
        ModelAndView mav=new ModelAndView("xq");
        //String reason=new String(reportResource.getReason().getBytes("ISO-8859-1"),"UTF-8");
        //reportResource.setReason(reason);
        System.out.println(reportResource);
       boolean result=resourceService.reportResource(reportResource);
        mav.getModel().put("result",result);
        System.out.println(result);
         return mav;
    }
}
