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

    Resource getResource(int rid);

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
    List<Resource> searchResource(String s);
    List<Resource> searchTag(String s);
      List<String> ajaxResourceName();

    //被举报资源的数量
    int reportResourceNum();
    //获取所有被举报资源
    List<ReportResource> getAllReportResource(int page);
    //根据rid查uid
    Resource selectUidByRid(int rid);
    //更改积分数（更改者，更改后积分）
    boolean changeScore(int uid, int scoring);

    List<Resource> ResourcekeywordSearch(@Param("key") int key);

    //上传的资源查询
    List<Resource> getUploadResource(int uid);
    //下载资源
    List<Resource> downloadResource(int uid);
    //我收藏的资源
    List<Resource> myCollectResource(int uid);
    //添加下载表
    boolean addDownResource(int downId, int rid, String nowTime);

    String getDownedTime(int rid, int uid);

    ArrayList<ResourceComments> getresourceComments(Integer rid);
    //他人上传的所有资源
    List<Resource> allPublishedResource(int uid);
}
