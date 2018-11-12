package com.baizhi.controller;

import com.baizhi.entity.Course;
import com.baizhi.service.CourseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("course")
public class CourseController {
    @Resource
    private CourseService courseService;

    /*查*/
    @RequestMapping("findAll")
    public @ResponseBody Map<String,Object> findAll(Integer page,Integer rows){
        HashMap<String, Object> results = new HashMap<>();
        List<Course> coursePage = courseService.findCoursePage(page, rows);
        Long courseTotals = courseService.findCourseTotals();
        results.put("rows",coursePage);
        results.put("total",courseTotals);
        return results;
    }

    /*添加*/
    @RequestMapping("addCourse")
    public @ResponseBody Map<String,Object> addCourse(Course course){
        HashMap<String, Object> results = new HashMap<>();
        try {
            courseService.addCourse(course);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return  results;
    }

    /*查一个*/
    @RequestMapping("findOne")
    public @ResponseBody Course findOne(String id){
        Course oneCourse = courseService.findOne(id);
        return oneCourse;
    }

    /*修改*/
    @RequestMapping("motifyCourse")
    public @ResponseBody Map<String,Object> motifyCourse(Course course){
        HashMap<String, Object> results = new HashMap<>();
        try {
            courseService.motifyCourse(course);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }

    /*删除*/
    @RequestMapping("removeCourse")
    public @ResponseBody Map<String,Object> removeCourse(String id){
        HashMap<String, Object> results = new HashMap<>();
        try {
            courseService.removeCourse(id);
            results.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            results.put("success",false);
            e.getMessage();
        }
        return results;
    }
}
