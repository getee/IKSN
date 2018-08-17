package group.first.iksn.service;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.Resource;
import group.first.iksn.model.bean.ReportResource;
import group.first.iksn.model.bean.ResourceComments;
import group.first.iksn.model.dao.ResourceDAO;
import group.first.iksn.util.Inspect;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import java.util.ArrayList;

@Component("resourceService")
public class ResourceServiceImp  implements ResourceService{
    private ResourceDAO resourceDAO;

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
        System.out.println(h);
        return resourceDAO.collectResource(h);
    }

    /**
     * 资源搜索
     * @param s
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
    public List<Resource> ResourcekeywordSearch(String key) {
        return resourceDAO.ResourcekeywordSearch(key);
    }

    @Override
    public int downResource(Integer rid) {
        return resourceDAO.downnum(rid);
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
        //boolean deleteResult=blogDAO.deleteBlog(blog_id);
        boolean deleteResult=resourceDAO.deleteResourceOthers(resourceid);
        if(deleteResult){
            result=resourceDAO.deleteResource(resourceid);
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


}
