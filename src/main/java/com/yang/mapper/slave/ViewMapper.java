package com.yang.mapper.slave;


import com.yang.utils.Page;

import java.util.HashMap;
import java.util.List;

public interface ViewMapper {
    List<HashMap<String, Object>> articleIndexQuery(Page page);
    List<HashMap<String, Object>> articleQueryByParam(HashMap param);

    List<HashMap<String, Object>> commentsQuery(Page page);

    void commentsInsert(HashMap<String, Object> param);

    int commentsQueryCount();
}
