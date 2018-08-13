package group.first.iksn.control;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ResourceComments;
import group.first.iksn.service.ResourceService;
import group.first.iksn.util.Inspect;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import  group.first.iksn.util.EncodingTool;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

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

    @RequestMapping(value="/upLoadFile",method = RequestMethod.POST)
    public void upLoadFile(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request, HttpServletResponse response) {

        String resMsg = "0";
        try {

            System.out.println("fileName：" + file.getOriginalFilename());
            //String path="/resource/files/"+new Date().getTime()+file.getOriginalFilename();

            //获取项目输出路径
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            rootPath = rootPath.substring(0, rootPath.lastIndexOf('\\'));
            String filepath = rootPath.substring(0, rootPath.lastIndexOf('\\')) + "/resourcefile/" + file.getOriginalFilename();
            System.out.println("rootPath:" + rootPath);//D:\AppSCM\IKSN\out\artifacts\IKSN_war_exploded
            System.out.println("path:" + filepath);//D:\AppSCM\IKSN\out\artifacts/resource/

            File newFile = new File(filepath);


            // 判断父级目录是否存在，不存在则创建
            if (!newFile.getParentFile().exists()) {
                newFile.getParentFile().mkdir();
            }
            // 判断文件是否存在，否则创建文件（夹）
            if (!newFile.exists()) {
                newFile.mkdir();
            }
            //通过CommonsMultipartFile的方法直接写文件
            file.transferTo(newFile);

            String SHA = Inspect.getSHA(newFile);
            String MD5 = Inspect.getMD5(newFile);
            System.out.println(SHA);
            System.out.println(MD5);

            resMsg = "1";
            response.getWriter().write(resMsg);
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
}
