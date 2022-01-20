//package com.yang.controller;
//
//import com.alibaba.fastjson.JSONObject;
//import com.yang.http.HttpResult;
//import com.yang.service.impl.WebApiService;
////import com.yang.utils.upload.YoukuUploader;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import javax.servlet.http.HttpServletRequest;
//import java.io.File;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Map;
//
//@RestController
//@RequestMapping("/video")
//public class WebUploadVideoController {
//    private static YoukuUploader uploader;
//    @Autowired
//    WebApiService webApiService;
//    @Value("${localPath.path}")
//    private String localPath ;
//
//    public void keepLoaction(MultipartFile file) {
//        String origFilename = file.getOriginalFilename(); // 图片名
//        try {
//            File dest = new File(localPath + origFilename); // 保存位置
//
//            boolean success = dest.delete();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    @RequestMapping("/youku/upload")
//    @ResponseBody
//    public HttpResult VideoUpload(@RequestPart("file") MultipartFile file,
//                                  @RequestParam HashMap<String,String> fontMap) throws IOException {
//        HashMap param = new HashMap();
//        param.put("type","youku");
//        HashMap<String, String> map = webApiService.mediaInfoQuery(param);
//        String client_id = map.get("client_id");
//        String client_secret = map.get("client_secret");
//        String result = "";
//        String access_token =map.get("token");
//        HashMap<String, String> params, uploadInfo;
//        String filename = file.getOriginalFilename();//视频绝对路径
//        String jsonData = fontMap.get("jsonData");
//        HashMap<String, String> jsonMap = JSONObject.parseObject(jsonData, HashMap.class);
//        File dest = new File(localPath + filename); // 保存位置
//        file.transferTo(dest);
//        params = new HashMap<String, String>();
//        params.put("access_token", access_token);
//        uploadInfo = new HashMap<String, String>();
//        uploadInfo.put("target", "youku"); // 上传目标 必填 youku
//        uploadInfo.put("file_name", dest.getAbsolutePath()); // 指定：文件名
//        uploadInfo.put("title", jsonMap.get("title")); // 指定：标题
//        uploadInfo.put("tags", "原创"); // 指定：分类
//        uploadInfo.put("public_type", "all");
//        if(jsonMap.containsKey("public_type")){
//            if(jsonMap.get("public_type").equals("password")){
//                  uploadInfo.put("watch_password", jsonMap.get("watch_password")); //密码，当public_type为password时，必填
//            }
//        }else {
//            uploadInfo.put("public_type", "all"); //视频公开类型（all：公开（默认），friend：仅好友，password：需要输入密码才能观看）
//        }
//        uploader = new YoukuUploader(client_id, client_secret);
//        result = uploader.upload(params, uploadInfo,  dest.getAbsolutePath(), true); // 第四个参数：boolean类型（true：显示进度 false：不显示进度）
//        System.out.print(result); //返回视频id
//        boolean success = dest.delete();
//        return HttpResult.ok();
//    }
//
//}
