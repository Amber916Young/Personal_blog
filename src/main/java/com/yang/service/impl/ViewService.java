package com.yang.service.impl;

import com.yang.mapper.slave.ViewMapper;
import com.yang.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ViewService {
    @Autowired
    ViewMapper viewMapper;


    public List<HashMap<String, Object>> articleIndexQuery(Page page) {
        return viewMapper.articleIndexQuery(page);
    }

    public List<HashMap<String, Object>> articleQueryByParam(HashMap param) {
        return viewMapper.articleQueryByParam(param);
    }

    public List<HashMap<String, Object>> commentsQuery(Page page) {
        return viewMapper.commentsQuery(page);
    }

    public void commentsInsert(HashMap<String, Object> param) {
        viewMapper.commentsInsert(param);
    }

    public int commentsQueryCount() {
        return viewMapper.commentsQueryCount();
    }
}
