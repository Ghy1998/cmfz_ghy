package com.baizhi.controller;

import com.baizhi.entity.Article;
import com.baizhi.service.ArticleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("artcile")
public class ArticleController {
    @Resource
    private ArticleService articleService;

    /*查询*/
    @RequestMapping("findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page,Integer rows){
        HashMap<String, Object> results = new HashMap<>();
        List<Article> articlePage = articleService.findArticlePage(page, rows);
        Long articleTotal = articleService.findArticleTotal();
        results.put("rows",articlePage);
        results.put("total",articleTotal);
        return results;
    }

    /*添加*/
    @RequestMapping("addArticle")
    public @ResponseBody Map<String,Object> addArticle(MultipartFile img, HttpServletRequest request, Article article){
        HashMap<String, Object> results = new HashMap<>();
        try {
            //获取原始文件名
            String originalFilename = img.getOriginalFilename();
            article.setImgPath("back/article/images/"+originalFilename);
            //获取文件上传路径 根据相对路径获取绝对路径
            String realPath = request.getSession().getServletContext().getRealPath("/back/article/images");
            //上传
            img.transferTo(new File(realPath,img.getOriginalFilename()));

            articleService.addArticle(article);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }

    /*删除*/
    @RequestMapping("removeArticle")
    public @ResponseBody Map<String,Object> removeArticle(HttpServletRequest request,String id){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            //删除图片
            Article oneArticle = articleService.findOne(id);
            System.out.println(oneArticle);
            //获取原始文件上传路径 根据相对路径获取绝对路径
            String realPath = request.getSession().getServletContext().getRealPath(oneArticle.getImgPath());
            File file = new File(realPath);
            file.delete();

            articleService.removeArticle(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }
}
