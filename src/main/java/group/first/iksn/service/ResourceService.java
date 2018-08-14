package group.first.iksn.service;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.ResourceComments;

public interface ResourceService {
    //评论评分
    boolean assess(ResourceComments c);
    //收藏资源
    boolean houseResource(CollectResource h);

    int downResource(Integer rid);


    //查询下载次数

    //从reportResource表删除一行，处理违规资源的安置
    boolean Reject_oneReportResource(int report_id);
    boolean deleteIllegalResource(int resourceid);
}
