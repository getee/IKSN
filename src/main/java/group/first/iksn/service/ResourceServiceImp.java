package group.first.iksn.service;

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
}
