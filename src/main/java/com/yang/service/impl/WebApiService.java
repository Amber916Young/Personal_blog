package com.yang.service.impl;

import com.yang.mapper.slave.WebApiMapper;
import com.yang.page.MybatisPageHelper;
import com.yang.page.PageRequest;
import com.yang.page.PageResult;
import com.yang.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class WebApiService {
    @Autowired
    WebApiMapper webApiMapper;

    public PageResult findPage(PageRequest pageRequest,String type) {
        Object keywords = pageRequest.getParamValue("keywords");
        if (keywords == null) {
            keywords = "";
        }
        HashMap map = new HashMap();
        map.put("keywords",keywords);
        if (type.equals("tag")) {
            return MybatisPageHelper.findPage(pageRequest, webApiMapper, "tagsQueryAllPage", map);
        } else if (type.equals("article")) {
            map.put("category","article");
            return MybatisPageHelper.findPage(pageRequest, webApiMapper, "articleQueryAll", map);
        }else if (type.equals("photoArticle")) {
            map.put("category","photo");
            return MybatisPageHelper.findPage(pageRequest, webApiMapper, "articleQueryAll", map);
        } else if (type.equals("articleTags")) {
            return MybatisPageHelper.findPage(pageRequest, webApiMapper, "articleTagsQueryAll", map);
        } else if (type.equals("videoArticle")) {
            map.put("category","video");
            return MybatisPageHelper.findPage(pageRequest, webApiMapper, "articleQueryAll", map);
        }
        return MybatisPageHelper.findPage(pageRequest, webApiMapper);
    }

//    public List<HashMap<String, Object>> articleQueryAll(Page page) {
//        return webApiMapper.articleQueryAll(page);
//    }

//    public int articleQueryAllCount(Page page) {
//        return webApiMapper.articleQueryAllCount(page);
//    }

    public void articleUpload(HashMap param) {
        webApiMapper.articleUpload(param);
    }

    public HashMap<String, Object> articleQueryById(HashMap map) {
        return webApiMapper.articleQueryById(map);
    }

    public void deleteArticleByid(int id) {
        webApiMapper.deleteArticleByid(id);
    }

    public List<HashMap<String, Object>> tagsQueryAll() {
        return webApiMapper.tagsQueryAll();
    }

    public void articleEdit(HashMap param) {
        webApiMapper.articleEdit(param);
    }

    public void tags_articleAdd(HashMap tagMap) {
        webApiMapper.tags_articleAdd(tagMap);
    }

    public HashMap tags_articleQuery(HashMap tagMap) {
       return webApiMapper.tags_articleQuery(tagMap);
    }
    public List<HashMap<String, Object>> tags_articleQuery2(int id) {
        return webApiMapper.tags_articleQuery2(id);
    }

    public int tagsQueryAllCount(Page page) {
        return webApiMapper.tagsQueryAllCount(page);
    }



    public void deleteTags(int id) {
        webApiMapper.deleteTags(id);
    }

    public void editTags(HashMap<String, Object> param) {
        webApiMapper.editTags(param);
    }

    public void addTags(HashMap<String, Object> param) {
        webApiMapper.addTags(param);
    }

    public List<HashMap<String, Object>> typesQueryAll() {
        return webApiMapper.typesQueryAll();
    }

    public void deletetags_articleByid(Object id) {
        webApiMapper.deletetags_articleByid(id);

    }

    public List<HashMap<String, Object>> file_recordQuery(int id) {
        return webApiMapper.file_recordQuery(id);

    }

    public HashMap file_recordQueryMap(HashMap<String, String> map) {
        return webApiMapper.file_recordQueryMap(map);
    }

    public HashMap<String, String> mediaInfoQuery( HashMap  map) {
        return webApiMapper.mediaInfoQuery(map);
    }

    public void deleteArticleTags(int id) {
        webApiMapper.deleteArticleTags(id);
    }


}
