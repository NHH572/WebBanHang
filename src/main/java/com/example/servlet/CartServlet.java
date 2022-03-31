package com.example.servlet;

import com.example.common.PageInfo;
import com.example.common.PageType;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart","/payment"})
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String uri  = request.getRequestURI();
if(uri.contains("cart")){
//    request.getRequestDispatcher("/cart/cart-list.jsp").forward(request,response);

    PageInfo.prepareAndForward_index_cart(request,response,PageType.CART);

}else if(uri.contains("payment")){
//    request.getRequestDispatcher("/cart/payment.jsp").forward(request,response);
    PageInfo.prepareAndForward_index_pay(request,response,PageType.PAYMENT);
}
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
