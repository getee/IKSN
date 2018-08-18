package group.first.iksn.service;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ReportResource;
import group.first.iksn.model.bean.Resource;
import group.first.iksn.model.bean.ReportResource;
import group.first.iksn.model.bean.ResourceComments;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.ArrayList;
import java.util.List;

import java.util.List;

public interface ResourceService {
    //评论评分
    boolean assess(ResourceComments c);
    //收藏资源
    boolean houseResource(CollectResource h);

    List<Resource> searchResource(String s);
   //资源分类搜索
    List<Resource> ResourcekeywordSearch(String key);
    int downResource(Integer rid);

    //资源详情界面加载
    Resource loadResource(int rid);

    //查询下载次数
    //举报资源
    boolean reportResource(ReportResource reportResource);

    //上传文件，在service检测重复
    boolean checkResource(CommonsMultipartFile f,String filePath);

    //资源表和资源标签表操作，resource.path
    boolean upLoadResourc(Resource resource,String[] rTag);



    //从reportResource表删除一行，处理违规资源的安置
    boolean Reject_oneReportResource(int report_id);
    boolean deleteIllegalResource(int resourceid);
    //添加mGetAllReportResource的服务层
    List<ReportResource> getAllReportResource(int page);
    //获取被举报资源的数量
    int reportResourceNum();

    //查询上传的资源
    List<Resource> getUploadResource(int uid);
    //下载资源
    List<Resource> getdownloadResource(int uid);
    //我收藏的资源
    List<Resource> myCollectResource(int uid);
    //上传者，下载者，积分数
    boolean downLoadResource(int pushId, int downId,int rid, int scoring);

    //获取上次资源下载时间判断是否下载过且不满足一小时true,false扣积分
    boolean downHour(int rid,int uid);
}
