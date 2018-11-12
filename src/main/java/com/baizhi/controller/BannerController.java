package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
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
@RequestMapping("banner")
public class BannerController {
    @Resource
    private BannerService bannerService;

    /*查询*/
    @RequestMapping("findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page,Integer rows){
        Map<String,Object> results=new HashMap<String, Object>();
        //当前页的数据
        List<Banner> banners = bannerService.findByPage(page, rows);
        //总条数
        Long totals = bannerService.findTotals();
        results.put("rows",banners);
        results.put("total",totals);
        return results;
    }

    /*删除*/
    @RequestMapping("delBanner")
    public @ResponseBody Map<String,Object> delBanner(String id,HttpServletRequest request){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            //删除图片
            Banner oneBanner = bannerService.findOneBanner(id);
            System.out.println(oneBanner);
            //获取原始文件上传路径 根据相对路径获取绝对路径
            String realPath = request.getSession().getServletContext().getRealPath(oneBanner.getImgPath());
            System.out.println(realPath);
            File file = new File(realPath);
            file.delete();

            bannerService.removeBanner(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }

    /*批量删除*/
    @RequestMapping("delBanners")
    public @ResponseBody Map<String,Object> delBanners(String[] id,HttpServletRequest request){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            /*//删除图片
            Banner oneBanner = bannerService.findOneBanner(id);
            System.out.println(oneBanner);
            //获取原始文件上传路径 根据相对路径获取绝对路径
            String realPath = request.getSession().getServletContext().getRealPath(oneBanner.getImgPath());
            System.out.println(realPath);
            File file = new File(realPath);
            file.delete();*/

            bannerService.removeBanners(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }

    /*添加*/
    @RequestMapping("addBanner")
    public @ResponseBody Map<String,Object> addBanner(HttpServletRequest request, Banner banner,MultipartFile img){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            //获取原始文件名
            String originalFilename = img.getOriginalFilename();
            banner.setImgPath("back/banner/images/"+originalFilename);
            //获取文件上传路径 根据相对路径获取绝对路径
            String realPath = request.getSession().getServletContext().getRealPath("/back/banner/images");
            //上传
            img.transferTo(new File(realPath,img.getOriginalFilename()));

            bannerService.addBanner(banner);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }

    /*查一个*/
    @RequestMapping("findOne")
    public @ResponseBody Banner findOne(String id,HttpServletRequest request){
        Banner oneBanner = bannerService.findOneBanner(id);
        request.setAttribute("oneBanner",oneBanner);
        return oneBanner;
    }

    /*修改*/
    @RequestMapping("motifyBanner")
    public @ResponseBody Map<String,Object> motifyBanner(HttpServletRequest request,Banner banner,MultipartFile img){
        Map<String,Object> results=new HashMap<String, Object>();
        try {
            //删除原始图片
            Banner oneBanner = bannerService.findOneBanner(banner.getId());
            System.out.println(oneBanner);
            //获取原始文件上传路径 根据相对路径获取绝对路径
            String realPath = request.getSession().getServletContext().getRealPath(oneBanner.getImgPath());
            File file = new File(realPath);
            file.delete();

            //上传图片
            //获取原始文件名
            String originalFilename = img.getOriginalFilename();
            banner.setImgPath("back/banner/images/"+originalFilename);
            //获取文件上传路径 根据相对路径获取绝对路径
            String realPath1 = request.getSession().getServletContext().getRealPath("/back/banner/images");
            //上传
            img.transferTo(new File(realPath1,img.getOriginalFilename()));

            bannerService.motifyBanner(banner);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }


}
