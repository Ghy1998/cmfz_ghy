package com.baizhi.controller;

import com.baizhi.entity.Guru;
import com.baizhi.service.GuruService;
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
@RequestMapping("guru")
public class GuruController {
    @Resource
    private GuruService guruService;

    /*查所有*/
    @RequestMapping("findAllGuru")
    public @ResponseBody List<Guru> findAllGuru(){
        List<Guru> allGuru = guruService.findAllGuru();
        return allGuru;
    }

    /*添加*/
    @RequestMapping("addGuru")
    public @ResponseBody Map<String,Object> addGuru(MultipartFile img, Guru guru, HttpServletRequest request){
        HashMap<String, Object> results = new HashMap<>();
        try {
            //获取原始文件名
            String originalFilename = img.getOriginalFilename();
            //给上师头像设置路径
            guru.setHeadPic("/back/guru/images/"+originalFilename);
            //获取图片上传路径,根据绝对路径获取相对路径
            String realPath = request.getSession().getServletContext().getRealPath("/back/guru/images");
            //图片的上传
            img.transferTo(new File(realPath,originalFilename));

            guruService.addGuru(guru);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }

    /*删除*/
    @RequestMapping("removeGuru")
    public @ResponseBody Map<String,Object> removeGuru(String id,HttpServletRequest request){
        HashMap<String, Object> results = new HashMap<>();
        try {
            //删除图片
            Guru oneGuru = guruService.findOneGuru(id);
            System.out.println(oneGuru);
            //获取原始文件上传路径 根据相对路径获取绝对路径
            String realPath = request.getSession().getServletContext().getRealPath(oneGuru.getHeadPic());
            System.out.println(realPath);
            File file = new File(realPath);
            file.delete();

            guruService.removeGuru(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }

    /*查询*/
    @RequestMapping("findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page,Integer rows){
        HashMap<String, Object> results = new HashMap<>();
            List<Guru> guruPage = guruService.findGuruPage(page, rows);
            Long totals = guruService.findGuruTotals();
            results.put("rows",guruPage);
            results.put("total",totals);
            return results;
    }
}
