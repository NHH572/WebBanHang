package com.example.servlet;

import com.example.common.PageInfo;
import com.example.common.PageType;
import com.example.dao.CategoryDAO;
import com.example.models.CategoryEntity;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MenuServlet",urlPatterns = {"/menu-all"})
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            findAllMenu(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
        PageInfo.prepareAndForward(request, response, PageType.MENU_MANAGEMENT_PAGE);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public  static void findAllMenu(HttpServletRequest request, HttpServletResponse response) {
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
}
