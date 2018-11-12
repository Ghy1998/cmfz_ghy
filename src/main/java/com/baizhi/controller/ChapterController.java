package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import com.baizhi.util.FileUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("chapter")
public class ChapterController {
    @Resource
    private ChapterService chapterService;

    /*添加章节*/
    @RequestMapping("addChapter")
    public @ResponseBody Map<String,Object> addChapter(Chapter chapter, HttpServletRequest request, MultipartFile music){
        HashMap<String, Object> results = new HashMap<>();
        try {
            //上传音频
            String s1 = FileUtil.saveFile(music, "/back/album/music/", request);
            chapter.setDownPath(s1);

            //获取上传时长
            String s = FileUtil.AudioLength(s1, request);
            chapter.setDuration(s);

            //获取文件大小
            Double size = FileUtil.AudioSize(s1, request);
            chapter.setSize(size+"M");

            chapterService.addChapter(chapter);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }

    /*下载音频*/
    //文件下载,inline:在线打开  attachment:以附件形式下载
    @RequestMapping("downMusic")
    public @ResponseBody void downMusic(String fileName, HttpServletRequest request, HttpServletResponse response)throws Exception{
        //1.文件存储的位置
        String realPath = request.getSession().getServletContext().getRealPath("/");
        //2.以文件输入流读取文件
        FileInputStream is= new FileInputStream(new File(realPath,fileName));
        //2.1设置响应头
        response.setHeader("content-disposition","attachment;fileName="+URLEncoder.encode(fileName, "UTF-8"));
        //3.获取响应输出流
        ServletOutputStream os = response.getOutputStream();
        //4.使用IOUtils工具类
        IOUtils.copy(is, os);
        //5.关流
        IOUtils.closeQuietly(os);
        IOUtils.closeQuietly(is);
    }

}
