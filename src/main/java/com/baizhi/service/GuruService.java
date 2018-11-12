package com.baizhi.service;

import com.baizhi.entity.Guru;

import java.util.List;

public interface GuruService {
    void addGuru(Guru guru);

    void removeGuru(String id);

    List<Guru> findGuruPage(Integer page,Integer rows);

    Long findGuruTotals();

    Guru findOneGuru(String id);

    List<Guru> findAllGuru();
}
