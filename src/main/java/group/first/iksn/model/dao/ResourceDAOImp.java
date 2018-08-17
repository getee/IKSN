package group.first.iksn.model.dao;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ReportResource;
import group.first.iksn.model.bean.Resource;
import group.first.iksn.model.bean.ReportResource;
import org.apache.ibatis.session.SqlSession;
import group.first.iksn.model.bean.ResourceComments;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.ArrayList;

@Component("resourceDAO")
public class ResourceDAOImp extends BaseDAOImp implements ResourceDAO {
    /**
     * 对资源进行评价评论
     * @param c
     * @return
     */
    public boolean assessResource(ResourceComments c) {
        System.out.println(c);
        return getSqlSession().getMapper(ResourceDAO.class).assessResource(c);
    }

    /**
     * 对资源收藏
     * @param h
     * @return
     */
    public boolean collectResource(CollectResource h) {
        System.out.println(h);
        return getSqlSession().getMapper(ResourceDAO.class).collectResource(h);
    }

    @Override
    public int downnum(Integer rid) {
        System.out.println(rid);
       int num=getSqlSession().getMapper(ResourceDAO.class).downnum(rid);
       return  num;
    }

    @Override
    public Resource getResource(int rid) {
        Resource r=getSqlSession().getMapper(ResourceDAO.class).getResource(rid);
        return r;
    }

    public Resource checkFile(String MD5,String SHA){
        Resource r=getSqlSession().getMapper(ResourceDAO.class).checkFile(MD5,SHA);
        return r;
    }
    public int addResource(Resource resource){
        int addID=getSqlSession().getMapper(ResourceDAO.class).addResource(resource);
        return addID;
    }

    @Override
    public boolean addResourceTag(int rid,List rtag){
        boolean isAdd=getSqlSession().getMapper(ResourceDAO.class).addResourceTag(rid,rtag);
        return isAdd;
    }
    @Override
    public boolean deleteResourceFromReport(int id) {
        boolean isOK=false;
        try{
            isOK=getSqlSession().getMapper(ResourceDAO.class).deleteResourceFromReport(id);
        }catch (Exception e){
            System.out.println("这是删除ReportResource出错了");
            e.printStackTrace();
        }
        return isOK;
    }

    @Override
    public boolean deleteResourceOthers(int rid) {
        boolean isOK=false;
        try{
            isOK=getSqlSession().getMapper(ResourceDAO.class).deleteResourceOthers(rid);
        }catch (Exception e){
            System.out.println("这是删除资源出错了");
            e.printStackTrace();
        }
        return isOK;
    }

    @Override
    public boolean deleteResource(int rid) {
        boolean isOK=false;
        try{
            isOK=getSqlSession().getMapper(ResourceDAO.class).deleteResource(rid);
        }catch (Exception e){
            System.out.println("这是添加违规博客出错了");
            e.printStackTrace();
        }
        return isOK;
    }

    @Override
    public ArrayList<Resource> searchResource(String s) {
        ArrayList<Resource> re=getSqlSession().getMapper(ResourceDAO.class).searchResource(s);
        System.out.println("resourceDAOImp:"+re);
        return re;
    }
    @Override
    public int reportResourceNum() {
        int num=getSqlSession().getMapper(ResourceDAO.class).reportResourceNum();
        return num;
    }

    /**
     * 获取所有被举报资源
     * wenbin
     * @return
     */
    @Override
    public List<ReportResource> getAllReportResource(int page) {
        System.out.println("进入dao");
        List<ReportResource> allReportResource=null;
        try {
            allReportResource=getSqlSession().getMapper(ResourceDAO.class).getAllReportResource((page-1)*2);
            System.out.println("获取举报资源成功");
        }catch (Exception e){
            System.out.println("这是获取违规资源出错了");
            e.printStackTrace();
        }
        System.out.println("查到数据");
        return allReportResource;
    }

    @Override
    public Resource selectUidByRid(int rid) {
        return getSqlSession().getMapper(ResourceDAO.class).selectUidByRid(rid);
    }
    /**
     * 查询上传的资源
     * @param uid
     * @return
     */
    @Override
    public List<Resource> getUploadResource(int uid) {
        List<Resource> resources=getSqlSession().getMapper(ResourceDAO.class).getUploadResource(uid);
        return resources;
    }
    //下载资源
    @Override
    public List<Resource> downloadResource(int uid) {
        return getSqlSession().getMapper(ResourceDAO.class).downloadResource(uid);
    }
    //我收藏的资源
    @Override
    public List<Resource> myCollectResource(int uid) {
        return getSqlSession().getMapper(ResourceDAO.class).myCollectResource(uid);
    }

    //更改积分
    @Override
    public boolean changeScore(int uid, int scoring) {
        return getSqlSession().getMapper(ResourceDAO.class).changeScore(uid, scoring);
    }

    @Override
    public boolean addDownResource(int downId, int rid, String nowTime) {

        return getSqlSession().getMapper(ResourceDAO.class).addDownResource(downId,rid,nowTime);
    }

    @Override
    public String getDownedTime(int rid, int uid) {
        return getSqlSession().getMapper(ResourceDAO.class).getDownedTime(rid,uid);
    }

    /**
     * 举报的资源保存到表中
     * @param reportResource
     * @return
     */
    @Override
    public boolean reportResource(ReportResource reportResource) {
        System.out.println(reportResource);
        boolean result= getSqlSession().getMapper(ResourceDAO.class).reportResource(reportResource);
        return result;
    }
}
