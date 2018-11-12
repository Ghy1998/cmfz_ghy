package com.baizhi.service;

import com.baizhi.dao.GuruDao;
import com.baizhi.entity.Guru;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class GuruServiceimpl implements GuruService{
    @Resource
    private GuruDao guruDao;

    /*添加上师*/
    public void addGuru(Guru guru) {
        guru.setId(UUID.randomUUID().toString());
        guruDao.insert(guru);
    }

    /*删除*/
    public void removeGuru(String id) {
        guruDao.delete(id);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findGuruPage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        List<Guru> gurus = guruDao.queryByPage(start, rows);
        return gurus;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findGuruTotals() {
        return guruDao.queryTotals();
    }

    @Override
    public Guru findOneGuru(String id) {
        return guruDao.queryOne(id);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Guru> findAllGuru() {
        return guruDao.queryAll();
    }
}
