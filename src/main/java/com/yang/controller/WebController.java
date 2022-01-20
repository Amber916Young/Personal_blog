package com.yang.controller;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yang.entity.FileRecode;
import com.yang.entity.ResponseModel;
import com.yang.http.HttpResult;
import com.yang.page.PageRequest;
import com.yang.service.impl.FileService;
import com.yang.service.impl.WebApiService;
import com.yang.utils.HttpRequest;
import com.yang.utils.JsonUtils;
import com.yang.utils.RandomID;
import com.yang.utils.TimeParse;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

@RestController
@RequestMapping("web")
public class WebController {
    @Autowired
    WebApiService webApiService;

    @Value("${Delcode.key}")
    private String Delcode;
    TimeParse timeParse = new TimeParse();


//    @ResponseBody
//    @GetMapping(value = "/tags/default/queryAll", produces = "application/json; charset=utf-8")
//    public Object tagsListdefault(@PathVariable("id") int id) {
//        DataSourceContextHolder.setDbType("dataSourceA");
//        List<HashMap<String, Object>> lists = webApiService.tagsQueryAll();
//
//
//        return  AJAXReturn.success("查询成功",lists);
//    }
//    @ResponseBody
//    @GetMapping(value = "/tags/queryAll", produces = "application/json; charset=utf-8")
//    public Object tagsList(Page page, @RequestParam("limit") int limit, HttpServletRequest request) {
//        DataSourceContextHolder.setDbType("dataSourceA");
//        String keyword = request.getParameter("keyword");
//        page.setRows(limit);
//        page.setKeyWord(keyword);
//        List<HashMap<String, Object>> lists = webApiService.tagsQueryAllPage(page);
//        int totals=webApiService.tagsQueryAllCount(page);
//        return  AJAXReturn.success("查询成功",lists,totals);
//    }
//
    @SneakyThrows
    @ResponseBody
    @PostMapping(value = "/tags/edit")
    public HttpResult tagsEdit(@RequestBody String jsonData)  {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=", "");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        webApiService.editTags(param);
        return HttpResult.ok("修改成功");
    }
    @SneakyThrows
    @ResponseBody
    @PostMapping(value = "/tags/add")
    public HttpResult tagsAdd(@RequestBody String jsonData)  {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=", "");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        webApiService.addTags(param);
        return HttpResult.ok("新增成功");
    }

    @ResponseBody
    @PostMapping(value = "/tags/deletes")
    public HttpResult tagsDeletes(@RequestBody String jsonData)  throws UnsupportedEncodingException {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=", "");
        List<HashMap<Integer, String>> ids = JsonUtils.jsonToPojo(jsonData, List.class);
        String res = "";
        for (int i = 0; i < ids.size(); i++) {
            int id = Integer.parseInt( String.valueOf(ids.get(i).get("id")));
            webApiService.deleteTags(id);
        }
        res = "删除成功";
        return HttpResult.ok(res);
    }

    @ResponseBody
    @PostMapping(value = "/article/tag/deletes")
    public HttpResult ArticletagsDeletes(@RequestBody String jsonData)  throws UnsupportedEncodingException {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=", "");
        List<HashMap<Integer, String>> ids = JsonUtils.jsonToPojo(jsonData, List.class);
        String res = "";
        for (int i = 0; i < ids.size(); i++) {
            int id = Integer.parseInt( String.valueOf(ids.get(i).get("id")));
            webApiService.deleteArticleTags(id);
        }
        res = "删除成功";
        return HttpResult.ok(res);
    }
    @Value("${fileupload.path}")
    private String fileuploadPath ;
    @Autowired
    FileService fileService;
    private HttpResult uplaodImgAndFile(MultipartFile file,String directory,int aid) throws Exception {
        String url = fileuploadPath ;
        String result = HttpRequest.upload(url,file,directory);
        ResponseModel rm = JsonUtils.jsonToPojo(result,ResponseModel.class);
        String imageUrl="";
        FileRecode fileupload = new FileRecode();
        String fileName ="";
        if(rm.getCode()==0){
            imageUrl = rm.getData().toString();
            fileName = imageUrl.substring(imageUrl.lastIndexOf(directory+"/"));
            fileName = fileName.substring(directory.length()+1);
            String imageName = file.getOriginalFilename();
            fileupload.setFileType(directory);
            directory = directory+aid;
            fileupload.setDirectory(directory);
            fileupload.setFileName(fileName);
            fileupload.setAid(aid);
            fileupload.setFileUrl(imageUrl);
            fileupload.setMineType(file.getContentType());
            fileupload.setOriginalName(imageName);
            String loginTime = timeParse.convertDate2String(new Date(),"yyyy-MM-dd HH:mm:ss");
            fileupload.setUpload_time(loginTime);
            fileService.insertFile(fileupload);
        }
        return  HttpResult.ok("ok",imageUrl);
    }
    @ResponseBody
    @PostMapping("/videoArticle/edit")
    public HttpResult videoArticleEdit(@RequestPart("file") MultipartFile file,   @RequestParam HashMap<String,String> fontMap) throws Exception {
        String jsonData = fontMap.get("jsonData");
        String directory = fontMap.get("directory");
        String create_time = timeParse.convertDate2String(new Date(),"yyyy-MM-dd HH:mm:ss");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        param.put("status","1");
        param.put("publish_time",create_time);
        int id = Integer.parseInt(String.valueOf(param.get("id")));
        directory = directory+id;
        HttpResult res = uplaodImgAndFile(file, directory,id);
        if(res.getCode()==200){
            if (param.containsKey("tagsName")) {
                JSONArray taglistStr = (JSONArray) param.get("tagsName");
                HashMap tagMap = new HashMap<>();
                tagMap.put("aid", param.get("id"));
                webApiService.deletetags_articleByid(param.get("id"));
                for (int i = 0; i < taglistStr.size(); i++) {
                    tagMap.put("tid", taglistStr.get(i));
                    webApiService.tags_articleAdd(tagMap);
                }
            }
            param.put("cover_url",res.getData());
            webApiService.articleEdit(param);
            return HttpResult.ok("上传成功");
        }
        return HttpResult.error("上传失败");

    }


