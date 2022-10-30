package com.yang.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.yang.http.HttpResult;
import com.yang.service.impl.ViewService;
import com.yang.utils.Page;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URLDecoder;
import java.nio.charset.Charset;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ClassName:HelpController
 * @Auther: yyj
 * @Description:
 * @Date: 28/10/2022 18:33
 * @Version: v1.0
 */


@Controller
@RequestMapping("/helper")
public class HelpController {

    @GetMapping("")
    public String homepage() {
        return "/view/helpPage";
    }

    @Autowired
    ViewService viewService;

    @SneakyThrows
    @ResponseBody
    @PostMapping("/produce/bat")
    public HttpResult produce_Bat(@RequestBody String jsonData) {
        jsonData = URLDecoder.decode(jsonData, "utf-8").replaceAll("=", "");
        HashMap<String, Object> param = JSONObject.parseObject(jsonData, HashMap.class);
        String match = param.get("match").toString().trim();
        String[] sourceList = param.get("sourceList").toString().trim().split("\\n");
        String[] numberList = param.get("numberList").toString().trim().split("\\n");
        if (sourceList.length != numberList.length && numberList.length != 1) return HttpResult.error("数据不等长，请检查");
        int len = sourceList.length;
        String content = "";
        List<String> batList  = new ArrayList<>();
        viewService.deleteHepler();
        for (int i = 0; i < len; i++) {
            String replaceNo = numberList.length == 1? numberList[0]: numberList[i].trim();
            String org = sourceList[i].trim();
            String replaceNanme = "";
            if(match.equals("") || match == null){
                if(org.indexOf("_") != -1){
                    String tmp =  org.substring(org.indexOf("_"));
                    replaceNanme = numberList.length == 1? numberList[0]+tmp : numberList[i]+tmp;
                }else {
                    replaceNanme = numberList.length == 1? numberList[0]+org : numberList[i]+org;
                }
            }else {
                if(org.indexOf("_") != -1){
                    replaceNanme = numberList.length == 1? numberList[0]+org.substring(org.indexOf("_")) : org.replace(match, replaceNo);
                }else {
                    replaceNanme = numberList.length == 1? numberList[0]+org : org.replace(match, replaceNo);
                }
            }
            content += "REN " + org + "  " + replaceNanme + "\n";
            batList.add("REN " + org + "  " + replaceNanme );
            HashMap<String, Object> tableMap = new HashMap<>();
            tableMap.put("source_file", org);
            tableMap.put("new_file", replaceNanme);
            tableMap.put("file_no", replaceNo);
            tableMap.put("create_time", new Date());
            viewService.addHelperPage(tableMap);
        }
        String file1 = creatBAT(batList, "batfile");
        String file2 = createTxtFile2(content, "txtfile");
        HashMap<String, Object> res = new HashMap<>();
        res.put("bat", file1);
        res.put("txt", file2);
        res.put("txtContent", batList);
        return HttpResult.ok("successfully", res);
    }
    public static String creatBAT(final List<String> list, final String filename) throws FileNotFoundException {
        String realPath = ResourceUtils.getURL("classpath:").getPath() + "static";
        String filePath = realPath + "/bat/" + filename + ".bat";
        String downLoad = "/bat/" + filename + ".bat";
        try {
            File file = new File(filePath);
            if (!file.exists()) {
                file.createNewFile();
            }
            OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(file), "GBK");
            BufferedWriter writer = new BufferedWriter(write);
            for (int i = 0; i < list.size(); i++) {
                writer.write(list.get(i));
                if (i < list.size()) {
                    writer.write("\r\n");
                }
            }
            writer.close();
            write.close();
        } catch (Exception e) {
            System.out.println("写文件内容操作出错");
            e.printStackTrace();
        }
        return downLoad;
    }

    @ResponseBody
    @RequestMapping(value = "/queryAll", produces = "application/json; charset=utf-8")
    public Object queryClientTerminaldb(Page page, @RequestParam("limit") int limit,
                                        HttpServletRequest request) {
        HashMap<String, Object> resultMap = new HashMap<>();
        try {
            int totals = 0;
            page.setRows(100);
            String keyword = request.getParameter("keyword");
            if (keyword == null || keyword.length() <= 0) {
                keyword = null;
            }
            page.setKeyWord(keyword);
            totals = viewService.selectPageCount(page);
            List<HashMap<String, Object>> list = viewService.selectPageList(page);
            page.setTotalRecord(totals);
            resultMap.put("code", 0);
            resultMap.put("msg", "");
            resultMap.put("data", list);
            resultMap.put("count", totals);
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("code", 500);
            resultMap.put("msg", "");
        }
        return resultMap;
    }

    public String createTxtFile2(String content, String filename) throws FileNotFoundException {
        String realPath = ResourceUtils.getURL("classpath:").getPath() + "static";
        String filePath = realPath + "/bat/" + filename + ".txt";
        String downLoad = "/bat/" + filename + ".txt";
        FileWriter fw = null;
        try {
            File file = new File(filePath);
            if (!file.exists()) {
                file.createNewFile();
            }
            fw = new FileWriter(filePath);
            fw.write(content);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                fw.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return downLoad;
    }

    public static String creatBat(List<String> list, String filename)  throws FileNotFoundException {
        OutputStream outputStream = null;
        String realPath = ResourceUtils.getURL("classpath:").getPath() + "static";
        String filePath = realPath + "/bat/" + filename + ".bat";
        String downLoad = "/bat/" + filename + ".bat";
        File file = new File(filePath);
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            outputStream = new FileOutputStream(file);
            // 此处循环操作是因为要将.bat文件转换为windows格式
            for (int i = 0; i < list.size(); i++) {
                byte[] bytes = list.get(i).getBytes(Charset.forName("GB2312"));
                outputStream.write(bytes);
                if (i < list.size()) {
                    outputStream.write("\r\n".getBytes(Charset.forName("GB2312")));
                }
            }
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return downLoad;

    }

}
