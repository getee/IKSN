package group.first.iksn.model.dao;

import group.first.iksn.model.bean.CollectResource;
import group.first.iksn.model.bean.Resource;
import group.first.iksn.model.bean.ResourceComments;

import java.util.ArrayList;

public interface ResourceDAO {
    //对资源进行评价评论
    boolean assessResource(ResourceComments c);

    boolean collectResource(CollectResource h);

    //搜索资源
    ArrayList<Resource> searchResource(String s);
}