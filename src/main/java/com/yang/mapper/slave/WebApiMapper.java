package com.yang.mapper.slave;


import com.yang.entity.SysUser;
import com.yang.utils.Page;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface WebApiMapper {

    List<HashMap<String, Object>> articleQueryAll(HashMap map);

    List<HashMap<String, Object>> tagsQueryAllPage(HashMap map);

    List<HashMap<String, Object>> articleTagsQueryAll(HashMap map);


    void articleUpload(HashMap<String, String> param);

    HashMap<String, Object> articleQueryById(HashMap map);

    @Delete("delete from yyjblog.article where id =#{id}")
    void deleteArticleByid(int id);

    List<HashMap<String, Object>> tagsQueryAll();

    void articleEdit(HashMap param);

    void tags_articleAdd(HashMap tagMap);

    HashMap tags_articleQuery(HashMap tagMap);
    List<HashMap<String, Object>> tags_articleQuery2(int id);

    int tagsQueryAllCount(Page page);

    void deleteTags(int id);

    void editTags(HashMap<String, Object> param);

    void addTags(HashMap<String, Object> param);

    List<HashMap<String, Object>> typesQueryAll();

    @Delete("delete from yyjblog.tags_article where aid =#{id}")
    void deletetags_articleByid(Object id);

    List<HashMap<String, Object>> file_recordQuery(int id);

    HashMap file_recordQueryMap(HashMap<String, String> map);

    HashMap<String, String> mediaInfoQuery( HashMap map);

    void deleteArticleTags(int id);
}
