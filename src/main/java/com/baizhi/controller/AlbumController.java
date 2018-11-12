package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
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
@RequestMapping("album")
public class AlbumController {
    @Resource
    private AlbumService albumService;
    /*查询*/
    @RequestMapping("findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page,Integer rows){
        HashMap<String, Object> results = new HashMap<>();

        List<Album> albumPage = albumService.findAlbumPage(page, rows);
        Long albumTotal = albumService.findAlbumTotal();
        results.put("rows",albumPage);
        results.put("total",albumTotal);

        return results;
    }

    //根据id查询
    @RequestMapping("findOne")
    public @ResponseBody Album findOne(String id,HttpServletRequest request){
        Album album = albumService.findAlbum(id);
        request.setAttribute("album",album);
        return album;
    }

    /*添加专辑,需上传图片*/
    @RequestMapping("addAlbum")
    public @ResponseBody Map<String,Object> addAlbum(Album album, HttpServletRequest request, MultipartFile img){
        HashMap<String, Object> results = new HashMap<>();
        try {
            //获取图片原始名
            String originalFilename = img.getOriginalFilename();
            album.setCoverImg("/back/album/images/"+originalFilename);
            //获取图片上传路径,根据相对路径获取绝对路径
            String realPath = request.getSession().getServletContext().getRealPath("/back/album/images");
            img.transferTo(new File(realPath,originalFilename));

            albumService.addAlbum(album);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }

}
