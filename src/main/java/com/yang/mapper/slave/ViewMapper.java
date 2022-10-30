package com.yang.mapper.slave;


import com.yang.utils.Page;
import org.apache.ibatis.annotations.Delete;

import java.util.HashMap;
import java.util.List;

public interface ViewMapper {
    List<HashMap<String, Object>> articleIndexQuery(Page page);
    List<HashMap<String, Object>> articleQueryByParam(HashMap param);



    List<HashMap<String, Object>> commentsQuery(Page page);

    void commentsInsert(HashMap<String, Object> param);

    int commentsQueryCount();

    List<HashMap> pageQueryCategoryData(Page page);

    int pageQueryCategoryCount(Page page);

    List<HashMap<String, Object>> momentIndexQuery(Page page);

    void addHelperPage(HashMap<String, Object> tableMap);

    int selectPageCount(Page page);

    List<HashMap<String, Object>> selectPageList(Page page);

    @Delete("delete from  yyjblog.helper")
    void deleteHepler();
}
