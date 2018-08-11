package group.first.iksn.model.dao;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ResourceComments;

public interface ResourceDAO {
    //对资源进行评价评论
     boolean assessResource(ResourceComments c);

    boolean collectResource(CollectResource h);
}
