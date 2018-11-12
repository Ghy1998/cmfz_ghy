package com.baizhi.service;

import com.baizhi.dao.MenuDao;
import com.baizhi.entity.Menu;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class MenuServiceimpl implements MenuService {
    @Resource
    private MenuDao menuDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Menu> findAllMenus() {
        return menuDao.queryAll();
    }
}
