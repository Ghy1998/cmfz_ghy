package com.baizhi.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInterceptor implements HandlerInterceptor {
    @Override
    /*1.当请求到达会优先进入拦截器中的preHandle这个方法,当返回值为true放行请求,false为拦截请求*/
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object method) throws Exception {
        HttpSession session = request.getSession();
        if ("ok".equals(session.getAttribute("flag"))){
            return true;
        }else {
            response.sendRedirect("/cmfz_ghy/back/admin/login.jsp");
            return false;
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
