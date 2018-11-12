package com.baizhi.service;

import com.baizhi.entity.Course;

import java.util.List;

public interface CourseService {
    /*查询*/
    List<Course> findCoursePage(Integer page,Integer rows);

    /*查一个*/
    Course findOne(String id);

    /*总条数*/
    Long findCourseTotals();

    void addCourse(Course course);

    void motifyCourse(Course course);

    void removeCourse(String id);
}
