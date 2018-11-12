package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;

    /*注册*/
    @RequestMapping("addUser")
    public String addUser(User user){
        userService.addUser(user);
        return "redirect:/index.jsp";
    }

    /*登陆*/
    @RequestMapping("findUser")
    public String findUser(User user){
        String oneUser = userService.findOneUser(user);
        if (oneUser.equals("110")){
            return "redirect:/error.jsp";
        }else {
            return "redirect:/index.jsp";
        }
    }

    /*修改*/
    @RequestMapping("motifyUser")
    public String motifyUser(User user){
        userService.moyifyUser(user);
        return "redirect:/index.jsp";
    }
}
