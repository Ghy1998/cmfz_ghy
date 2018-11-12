package com.baizhi.service;


import com.baizhi.entity.Album;

import java.util.List;

public interface AlbumService {
    List<Album> findAlbumPage(Integer page,Integer rows);

    Long findAlbumTotal();

    void addAlbum(Album album);

    Album findAlbum(String id);
}
