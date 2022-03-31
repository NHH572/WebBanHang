package com.example.servlet;

import com.example.common.PageInfo;
import com.example.common.PageType;
import com.example.dao.CategoryDAO;
import com.example.dao.ProductDAO;
import com.example.models.CategoryEntity;
import com.example.models.ProductEntity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet",urlPatterns = {"/home-servlet","/list-menu"})
public class HomeServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        findAllMenu(request,response);
        getListByPage(request,response);
        PageInfo.prepareAndForward(request, response, PageType.HOME_MANAGEMENT_PAGE);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
    }

    private void findAllMenu(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            Object obj = session.getAttribute("listmenu");
            CategoryDAO cdao = new CategoryDAO();
            List<CategoryEntity> list = cdao.findAll();
//            request.setAttribute("items", list);
            session.setAttribute("listmenu",list);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }

    }

    private void getListByPage(HttpServletRequest request, HttpServletResponse response) {
        try {
            ProductDAO pdao = new ProductDAO();
            List<ProductEntity> list1 = pdao.findAll();
            int page, numberpage = 12;
            int size = list1.size();
            int num = (size % 12 == 0 ? (size / 12) : ((size / 12)) + 1);
            String xpage = request.getParameter("page");
            if (xpage == null) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            int start, end;
            start = (page - 1) * numberpage;
            end = Math.min(page * numberpage, size);
            List<ProductEntity> list = pdao.getListByPage(list1, start, end);
            request.setAttribute("itemsProduct", list);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
    }


}
