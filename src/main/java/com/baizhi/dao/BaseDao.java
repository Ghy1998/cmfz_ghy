package com.baizhi.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDao<T> {
    /*添加*/
    void insert(T t);
    /*删除*/
    void delete(String id);
    /*修改*/
    void update(T t);
    /*查所有*/
    List<T> queryAll();
    /*查一个*/
    T queryOne(String id);
    //start:起始条数  rows:每页的条数
    List<T> queryByPage(@Param("start") Integer start,@Param("rows") Integer rows);
    //查总条数
    Long queryTotals();
    //批量删除
    void deletes(String[] id);
}
