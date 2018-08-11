package group.first.iksn.service;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ResourceComments;

public interface ResourceService {
    //评论评分
    boolean assess(ResourceComments c);
    //收藏资源
    boolean houseResource(CollectResource h);
}
