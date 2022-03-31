package com.example.filter;

import com.example.helper.RRSharer;

import javax.servlet.DispatcherType;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebFilter(filterName = "appFilter", urlPatterns = {"/*","/webbanhang"},dispatcherTypes = DispatcherType.REQUEST)
public class AppFilter extends HttpFilter {
    @Override
    public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws IOException, ServletException {
        System.out.println("app filter running");
        resp.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");
        RRSharer.add(req, resp);
        chain.doFilter(req, resp);
        RRSharer.remove(req, resp);
    }
}
