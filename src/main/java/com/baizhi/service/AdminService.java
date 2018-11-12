package com.baizhi.service;

import com.baizhi.entity.Admin;

public interface AdminService {
    /*登陆*/
    Admin findOneAdmin(Admin admin);
    /*修改密码*/
    void motifyAdmin(Admin admin);
}
