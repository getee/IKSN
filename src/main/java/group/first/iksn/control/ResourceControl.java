package group.first.iksn.control;

import group.first.iksn.model.bean.*;
import group.first.iksn.service.ResourceService;
import group.first.iksn.service.UserService;
import group.first.iksn.util.Responser;
import org.json.JSONArray;
import org.json.JSONException;
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
import java.io.PrintWriter;
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
            return "index";
        }else
        {
            return "xq";
        }

    }

    /**
     *资源分类搜索
     * @param
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("/keywordSearch")
    public String keySearch(@RequestParam("keyword") String keyword,Model m){
        System.out.println(keyword);
        List<Resource> list=resourceService.ResourcekeywordSearch(keyword);
        System.out.println(list);
        m.addAttribute("keywordSearch",list);
        return "xiazai";
    }


/**
    /**
     * 资源评论
     */
/*    @ResponseBody
    @RequestMapping(value = "/getResourceComments",method = RequestMethod.POST)
    public void  getResourceComments(@RequestParam("rid") Integer rid,HttpServletRequest request,HttpServletResponse response){
        ArrayList<ResourceComments> reslut=(ArrayList<ResourceComments>)resourceService.getresourceComments(rid);
        System.out.println(reslut);
        JSONArray jsonArray=new JSONArray();
        JSONObject jsonObject;
        for (int c=0;c<reslut.size();c++){
            jsonObject=new JSONObject();
            jsonObject.put("nickname",reslut.get(c).getUser().getNickname());
            jsonObject.put("comment",reslut.get(c).getComment());
            jsonArray.put(jsonObject);
        }
        response.setContentType("text/json;charset=UTF-8");
        try {
            PrintWriter out=response.getWriter();
            out.write(jsonArray.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }*/

    /**
 * 对资源进行收藏
 */
    @RequestMapping(value="/houseResource",method = RequestMethod.POST)
    public void houseResource(CollectResource collectResource,HttpServletResponse response){
        String msg="";
        try {
            boolean result = resourceService.houseResource(collectResource);
            msg="收藏成功！";
            response.getWriter().write(msg);
        }catch (Exception e){
            System.out.println("收藏插入失败，唯一约束异常");
            msg="该资源已被收藏！";
            try {
                response.getWriter().write(msg);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
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
            ArrayList<ResourceComments> rcomments=resourceService.getresourceComments(rid);

            request.setAttribute("rcomments",rcomments);//评论信息获取
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
     * 管理员查看被举报的资源详情(此方法需要返回准确的resource bean)
     * wenbin
     * @param resourceid
     * @param id
     * @param reason
     * @param model
     * @return
     */
    @RequestMapping("/mCheckReportResource/{resourceid}/{id}")
    public String mCheckReportResource(@PathVariable int resourceid, @PathVariable int id,@RequestParam("reason") String reason, Model model,HttpServletRequest request){
        String reportReason=EncodingTool.encodeStr(reason);
        System.out.println("进入mcheck");
        Resource r=resourceService.loadResource(resourceid);//查询语句缺少标签表信息已修复
        System.out.println(r);
        User pushUser=userService.getId(r.getUid());
        System.out.println(pushUser);
        request.setAttribute("resouce",r);
        request.setAttribute("pushUser",pushUser);
        //下载次数参数初始化
        int num=resourceService.downResource(resourceid);
        request.setAttribute("downNum",num);

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
    @ResponseBody
    public String mDeleteResourceForReport(@PathVariable int resourceid){
        boolean delResult= resourceService.deleteIllegalResource(resourceid);
        if(delResult){
            return "success";
        }else {
            return "error";
        }
    }


    /**
     * 搜索资源
     * @param content
     * @return
     */
    @RequestMapping("/resourceSearch")
    public ModelAndView resourceSearch(@RequestParam("content") String content){
       ModelAndView mv=new ModelAndView();
        System.out.println("keyeord:"+content);
        List<Resource> re=resourceService.searchResource(content);
       System.out.println(re);
       mv.addObject("resource",re);
       mv.setViewName("xiazai");
       return  mv;
    }

    //资源举报
    @RequestMapping("/reportResource")
    public void reportResource(HttpServletResponse response,
                               int rid,int uid,String reason) throws IOException {
        ReportResource reportResource=new ReportResource();
        String r=new String(reason.getBytes("ISO-8859-1"),"UTF-8");
        reportResource.setRid(rid);
        reportResource.setUid(uid);
        reportResource.setReason(r);
        System.out.println(reportResource);
        boolean result=resourceService.reportResource(reportResource);
        System.out.println("SSDD"+result);
        response.setContentType("textml;charset=UTF-8");//  textml     ,text/xml    ,text/json
        PrintWriter out=response.getWriter();//获取响应对象中的输出流
        out.write(result+"");
        out.flush();
        out.close();
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
            jsonObject.put("rid",rr.getResource().getRid());
            jsonObject.put("time",rr.getResource().getTime());
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

    //查询上传的资源
    @RequestMapping("/getUploadResource")
    public void getUploadResource(HttpSession session, Model model, HttpServletResponse response) throws IOException {
        User u= (User) session.getAttribute("loginresult");
        int uid=u.getUid();
        ArrayList<Resource> resources= (ArrayList<Resource>) resourceService.getUploadResource(uid);

        JSONArray jsonArray=new JSONArray();
        JSONObject jsonObject;
        for (int i=0;i<resources.size();i++){
            jsonObject=new JSONObject();
            try{
                jsonObject.put("name",resources.get(i).getName());
                jsonObject.put("introduce",resources.get(i).getIntroduce());
                jsonObject.put("time",resources.get(i).getTime());
                jsonObject.put("scoring",resources.get(i).getScoring());
                jsonArray.put(jsonObject);
            }catch (JSONException e){
                e.printStackTrace();
            }
        }
        //悄悄把数据会给他
        //用response（响应）对象中的输出流将处理好的结果输出给ajax请求对象
        response.setContentType("textml;charset=UTF-8");//  textml     ,text/xml    ,text/json
        PrintWriter out=response.getWriter();//获取响应对象中的输出流
        out.write(jsonArray.toString());
        out.flush();
        out.close();

    }

    //下载资源
    @RequestMapping(value = "/getdownloadResource" )
    public void  getdownloadResource(HttpServletResponse response, HttpSession session, Model model) throws IOException {
        System.out.println("downloadResource");
        User u= (User) session.getAttribute("loginresult");
        System.out.println(u);
        List<Resource> resource=resourceService.getdownloadResource(u.getUid());

        //session.setAttribute("collectblog",collectblog);
        JSONArray jsonArray=new JSONArray();
        JSONObject jsonObject=null;
        for (int i=0;i<resource.size();i++){
            jsonObject=new JSONObject();
            try{
                jsonObject.put("title",resource.get(i).getName());
                jsonObject.put("scoring",resource.get(i).getScoring());
                jsonObject.put("time",resource.get(i).getTime());
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

    //我收藏的资源
    @RequestMapping(value = "/myCollectResource" )
    public void  collectResource(HttpServletResponse response, HttpSession session, Model model) throws IOException {
        System.out.println("myCollectResource");
        User u= (User) session.getAttribute("loginresult");
        System.out.println(u);
        List<Resource> collect=resourceService.myCollectResource(u.getUid());
        System.out.println(collect);
        //session.setAttribute("collectblog",collectblog);
        JSONArray jsonArray=new JSONArray();
        JSONObject jsonObject=null;
        for (int i=0;i<collect.size();i++){
            jsonObject=new JSONObject();
            try{
                jsonObject.put("title",collect.get(i).getName());
                jsonObject.put("scoring",collect.get(i).getScoring());
                jsonObject.put("time",collect.get(i).getTime());
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
