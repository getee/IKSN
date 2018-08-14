package group.first.iksn.model.dao;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.Resource;
import org.apache.ibatis.session.SqlSession;
import group.first.iksn.model.bean.ResourceComments;
import org.springframework.stereotype.Component;

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
    public ArrayList<Resource> searchResource(String s) {
        ArrayList<Resource> re=getSqlSession().getMapper(ResourceDAO.class).searchResource(s);
        System.out.println("resourceDAOImp:"+re);
        return re;
    }
}
