package com.baizhi.service;

import com.baizhi.entity.Banner;

import java.util.List;

public interface BannerService{
    /*添加*/
    void addBanner(Banner banner);

    /*修改*/
    void motifyBanner(Banner banner);

    /*查一个*/
    Banner findOneBanner(String id);

    /*删除*/
    void removeBanner(String id);

    /*批量删除*/
    void removeBanners(String[] id);

    /*每页的数据*/
    List<Banner> findByPage(Integer page,Integer rows);

    /*总条数*/
    Long findTotals();
}
