package com.yang.controller;

import com.alibaba.fastjson.JSONObject;
import com.yang.entity.AJAXReturn;
import com.yang.entity.FileRecode;
import com.yang.entity.ResponseModel;
import com.yang.http.HttpResult;
import com.yang.service.impl.FileService;
import com.yang.service.impl.WebApiService;
import com.yang.utils.HttpRequest;
import com.yang.utils.HttpUtils;
import com.yang.utils.JsonUtils;
import com.yang.utils.TimeParse;
import lombok.SneakyThrows;
import net.coobird.thumbnailator.Thumbnails;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLDecoder;
import java.util.*;

@RestController
@RequestMapping("/file")
public class FileController {

    private static final Logger logger = LoggerFactory.getLogger(FileController.class);
    @Value("${fileupload.path}")
    private String fileuploadPath ;

    @Autowired
    FileService fileService;
    TimeParse timeParse = new TimeParse();
    @Autowired
    WebApiService webApiService;

    @RequestMapping("/uploadImage.do")
    @ResponseBody
    public Map<String, String> receiveImage(@RequestPart("upload") MultipartFile file, HttpServletRequest request) {
        Map<String, String> params = new HashMap<String, String>();
        try {
//            if(file.getSize()>1048576 ){
//                file = HandleImg(file);
//            }
            String directory = "article";

            HttpResult res = uplaodImgAndFile(file,directory,-1);
            String imageUrl = "";
            if(res.getCode()==200){
                HashMap json  = (HashMap) res.getData();
                imageUrl = json.get("url").toString();
                params.put("uploaded", "true");
                params.put("url", imageUrl);;
            }else {
                params.put("uploaded", "false");
                params.put("errmsg",res.getMsg() );
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return params;

    }
    //压缩图片
//    public MultipartFile HandleImg(MultipartFile file){
//        MultipartFile oldMultipartFile = file;
//        String fileName = file.getName();
//        String contentType = file.getContentType();
//        String origFilename = file.getOriginalFilename(); // 图片名
//        try {
//            File dest = new File("C:/upload/images/" + origFilename); // 保存位置
//            System.err.println(file.getSize());
//            Thumbnails.of(file.getInputStream()).scale(0.7f).outputQuality(0.25f).toFile(dest);
//            FileInputStream fileInputStream = new FileInputStream(dest);
//            file = new MockMultipartFile(fileName, origFilename, contentType, fileInputStream);
//            fileInputStream.close();
//            boolean success = dest.delete();
//            logger.info("删除临时file success：{}", success);
//        }catch (Exception e){
//            logger.error( "压缩图片失败,把MultipartFile赋值为原来的值oldFile,exception：{}", e);
//            file = oldMultipartFile;
//            e.printStackTrace();
//        }
//
//        return  file;
//    }

    @SneakyThrows
    @ResponseBody
    @RequestMapping(value = "/upload/multiple", produces = "application/json; charset=utf-8")
    public HttpResult newUserWorkerHeadImg(@RequestParam("files") MultipartFile[] file, @RequestParam HashMap<String,String> map) {
        String directory = map.get("directory");
        int aid = Integer.parseInt(String.valueOf(map.get("id")));
        directory = directory+aid;
        HttpResult res = uplaodImgAndFile(file, directory,aid);
        if (res.getCode()==200) {
            List<HashMap> mapList = (List<HashMap>) res.getData();
            HashMap hashMap = new HashMap();
            hashMap.put("cover_url",mapList.get(0).get("url"));
            hashMap.put("id",aid);
            webApiService.articleEdit(hashMap);
            return HttpResult.ok( mapList);
        } else {
            return HttpResult.error("上传出错");
        }
    }
    private HttpResult uplaodImgAndFile(@RequestParam("file") MultipartFile[] file,String directory,int aid) throws Exception {
        List<HashMap> mapList = new ArrayList<>();
        String url = fileuploadPath ;
        for (MultipartFile multipartFile : file) {
            String result = HttpRequest.upload(url,multipartFile,directory);
            ResponseModel rm = JsonUtils.jsonToPojo(result,ResponseModel.class);
            String imageUrl="";
            FileRecode fileupload = new FileRecode();
            String fileName ="";
            HashMap map = new HashMap();
            if(rm.getCode()==0){
                imageUrl = rm.getData().toString();
                fileName = imageUrl.substring(imageUrl.lastIndexOf(directory+"/"));
                fileName = fileName.substring(directory.length()+1);
                String imageName = multipartFile.getOriginalFilename();
                fileupload.setDirectory(directory);
                fileupload.setFileType(directory);
                fileupload.setFileName(fileName);
                fileupload.setFileUrl(imageUrl);
                fileupload.setMineType(multipartFile.getContentType());
                fileupload.setAid(aid);
                fileupload.setOriginalName(imageName);
                String loginTime = timeParse.convertDate2String(new Date(),"yyyy-MM-dd HH:mm:ss");
                fileupload.setUpload_time(loginTime);
                fileService.insertFile(fileupload);
                map.put("url",imageUrl);
                map.put("name",imageName);
                mapList.add(map);
            }
        }

        return  HttpResult.ok(mapList);
    }
    @SneakyThrows
    @ResponseBody
    @RequestMapping(value = "/upload", produces = "application/json; charset=utf-8")
    public HttpResult newUserWorkerHeadImg(@RequestParam("file") MultipartFile file, @RequestParam HashMap<String,String> map) {
        String directory = map.get("directory");
        int aid = Integer.parseInt(String.valueOf(map.get("id")));
        String url = "";
        if(map.containsKey("fileUrl")){
            if(map.get("fileUrl").isEmpty()||map.get("fileUrl").equals("")){
                HashMap map1 = webApiService.file_recordQueryMap(map);
                if(map1!=null){
                    return HttpResult.ok();
                }
            }
        }
        HttpResult res = uplaodImgAndFile(file, directory,aid);
        if (res.getCode()==200) {
            HashMap json = (HashMap) res.getData();
            HashMap hashMap = new HashMap();
            hashMap.put("cover_url",json.get("url").toString());
            hashMap.put("id",aid);
            webApiService.articleEdit(hashMap);
            return HttpResult.ok( json.get("url").toString());
        } else {
            return HttpResult.error("上传出错");
        }
    }

    @SneakyThrows
    @ResponseBody
    @RequestMapping(value = "/upload/editor", produces = "application/json; charset=utf-8")
    public HttpResult editor(@RequestParam("file") MultipartFile file) {
        String directory = "editor";
        HttpResult res = uplaodImgAndFile(file, directory,0);
        if (res.getCode()==200) {
            HashMap json = (HashMap) res.getData();
            return HttpResult.ok(json);
        } else {
            return HttpResult.error("上传出错");
        }
    }

    private HttpResult uplaodImgAndFile(MultipartFile file,String directory,int aid) throws Exception {
            String url = fileuploadPath ;
            String result = HttpRequest.upload(url,file,directory);
            ResponseModel rm = JsonUtils.jsonToPojo(result,ResponseModel.class);
            String imageUrl="";
            FileRecode fileupload = new FileRecode();
            String fileName ="";
            HashMap map = new HashMap();
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
                map.put("url",imageUrl);
                map.put("name",imageName);
            }
        return  HttpResult.ok(map);
    }

}
