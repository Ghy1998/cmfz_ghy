package com.baizhi.dao;

import com.baizhi.entity.User;

public interface UserDao extends BaseDao<User>{
    /*登陆*/
    User queryOneUser(User user);
}
