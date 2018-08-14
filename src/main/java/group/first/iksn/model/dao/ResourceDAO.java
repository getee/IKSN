package group.first.iksn.model.dao;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ResourceComments;

public interface ResourceDAO {
    //对资源进行评价评论
     boolean assessResource(ResourceComments c);

    boolean collectResource(CollectResource h);

    int downnum(Integer rid);

    //删除ReportResource表数据
    boolean deleteResourceFromReport(int id);
    //删除跟resource表相关的表数据
    boolean deleteResourceOthers(int rid);
    //删除resource表数据
    boolean deleteResource(int rid);
}
