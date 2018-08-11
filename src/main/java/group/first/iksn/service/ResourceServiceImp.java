package group.first.iksn.service;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ResourceComments;
import group.first.iksn.model.dao.ResourceDAO;
import org.springframework.stereotype.Component;

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

    @Override
    public int downResource(Integer rid) {
        return resourceDAO.downnum(rid);
    }


}
