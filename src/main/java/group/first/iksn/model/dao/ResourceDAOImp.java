package group.first.iksn.model.dao;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.Resource;
import org.apache.ibatis.session.SqlSession;
import group.first.iksn.model.bean.ResourceComments;
import org.springframework.stereotype.Component;

import java.util.List;

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

}
