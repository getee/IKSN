package group.first.iksn.service;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ReportResource;
import group.first.iksn.model.bean.Resource;
import group.first.iksn.model.bean.ReportResource;
import group.first.iksn.model.bean.ResourceComments;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.ArrayList;

import java.util.List;

public interface ResourceService {
    //评论评分
    boolean assess(ResourceComments c);
    //收藏资源
    boolean houseResource(CollectResource h);

    ArrayList<Resource> searchResource(String s);

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

    //上传者，下载者，积分数
    boolean downLoadResource(int pushId, int downId, int scoring);
}
