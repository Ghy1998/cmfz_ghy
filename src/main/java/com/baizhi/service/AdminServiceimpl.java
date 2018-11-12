package com.baizhi.service;

import com.baizhi.dao.AdminDao;
import com.baizhi.entity.Admin;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
@Transactional
public class AdminServiceimpl implements AdminService{
   @Resource
   private AdminDao adminDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    public Admin findOneAdmin(Admin admin) {
        Admin admin1 = adminDao.queryOneAdmin(admin);
        if (admin1!=null){
            return admin1;
        }
        return null;
    }

    @Override
    public void motifyAdmin(Admin admin) {
        adminDao.update(admin);
    }

}
