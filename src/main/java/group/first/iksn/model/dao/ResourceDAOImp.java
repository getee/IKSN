package group.first.iksn.model.dao;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ReportResource;
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
