package group.first.iksn.control;

import group.first.iksn.model.bean.*;
import group.first.iksn.service.ResourceService;
import group.first.iksn.service.UserService;
import group.first.iksn.util.Responser;
import org.json.JSONArray;
import org.json.JSONObject;
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
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.io.IOException;
import java.util.List;


import org.springframework.web.bind.annotation.RequestParam;
import java.io.UnsupportedEncodingException;
import java.util.Date;

@Controller
@RequestMapping("/resource")
public class ResourceControl {
    private ResourceService resourceService;
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

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
            return "success";
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
            String filename=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));//取扩展名
            filename=""+new Date().getTime()+filename;
            //String path="/resource/files/"+new Date().getTime()+file.getOriginalFilename();

            //获取项目输出路径
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            rootPath = rootPath.substring(0, rootPath.lastIndexOf('\\'));
            String filepath = rootPath.substring(0, rootPath.lastIndexOf('\\')) + "/resourcefile/" +uid+"/"+ filename;
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
//            System.out.println(rid);
//            int c=resourceService.downResource(rid);
//            request.setAttribute("num",c);
            return  "xq";
        }
        /**
         * 资源下载================================================
         */
        @RequestMapping("/downLoadResource")
        public String downLoadResource(@RequestParam("rid") Integer rid,
                                       @RequestParam("downUserid") Integer downUserid,//下载者
                                       HttpServletRequest request, HttpSession session){
            Resource r=resourceService.loadResource(rid);//获取资源信息

            boolean isDowned=resourceService.downHour(rid,downUserid);//判断该用户是否下载过（一小时内）
            if(!isDowned) {
                boolean isDown = resourceService.downLoadResource(r.getUid(), downUserid, rid, r.getScoring());//上传者，下载者，积分数
                //更新session用户积分值
                User u = (User) session.getAttribute("loginresult");
                u.setScore(u.getScore() - r.getScoring());
                session.setAttribute("loginresult", u);
            }
            String path=r.getPath();
            request.setAttribute("downloapath",path);
            request.setAttribute("resouce",r);
            return  "xq";
        }
        /*
        加载资源界面获取资源数据=====================================================
         */
        @RequestMapping("/loadResource")
        public String loadResource(@RequestParam("rid") Integer rid,HttpSession session,HttpServletRequest request){
            System.out.println("r"+rid);
            Resource r=resourceService.loadResource(rid);//查询语句缺少标签表信息已修复
            User pushUser=userService.getId(r.getUid());
            User downUser= (User) session.getAttribute("loginresult");
            if(downUser!=null){
                boolean isDowned=resourceService.downHour(rid,downUser.getUid());//判断该用户是否下载过（一小时内）
                if(isDowned){
                    request.setAttribute("isDowned","(已下载过，一小时内下载不扣积分)");
                }
            }


            request.setAttribute("resouce",r);
            request.setAttribute("pushUser",pushUser);

            //下载次数参数初始化
            int num=resourceService.downResource(rid);
            request.setAttribute("downNum",num);
            return "xq";
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
    public String mCheckReportResource(@PathVariable int resourceid, @PathVariable int id,@RequestParam("reason") String reason, Model model){
        String reportReason=EncodingTool.encodeStr(reason);

        model.addAttribute("resourceid",resourceid);
        model.addAttribute("reportRid",id);
        model.addAttribute("reportRReason",reportReason);

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
    public ModelAndView reportResource(ReportResource reportResource) {
        System.out.println(reportResource);
        ModelAndView mav=new ModelAndView("xq");
        //String reason=new String(reportResource.getReason().getBytes("ISO-8859-1"),"UTF-8");
        //reportResource.setReason(reason);
        System.out.println(reportResource);
       boolean result=resourceService.reportResource(reportResource);
        mav.getModel().put("result",result);
        System.out.println("SSDD"+result);
         return mav;
    }

    /**
     * 分页
     * @param page
     * @param response
     * @param request
     */
    @RequestMapping("mGetReportResource/{page}")
    @ResponseBody
    public void mGetReportResource(@PathVariable int page,HttpServletResponse response, HttpServletRequest request){
        //int count=1;
        System.out.println("进入分页");
        List<ReportResource> reportResourceList= resourceService.getAllReportResource(page);
        System.out.println(reportResourceList+"ssssssssss");
        for (ReportResource r:reportResourceList){
            System.out.println(r.getResource());
        }
        int num=resourceService.reportResourceNum();//获取被举报数量
        JSONArray jsonArray=new JSONArray();
        for (ReportResource rr:reportResourceList) {
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("id",rr.getId());
            jsonObject.put("reason",rr.getReason());
            jsonObject.put("name",rr.getResource().getName());
            jsonObject.put("rid",rr.getRid());
            jsonArray.put(jsonObject);
        }
        JSONObject jsonObjectTwo=new JSONObject();
        jsonObjectTwo.put("reportReNum",num);
        jsonArray.put(jsonObjectTwo);
        try {
            Responser.responseToJson(response, request, jsonArray.toString());
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
