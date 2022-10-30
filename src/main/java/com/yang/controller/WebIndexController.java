package com.yang.controller;

import com.yang.service.impl.ViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;

@Controller
public class WebIndexController {
    @Autowired
    ViewService viewService;

    @RequestMapping("")
    public String homepage(){
        return "/view/indexDark";
    }
    @RequestMapping("/categories/type/{type}")
    public String categories_page(@PathVariable("type") String type, Model model){
        return "/view/categoryView";
    }
    @RequestMapping("/categories")
    public String categories(Model model){
//        HashMap param = new HashMap();
//        param.put("memo",type);
//        List<HashMap<String, Object>> lists2 = viewService.articleQueryByParam(param);
//        model.addAttribute("articleList",lists2);
//        model.addAttribute("type",type);
        return "/view/categoryView";
    }


    @RequestMapping("/detail")
    public String detailpage(){
        return "/view/articleView";
    }
    @RequestMapping("/about")
    public String aboutMePage(){
        return "/view/aboutView";
    }
}
