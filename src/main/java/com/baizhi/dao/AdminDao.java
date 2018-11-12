package com.baizhi.dao;

import com.baizhi.entity.Admin;

public interface AdminDao extends BaseDao<Admin>{
    /*登陆*/
    Admin queryOneAdmin(Admin admin);
}