    @ResponseBody
    @PostMapping("/videoArticle/edit/noneimg")
    public HttpResult videoArticleEditNoimg(@RequestBody String jsonData) throws UnsupportedEncodingException {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=", "");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        param.put("status", "1");
        String create_time = timeParse.convertDate2String(new Date(),"yyyy-MM-dd HH:mm:ss");
        param.put("publish_time",create_time);
        if (param.containsKey("tagsName")) {
            JSONArray taglistStr = (JSONArray) param.get("tagsName");
            HashMap tagMap = new HashMap<>();
            tagMap.put("aid", param.get("id"));
            webApiService.deletetags_articleByid(param.get("id"));
            for (int i = 0; i < taglistStr.size(); i++) {
                tagMap.put("tid", taglistStr.get(i));
                webApiService.tags_articleAdd(tagMap);
            }
        }
        webApiService.articleEdit(param);
        return HttpResult.ok("上传成功");
    }
    @ResponseBody
    @GetMapping("/VideoArticle/edit/id/{id}")
    public HttpResult VideoArticleEdit(@PathVariable("id") int id) {
        HashMap map = new HashMap();
        map.put("id",id);
        map.put("category","video");
        HashMap<String, Object> hashMap = webApiService.articleQueryById(map);
        List<HashMap<String, Object>> tagslist =webApiService.tags_articleQuery2(id);
        List<HashMap<String, Object>> fileList =webApiService.file_recordQuery(id);
        map = new HashMap();
        map.put("article",hashMap);
        map.put("tagslist",tagslist);
        map.put("fileList",fileList);
        return HttpResult.ok(map);
    }

    @ResponseBody
    @PostMapping("/videoAritcle/upload")
    public Object videoAritcleUpload(@RequestPart("file") MultipartFile file,
                                     @RequestParam HashMap<String,String> fontMap) throws Exception {
        String jsonData = fontMap.get("jsonData");
        String directory = fontMap.get("directory");
        String create_time = timeParse.convertDate2String(new Date(),"yyyy-MM-dd HH:mm:ss");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        param.put("create_time",create_time);
        param.put("status","1");
        param.put("category","video");
        param.put("publish_time",create_time);
        JSONArray taglistStr = (JSONArray) param.get("tagsName");
        int id = RandomID.genID3();
        directory = directory+id;
        HttpResult res = uplaodImgAndFile(file, directory,id);
        if(res.getCode()==200){
            param.put("id", String.valueOf(id));
            HashMap tagMap = new HashMap<>();
            tagMap.put("aid",String.valueOf(id));
            for (int i=0;i<taglistStr.size();i++){
                tagMap.put("tid",taglistStr.get(i));
                webApiService.tags_articleAdd(tagMap);
            }
            param.put("cover_url",res.getData());
            webApiService.articleUpload(param);
            return HttpResult.ok("上传成功",id);
        }
        return HttpResult.error("上传失败");
    }
    @ResponseBody
    @GetMapping(value = "/tag/queryAll", produces = "application/json; charset=utf-8")
    public HttpResult tagList() {
        return HttpResult.ok(webApiService.tagsQueryAll());
    }
    @ResponseBody
    @GetMapping(value = "/type/queryAll", produces = "application/json; charset=utf-8")
    public HttpResult typeList() {
        return HttpResult.ok(webApiService.typesQueryAll());
    }

