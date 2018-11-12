package com.baizhi.service;

import com.baizhi.entity.Article;

import java.util.List;

public interface ArticleService {
    List<Article> findArticlePage(Integer page,Integer rows);

    Long findArticleTotal();

    void addArticle(Article article);

    void removeArticle(String id);

    Article findOne(String id);
}
