package com.baizhi.service;

import com.baizhi.dao.ArticleDao;
import com.baizhi.entity.Article;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ArticleServiceimpl implements ArticleService{
    @Resource
    private ArticleDao articleDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Article> findArticlePage(Integer page, Integer rows) {
        int start=(page-1)*rows;
        List<Article> articles = articleDao.queryByPage(start, rows);
        return articles;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public Long findArticleTotal() {
        return articleDao.queryTotals();
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public Article findOne(String id) {
        return articleDao.queryOne(id);
    }

    /*添加*/
    public void addArticle(Article article) {
        article.setId(UUID.randomUUID().toString());
        articleDao.insert(article);
    }

    /*删除*/
    public void removeArticle(String id) {
        articleDao.delete(id);
    }
}
