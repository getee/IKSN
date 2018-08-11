package group.first.iksn.control;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ResourceComments;
import group.first.iksn.service.ResourceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import  group.first.iksn.util.EncodingTool;

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
}
