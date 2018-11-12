package com.baizhi.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Course {
    private String id;
    private String title;
    private String flag;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;

    //一门功课下有多个计时器
    private List<Counter> children;

    public Course() {
    }

    public Course(String id, String title, String flag, Date createTime, List<Counter> children) {
        this.id = id;
        this.title = title;
        this.flag = flag;
        this.createTime = createTime;
        this.children = children;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public List<Counter> getChildren() {
        return children;
    }

    public void setChildren(List<Counter> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", flag='" + flag + '\'' +
                ", createTime=" + createTime +
                ", children=" + children +
                '}';
    }
}
