package com.baizhi.service;

import com.baizhi.entity.User;

public interface UserService {
    /*注册*/
    void addUser(User user);

    /*登陆*/
    String findOneUser(User user);

    /*修改*/
    void moyifyUser(User user);
}
