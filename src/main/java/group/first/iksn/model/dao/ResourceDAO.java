package group.first.iksn.model.dao;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.Resource;
import group.first.iksn.model.bean.ReportResource;
import group.first.iksn.model.bean.ResourceComments;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.ArrayList;

public interface ResourceDAO {
    //对资源进行评价评论
     boolean assessResource(ResourceComments c);

    boolean collectResource(CollectResource h);

    int downnum(Integer rid);

    //检测资源是否重复
    public Resource checkFile(String MD5, String SHA);

    //添加资源
    public int addResource(Resource resource);

    //添加资源标签
    public boolean addResourceTag(@Param("rid") int rid,@Param("rtag") List rtag);

    //删除ReportResource表数据
    boolean deleteResourceFromReport(int id);
    //删除跟resource表相关的表数据
    boolean deleteResourceOthers(int rid);
    //删除resource表数据
    boolean deleteResource(int rid);

    //举报资源
    boolean reportResource(ReportResource reportResource);

    //搜索资源
    ArrayList<Resource> searchResource(String s);
}