    @ResponseBody
    @PostMapping(value = "/article/tag/queryAll", produces = "application/json; charset=utf-8")
    public HttpResult articletagFindPage(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(webApiService.findPage(pageRequest,"articleTags"));
    }
    @ResponseBody
    @PostMapping(value = "/page/tag/queryAll", produces = "application/json; charset=utf-8")
    public HttpResult tagFindPage(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(webApiService.findPage(pageRequest,"tag"));
    }
    @ResponseBody
    @PostMapping(value = "/article/queryAll", produces = "application/json; charset=utf-8")
    public HttpResult articleList(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(webApiService.findPage(pageRequest,"article"));
    }
    @ResponseBody
    @PostMapping(value = "/photoArticle/queryAll", produces = "application/json; charset=utf-8")
    public HttpResult photoArticleList(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(webApiService.findPage(pageRequest,"photoArticle"));
    }
    @ResponseBody
    @PostMapping(value = "/videoArticle/queryAll", produces = "application/json; charset=utf-8")
    public HttpResult videoArticle(@RequestBody PageRequest pageRequest) {
        return HttpResult.ok(webApiService.findPage(pageRequest,"videoArticle"));
    }
    @ResponseBody
    @PostMapping("/photoArticle/upload")
    public Object photoArticleUpload(@RequestBody String jsonData) throws UnsupportedEncodingException {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=","");
        String create_time = timeParse.convertDate2String(new Date(),"yyyy-MM-dd HH:mm:ss");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        param.put("create_time",create_time);
        param.put("status","1");
        param.put("category","photo");
        param.put("type","摄影");
        JSONArray taglistStr = (JSONArray) param.get("tagsName");
        int id = RandomID.genID3();
        param.put("id", String.valueOf(id));
        HashMap tagMap = new HashMap<>();
        tagMap.put("aid",String.valueOf(id));
        for (int i=0;i<taglistStr.size();i++){
            tagMap.put("tid",taglistStr.get(i));
            webApiService.tags_articleAdd(tagMap);
        }

        webApiService.articleUpload(param);
        return HttpResult.ok("上传成功",id);
    }

    @ResponseBody
    @GetMapping("/PhotoArticle/edit/id/{id}")
    public HttpResult PhotoArticEdit(@PathVariable("id") int id) {
        HashMap map = new HashMap();
        map.put("id",id);
        map.put("category","photo");
        HashMap<String, Object> hashMap = webApiService.articleQueryById(map);
        List<HashMap<String, Object>> tagslist =webApiService.tags_articleQuery2(id);
        List<HashMap<String, Object>> fileList =webApiService.file_recordQuery(id);
        map = new HashMap();
        map.put("article",hashMap);
        map.put("tagslist",tagslist);
        map.put("fileList",fileList);
        return HttpResult.ok(map);
    }
    @ResponseBody
    @PostMapping("/article/upload")
    public Object articleUpload(@RequestBody String jsonData) throws UnsupportedEncodingException {
//        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=","");
        String create_time = timeParse.convertDate2String(new Date(),"yyyy-MM-dd HH:mm:ss");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        param.put("create_time",create_time);
        param.put("status","1");
        param.put("category","article");
        JSONArray taglistStr = (JSONArray) param.get("tagsName");
        int id = RandomID.genID3();
        param.put("id", String.valueOf(id));
        HashMap tagMap = new HashMap<>();
        tagMap.put("aid",String.valueOf(id));
        for (int i=0;i<taglistStr.size();i++){
            tagMap.put("tid",taglistStr.get(i));
            webApiService.tags_articleAdd(tagMap);
        }
        webApiService.articleUpload(param);
        return HttpResult.ok("上传成功",id);
    }
    @ResponseBody
    @PostMapping("/article/edit")
    public HttpResult articleEdit(@RequestBody String jsonData) throws UnsupportedEncodingException {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=","");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        param.put("status","1");
        if(param.containsKey("tagsName")){
            JSONArray taglistStr = (JSONArray) param.get("tagsName");
            HashMap tagMap = new HashMap<>();
            tagMap.put("aid",  param.get("id"));
            webApiService.deletetags_articleByid( param.get("id"));
            for (int i=0;i<taglistStr.size();i++){
                tagMap.put("tid", taglistStr.get(i));
//            HashMap exist = webApiService.tags_articleQuery(tagMap);
//            if(exist==null){
                webApiService.tags_articleAdd(tagMap);
//            }
            }
        }

        webApiService.articleEdit(param);
        return HttpResult.ok("上传成功");
    }

    @ResponseBody
    @GetMapping("/article/edit/id/{id}")
    public HttpResult articleEdit(@PathVariable("id") int id) {
        HashMap map = new HashMap();
        map.put("id", id);
        map.put("category", "article");
        HashMap<String, Object> hashMap = webApiService.articleQueryById(map);
        List<HashMap<String, Object>> tagslist = webApiService.tags_articleQuery2(id);
        map = new HashMap();
        map.put("article", hashMap);
        map.put("tagslist", tagslist);
        return HttpResult.ok(map);
    }

    @ResponseBody
    @PostMapping(value = "/article/deletes")
    public HttpResult articleDeletes(@RequestBody String jsonData)  throws UnsupportedEncodingException {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=", "");
        List<HashMap<Integer, String>> ids = JsonUtils.jsonToPojo(jsonData, List.class);
        String res = "";
        for (int i = 0; i < ids.size(); i++) {
            int id = Integer.parseInt( String.valueOf(ids.get(i).get("id")));
            webApiService.deleteArticleByid(id);
            webApiService.deletetags_articleByid(id);
        }
        res = "删除成功";
        return HttpResult.ok(res);

    }

}
