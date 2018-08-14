package group.first.iksn.control;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ReportResource;
import group.first.iksn.model.bean.ResourceComments;
import group.first.iksn.service.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;

import  group.first.iksn.util.EncodingTool;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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

    //资源举报
    @RequestMapping("/reportResource")
    public ModelAndView reportResource(@ModelAttribute("reportResource")ReportResource reportResource) throws UnsupportedEncodingException {
        ModelAndView mav=new ModelAndView("xq");
        String reason=new String(reportResource.getReason().getBytes("ISO-8859-1"),"UTF-8");
        reportResource.setReason(reason);
        System.out.println(reportResource);
       boolean result=resourceService.reportResource(reportResource);
        mav.getModel().put("result",result);
        System.out.println(result);
         return mav;
    }
}
