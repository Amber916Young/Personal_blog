package com.yang.controller;

import com.alibaba.fastjson.JSONObject;
import com.yang.entity.AJAXReturn;
import com.yang.http.HttpResult;
import com.yang.service.impl.ViewService;
import com.yang.service.impl.WebApiService;
import com.yang.utils.AvatarImg;
import com.yang.utils.Page;
import com.yang.utils.TimeParse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/view")
public class WebViewController {
    @Autowired
    ViewService viewService;
    @Autowired
    WebApiService webApiService;
    @GetMapping(value = "/video", produces = "application/json; charset=utf-8")
    public Object VideoViewload() {
        return "/view/uploadYouku";
    }
    @GetMapping(value = "/video/load", produces = "application/json; charset=utf-8")
    public Object VideoView() {
        return "/view/videoView";
    }
    @GetMapping(value = "/detail/id/{id}/category/{category}", produces = "application/json; charset=utf-8")
    public Object detailView(@PathVariable("id") int id, @PathVariable("category") String category, Model model)  {
        HashMap param = new HashMap();
        param.put("id",id);
        List<HashMap<String, Object>> lists = viewService.articleQueryByParam(param);
        param = new HashMap();
        param.put("category",category);
        List<HashMap<String, Object>> lists2 = viewService.articleQueryByParam(param);
        List<HashMap<String, Object>> tagsList = webApiService.tags_articleQuery2(id);
        model.addAttribute("article",lists.get(0));
        model.addAttribute("articleList",lists2);
        model.addAttribute("tagsList",tagsList);
        if(category.equals("article")){
            return "/view/articleView";
        }else{
            List<HashMap<String, Object>> photosList = webApiService.file_recordQuery(id);
            model.addAttribute("photosList",photosList);
            return "/view/photoArticleView";
        }
    }
    @ResponseBody
    @PostMapping(value = "/video/queryInfo/id/{id}", produces = "application/json; charset=utf-8")
    public HttpResult VideoQuery(@PathVariable("id") int id)  {
        HashMap param = new HashMap();
        param.put("id",id);
        List<HashMap<String, Object>> lists = viewService.articleQueryByParam(param);
        param.put("type","youku");
        HashMap<String, String> map = webApiService.mediaInfoQuery(param);
        param = new HashMap();
        param.put("item",lists.get(0));
        param.put("media",map);
        return  HttpResult.ok(param);
    }
    @ResponseBody
    @PostMapping(value = "/article/index/recommend/query", produces = "application/json; charset=utf-8")
    public HttpResult indexRecommendArticleList()  {
        HashMap param = new HashMap();
        param.put("status","2");
        List<HashMap<String, Object>> lists = viewService.articleQueryByParam(param);
        return  HttpResult.ok(lists);
    }


    @ResponseBody
    @PostMapping(value = "/article/index/query", produces = "application/json; charset=utf-8")
    public HttpResult indexArticleList(@RequestBody String jsonData) throws UnsupportedEncodingException {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=","");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        int pageno = Integer.parseInt(param.get("pageno").toString());
        String keyWord = param.get("keyWord").toString();
        Page page = new Page();
        page.setRows(8);
        page.setPage(pageno);
        if(keyWord.equals("all")){
            keyWord=null;
        }
        page.setKeyWord(keyWord);
        page.setStart(page.getStart());
        List<HashMap<String, Object>> lists = viewService.articleIndexQuery(page);
        return  HttpResult.ok(lists);
    }
    @ResponseBody
    @PostMapping(value = "/photo/index/query", produces = "application/json; charset=utf-8")
    public HttpResult indexphotoList(@RequestBody String jsonData) throws UnsupportedEncodingException {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=","");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        int pageno = Integer.parseInt(param.get("pageno").toString());
        String keyWord = param.get("keyWord").toString();
        Page page = new Page();
        page.setRows(8);
        page.setPage(pageno);
        if(keyWord.equals("all")){
            keyWord=null;
        }
        page.setKeyWord(keyWord);
        page.setStart(page.getStart());
        List<HashMap<String, Object>> lists = viewService.articleIndexQuery(page);
        return  HttpResult.ok(lists);
    }
    @ResponseBody
    @PostMapping(value = "/comment/query", produces = "application/json; charset=utf-8")
    public HttpResult commentQuery(@RequestBody String jsonData) throws UnsupportedEncodingException {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=","");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        int pageno = Integer.parseInt(param.get("pageno").toString());
        Page page = new Page();
        page.setRows(5);
        page.setPage(pageno);
        page.setStart(page.getStart());
        page.setKeyWord(param.get("aid").toString());
        List<HashMap<String, Object>> lists = viewService.commentsQuery(page);
        int tatal  = viewService.commentsQueryCount();
        for(int i=0;i<lists.size();i++){
            String content =  lists.get(i).get("content").toString();
            lists.get(i).put("content",URLDecoder.decode(content, "utf-8"));
        }
        HashMap res = new HashMap();
        res.put("total",tatal);
        res.put("lists",lists);

        return  HttpResult.ok(res);
    }
    @ResponseBody
    @PostMapping(value = "/comment/insert", produces = "application/json; charset=utf-8")
    public HttpResult commentInsert(@RequestBody String jsonData) throws IOException {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=","");
        TimeParse timeParse = new TimeParse();
        String create_time = timeParse.convertDate2String(new Date(),"yyyy-MM-dd HH:mm:ss");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        String name = param.get("username").toString();
        String content = param.get("content").toString();
        param.put("content" , URLEncoder.encode(content, "utf-8"));
        param.put("avatar" , AvatarImg.generateImg(name, name));
        param.put("createTime" , create_time);
        viewService.commentsInsert(param);
        return  HttpResult.ok("评论成功");
    }
}
