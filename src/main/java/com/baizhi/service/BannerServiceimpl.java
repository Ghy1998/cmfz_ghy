package com.baizhi.service;

import com.baizhi.dao.BannerDao;
import com.baizhi.entity.Banner;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class BannerServiceimpl implements BannerService{
    @Resource
    private BannerDao bannerDao;

    /*添加*/
    public void addBanner(Banner banner) {
        banner.setId(UUID.randomUUID().toString());
        bannerDao.insert(banner);
    }

    /*修改*/
    public void motifyBanner(Banner banner) {
        bannerDao.update(banner);
    }

    /*查找一个*/
    @Transactional(propagation = Propagation.SUPPORTS)
    public Banner findOneBanner(String id) {
        return bannerDao.queryOne(id);
    }

    /*删除一个*/
    public void removeBanner(String id) {
        bannerDao.delete(id);
    }

    /*批量删除*/
    public void removeBanners(String[] id) {
        bannerDao.deletes(id);
    }

    /*查询一页的数据*/
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Banner> findByPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        List<Banner> banners = bannerDao.queryByPage(start, rows);
        return banners;
    }

    /*总条数*/
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findTotals() {
        return bannerDao.queryTotals();
    }
}
