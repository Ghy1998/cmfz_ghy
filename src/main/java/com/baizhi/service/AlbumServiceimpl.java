package com.baizhi.service;

import com.baizhi.dao.AlbumDao;
import com.baizhi.entity.Album;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class AlbumServiceimpl implements AlbumService{
    @Resource
    private AlbumDao albumDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findAlbumTotal() {
        return albumDao.queryTotals();
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findAlbumPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        List<Album> albums = albumDao.queryByPage(start, rows);
        return albums;
    }

    /*添加专辑*/
    public void addAlbum(Album album) {
        album.setId(UUID.randomUUID().toString());
        albumDao.insert(album);
    }

    //根据id查询
    @Transactional(propagation = Propagation.SUPPORTS)
    public Album findAlbum(String id) {
        return albumDao.queryOne(id);
    }
}
