package com.baizhi.service;

import com.baizhi.entity.Chapter;

public interface ChapterService {
    /*查询总条数*/
    Long findChapterTotals();

    /*添加*/
    void addChapter(Chapter chapter);
}
