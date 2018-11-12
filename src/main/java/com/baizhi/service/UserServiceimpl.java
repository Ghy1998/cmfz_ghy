package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.util.SaltUtils;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.UUID;

@Service
@Transactional
public class UserServiceimpl implements UserService{
    @Resource
    private UserDao userDao;

    @Transactional(propagation = Propagation.SUPPORTS)
    public String findOneUser(User user) {
        User user1 = userDao.queryOneUser(user);
        String pwd =user1.getSalt()+user.getPassword();
        String password = DigestUtils.md5Hex(pwd);
        if(password.equals(user1.getPassword())){
            return "100";
        }else {
            return "110";
        }
    }

    @Override
    public void addUser(User user) {
        user.setId(UUID.randomUUID().toString());
        //盐
        String salt = SaltUtils.getSalt(4);
        user.setSalt(salt);
        //密码
        String s = salt + user.getPassword();
        String password = DigestUtils.md5Hex(s);
        user.setPassword(password);
        userDao.insert(user);
    }

    /*修改*/
    public void moyifyUser(User user) {
        userDao.update(user);
    }
}
