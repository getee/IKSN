package group.first.iksn.service;

import group.first.iksn.model.bean.CollectResource;
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

    List<Resource> searchResource(String s);
   //资源分类搜索
    List<Resource> ResourcekeywordSearch(String key);
    int downResource(Integer rid);


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
}
