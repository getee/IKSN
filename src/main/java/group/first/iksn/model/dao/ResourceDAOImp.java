package group.first.iksn.model.dao;

import group.first.iksn.model.bean.CollectResource;
import org.apache.ibatis.session.SqlSession;
import group.first.iksn.model.bean.ResourceComments;
import org.springframework.stereotype.Component;

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


}
