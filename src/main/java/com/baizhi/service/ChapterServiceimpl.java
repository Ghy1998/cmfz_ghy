package com.baizhi.service;

import com.baizhi.dao.ChapterDao;
import com.baizhi.entity.Chapter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.UUID;

@Service
@Transactional
public class ChapterServiceimpl implements ChapterService{
    @Resource
    private ChapterDao chapterDao;


    //总条数
    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findChapterTotals() {
        return chapterDao.queryTotals();
    }

    @Override
    public void addChapter(Chapter chapter) {
        chapter.setId(UUID.randomUUID().toString());
        chapterDao.insert(chapter);
    }
}
