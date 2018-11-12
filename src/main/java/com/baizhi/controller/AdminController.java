package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Resource
    private AdminService adminService;

    @RequestMapping("login")
    public String findOneAdmin(HttpServletRequest request, Admin admin,String enCode){
        Admin login = adminService.findOneAdmin(admin);
        /*取验证码*/
        HttpSession session = request.getSession();
        String validationCode = (String)session.getAttribute("validationCode");
        if (validationCode.equals(enCode)){
            if (login!=null){
                //存对象
                session.setAttribute("admin",admin);
                //存标识
                //session.setAttribute("flag","ok");
                return "redirect:/back/main/main.jsp";
            }else {
                return "redirect:/back/admin/login.jsp";
            }
        }else {
            return "redirect:/back/admin/login.jsp";
        }

    }

    //退出登陆
    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.setAttribute("admin",null);
        //session.setAttribute("flag",null);
        return "redirect:/back/admin/login.jsp";
    }

    /*修改密码*/
    @RequestMapping("motifyAdmin")
    public @ResponseBody String motifyAdmin(Admin admin,HttpServletRequest request){
        HttpSession session = request.getSession();
        adminService.motifyAdmin(admin);
        session.setAttribute("admin",null);
        return "/back/admin/login.jsp";
    }
}
