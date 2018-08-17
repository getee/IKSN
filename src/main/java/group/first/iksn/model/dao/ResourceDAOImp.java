package group.first.iksn.model.dao;

import group.first.iksn.model.bean.CollectResource;
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
            System.out.println("这是添加违规博客出错了");
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
            System.out.println("这是添加违规博客出错了");
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

    /**
     * 资源搜索
     * @param s
     * @return
     */
    @Override
    public List<Resource> searchResource(String s) {
        List<Resource> re=getSqlSession().getMapper(ResourceDAO.class).searchResource(s);
        System.out.println("resourceDAOImp:"+re);
        return re;
    }

    /**
     * 博客分类搜索
     * @param key
     * @return
     */
    @Override
    public List<Resource> ResourcekeywordSearch(String key) {
        List<Resource> list=getSqlSession().getMapper(ResourceDAO.class).ResourcekeywordSearch(key);
        return list;
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
