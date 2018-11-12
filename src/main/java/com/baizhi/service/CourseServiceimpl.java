package com.baizhi.service;

import com.baizhi.dao.CourseDao;
import com.baizhi.entity.Course;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class CourseServiceimpl implements CourseService{
    @Resource
    private CourseDao courseDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Course> findCoursePage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        List<Course> courses = courseDao.queryByPage(start, rows);
        return courses;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public Course findOne(String id) {
        return courseDao.queryOne(id);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findCourseTotals() {
        return courseDao.queryTotals();
    }

    /*添加*/
    public void addCourse(Course course) {
        course.setId(UUID.randomUUID().toString());
        courseDao.insert(course);
    }

    /*修改*/
    public void motifyCourse(Course course) {
        courseDao.update(course);
    }

    /*删除*/
    public void removeCourse(String id) {
        courseDao.delete(id);
    }
}
