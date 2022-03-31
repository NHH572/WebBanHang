package com.example.filter;

import com.example.models.UsersEntity;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*","/checkout/*"})
public class AuthFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpServletRequest req =(HttpServletRequest)request;
        HttpServletResponse res =(HttpServletResponse)response;
        String uri = req.getRequestURI();
        UsersEntity usersEntity = (UsersEntity) req.getSession().getAttribute("sessionUser");
        String error ="";
        if(usersEntity==null){
            error = res.encodeURL("Please log in!");
        }
        else if( uri.contains("/admin") && usersEntity.getRoleId() !=1){
            error = res.encodeURL("Please login with admin account");
        }
        if(!error.isEmpty()){
            req.getSession().setAttribute("message", error);
            res.sendRedirect(req.getContextPath()+"/signin");
        }else {
            chain.doFilter(request, response);
        }

    }
}
