package group.first.iksn.service;

import group.first.iksn.model.bean.*;
import group.first.iksn.model.bean.ReportResource;
import group.first.iksn.model.dao.ResourceDAO;
import group.first.iksn.model.dao.UserDAO;
import group.first.iksn.util.Inspect;
import group.first.iksn.util.LocalTime;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Component("resourceService")
public class ResourceServiceImp  implements ResourceService{
    private ResourceDAO resourceDAO;
    private UserDAO userDAO;

    public UserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public ResourceDAO getResourceDAO() {
        return resourceDAO;
    }

    public void setResourceDAO(ResourceDAO resourceDAO) {
        this.resourceDAO = resourceDAO;
    }

    //评论评分
    public boolean assess(ResourceComments c) {
        System.out.println(c);
        return resourceDAO.assessResource(c);
    }

    //收藏资源
    public boolean houseResource(CollectResource h) {
        return resourceDAO.collectResource(h);
    }

    /**
     * 资源搜索
     * @param
     * @return
     */
    @Override
    public List<Resource> searchResource(String s) {

        return resourceDAO.searchResource(s);
    }

    /**
     * 资源分类搜索
     * @param key
     * @return
     */
    @Override
    public List<Resource> ResourcekeywordSearch(String key)
    {    int keyword=Integer.parseInt(key);
        return resourceDAO.ResourcekeywordSearch(keyword);
    }

    @Override
    public int downResource(Integer rid) {
        return resourceDAO.downnum(rid);
    }

    @Override
    public Resource loadResource(int rid) {
        return resourceDAO.getResource(rid);
    }

    @Override
    //上传文件，在service检测重复
    public boolean checkResource(CommonsMultipartFile file, String filePath) {

        File newFile = new File(filePath);//资源保存路径


        // 判断父级目录是否存在，不存在则创建
        if (!newFile.getParentFile().exists()) {
            newFile.getParentFile().mkdir();
        }
        // 判断文件是否存在，否则创建文件（夹）
        if (!newFile.exists()) {
            newFile.mkdir();
        }
        //通过CommonsMultipartFile的方法直接写文件
        try {
            file.transferTo(newFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        String SHA = Inspect.getSHA(newFile);
        String MD5 = Inspect.getMD5(newFile);

        Resource r=resourceDAO.checkFile(MD5,SHA);
        System.out.println("NBXX"+r);
        if(r!=null){
            newFile.delete();
            return false;//说明存在相同资源
        }

        return true;
    }

    @Override
    public boolean upLoadResourc(Resource resource, String[] rTag) {
        //D:\AppSCM\IKSN\out\artifacts/resourcefile/2/99cc36d3d539b600385af78be850352ac65cb77c.jpg
        String filePath=resource.getPath();
        File f=new File(filePath);

        String SHA = Inspect.getSHA(f);
        String MD5 = Inspect.getMD5(f);
        resource.setMd5(MD5);
        resource.setSha(SHA);

        Date d = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        resource.setTime(df.format(d));

        int index=filePath.lastIndexOf("resourcefile/");
        filePath=filePath.substring(index);
        resource.setPath(filePath);

        try {
            int addID = resourceDAO.addResource(resource);
            System.out.println("XSSS" + resource);
            /**
             *
             * 添加TAG表
             */
            List<String> list = Arrays.asList(rTag);
            boolean isTag = resourceDAO.addResourceTag(resource.getRid(), list);
            System.out.println(isTag + "PP" + list);
        }catch (Exception e){

        }
        return false;
    }

    /**
     * 删除ReportResource一行
     * wenbin
     * @param report_id
     * @return
     */
    @Override
    public boolean Reject_oneReportResource(int report_id) {
        return resourceDAO.deleteResourceFromReport(report_id);
    }

    @Override
    public boolean deleteIllegalResource(int resourceid) {
        boolean result=false;
        //获取uid
        Resource r=resourceDAO.selectUidByRid(resourceid);
        //先删除跟resource有关的表数据
        boolean deleteResult=resourceDAO.deleteResourceOthers(resourceid);
        if(deleteResult){
            //再删除resource表数据
            result=resourceDAO.deleteResource(resourceid);
            //删除实体文件
            File file=new File(r.getPath());
            file.delete();
            //封装notice(通知)
            Notice notice=new Notice();
            notice.setUid(r.getUid());
            notice.setContent("您有一个违规资源，已被删除！！");
            String time=LocalTime.getNowTime();
            notice.setTime(time);
            userDAO.addNotice(notice);
        }
        System.out.println("删除resource其他"+deleteResult);
        return result;
    }
    //举报资源
    @Override
    public boolean reportResource(ReportResource reportResource) {
        System.out.println(reportResource);
        boolean result=resourceDAO.reportResource(reportResource);
        return result;
    }


    @Override
    public List<ReportResource> getAllReportResource(int page) {
        return resourceDAO.getAllReportResource(page);
    }

    @Override
    public int reportResourceNum() {
        return resourceDAO.reportResourceNum();
    }


    //查询上传的资源
    @Override
    public List<Resource> getUploadResource(int uid) {
        List<Resource> resources=resourceDAO.getUploadResource(uid);
        return resources;
    }

    @Override
    public boolean downLoadResource(int pushId, int downId, int rid,int scoring) {
        try {
            int pushScore=userDAO.getId(pushId).getScore();
            int downScore=userDAO.getId(downId).getScore();
            boolean isLessen=resourceDAO.changeScore(downId, downScore-scoring);//下载者减少后的积分
            boolean isnAdd=resourceDAO.changeScore(pushId, pushScore+scoring);//上传者增加后的积分
            //往下载表插入数据
            boolean isOK=resourceDAO.addDownResource(downId,rid,LocalTime.getNowTime());
            if(!isLessen || !isnAdd || !isOK) return false;
        }catch (Exception e) {
            return false;
        }
        return true;
    }
     //下载资源
    @Override
    public List<Resource> getdownloadResource(int uid) {
        return resourceDAO.downloadResource(uid);
    }

    //我收藏的资源
    @Override
    public List<Resource> myCollectResource(int uid) {
        return resourceDAO.myCollectResource(uid);
    }

    @Override
    public boolean downHour(int rid, int uid) {
        String nowTime=LocalTime.getNowTime();
        String oldTime=resourceDAO.getDownedTime(rid,uid);//获取最大时间判断
        if(oldTime == null){
            return false;
        }
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        Date  d = null;
        try {
            d = df.parse(oldTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Calendar cal=Calendar.getInstance();
        cal.setTime(d);
        cal.add(Calendar.HOUR, +1);  //加1小时，数据库时间之后大于现在时间不扣钱

        oldTime=df.format(cal.getTime());
        if(oldTime.compareTo(nowTime)>0){//数据库时间大于 下载时间，所以评为已下载
            System.out.println(oldTime+"++"+nowTime);
            return true;
        }

        return false;
    }

 /*   @Override
    public ArrayList<ResourceComments> getresourceComments(Integer rid) {
        ArrayList<ResourceComments> k=resourceDAO.getresourceComments(rid);
                return  k;
    }*/


}
