package com.example.servlet;

import com.example.common.PageInfo;
import com.example.common.PageType;
import com.example.dao.OdersDAO;
import com.example.dao.OrderDetailsDAO;
import com.example.dao.ProductDAO;
import com.example.dao.UserDAO;
import com.example.models.OdersEntity;
import com.example.models.OrderDetailsEntity;
import com.example.models.ProductEntity;
import com.example.models.UsersEntity;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OderDetailServlet", urlPatterns = {"/add-to-cart", "/cart-to-payment", "/delete-from-cart"})
public class OderDetailServlet extends HttpServlet {
    ProductDAO pdao = new ProductDAO();
    OrderDetailsDAO odao = new OrderDetailsDAO();
    UserDAO udao = new UserDAO();
    OdersDAO odersDAO = new OdersDAO();
    List<OrderDetailsEntity> list = new ArrayList<>();
    Double price = 0.0;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("add-to-cart")) {
            try {
                int idP = Integer.parseInt(request.getParameter("idProduct"));
                ProductEntity productEntity = pdao.findByID(idP);
//                int quantity = Integer.parseInt(request.getParameter("number"));
                int quantity = 1;
                HttpSession session = request.getSession();
                Object obj = session.getAttribute("cart");

                if (obj == null) {
                    System.out.println("rỗng");
//                    UsersEntity user = (UsersEntity) request.getSession().getAttribute("sessionUser");
//                    UsersEntity user2 =  udao.findByEmail(user.getEmail());

//                    OdersEntity odersEntity = odersDAO.findOderByEmailUser(user.getEmail());


                    OrderDetailsEntity order = new OrderDetailsEntity();
                    order.setProductId(productEntity.getId());
                    order.setPrice(productEntity.getPrice() - (productEntity.getPrice() * productEntity.getDiscount()));
                    order.setNumber(quantity);
                    order.setProductByProductId(productEntity);
//                    order.setOdersByOrderId(odersEntity);
                    price = price + (order.getPrice() * order.getNumber());
                    System.out.println("Rỗng price : " + price);
//                    order.setTotalMoney(price);
                    Map<Integer, OrderDetailsEntity> map = new HashMap<>();
                    map.put(idP, order);
                    session.setAttribute("cart", map);
                    session.setAttribute("tamtinh", price);
                } else {
                    System.out.println(" ko rỗng");
                    Map<Integer, OrderDetailsEntity> map = (Map<Integer, OrderDetailsEntity>) obj;

                    OrderDetailsEntity orderDetails = map.get(idP);

                    if (orderDetails == null) {
                        orderDetails = new OrderDetailsEntity();
                        orderDetails.setProductByProductId(productEntity);
                        orderDetails.setPrice(productEntity.getPrice() - (productEntity.getPrice() * productEntity.getDiscount()));
                        orderDetails.setNumber(quantity);
                        orderDetails.setTotalMoney(price);
                        map.put(idP, orderDetails);
                        System.out.println("giá :" + (productEntity.getPrice() - (productEntity.getPrice() * productEntity.getDiscount()) * quantity));
                        price = price + (productEntity.getPrice() - (productEntity.getPrice() * productEntity.getDiscount()) * quantity);
                        System.out.println("Rỗng _2 price : " + price);
//                        orderDetails.setTotalMoney(price);
                    } else {

                        orderDetails.setNumber(orderDetails.getNumber() + 1);
                        price = price + (productEntity.getPrice() - (productEntity.getPrice() * productEntity.getDiscount()) * quantity);
//                        orderDetails.setTotalMoney(price);
                        System.out.println(" ko Rỗng _2 price : " + price);
                    }
                    session.setAttribute("tamtinh", price);
                    session.setAttribute("cart", map);// luu tam vao session
                }
//                response.sendRedirect(request.getContextPath() + "/cart");
                    response.sendRedirect(request.getContextPath()+"/detailproduct?idProduct="+idP);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (uri.contains("cart-to-payment")) {
            Payment(request, response);

        } else if (uri.contains("delete-from-cart")) {
            Delete(request, response);
//            request.getRequestDispatcher("/cart/cart-list.jsp").forward(request,response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
//
//    public void addToCart(HttpServletRequest request, HttpServletResponse response) {
//        OrderDetailsEntity orderDetailsEntity = new OrderDetailsEntity();
//        try {
//            OrderDetailsDAO odao = new OrderDetailsDAO();
//            BeanUtils.populate(orderDetailsEntity, request.getParameterMap());
//            odao.insert(orderDetailsEntity);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    public void Payment(HttpServletRequest request, HttpServletResponse response) {
        try {
            UsersEntity user = (UsersEntity) request.getSession().getAttribute("sessionUser");
            OdersEntity odersEntity = odersDAO.findOderByEmailUser(user.getEmail());
            System.out.println("Fullname: " + odersEntity.getUsersByUsersId().getFullname());
            request.setAttribute("oders", odersEntity);
            double tamtinh = (double) request.getSession().getAttribute("tamtinh");
            System.out.println("tam tinh" + tamtinh);
            double vanchuyen = 40000;
            double tongtien = tamtinh + vanchuyen;
            request.setAttribute("tongtien", tongtien);
            request.setAttribute("vanchuyen", vanchuyen);

//            request.getRequestDispatcher("/cart/payment.jsp").forward(request, response);

            PageInfo.prepareAndForward_index_pay(request, response, PageType.PAYMENT);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void Delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer key = Integer.parseInt(request.getParameter("key"));

        // gio hang co nhieu mat hang
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("cart");// luu tam vao session

        if (obj != null) {
            System.out.println("vào update");
            Map<Integer, OrderDetailsEntity> map = (Map<Integer, OrderDetailsEntity>) obj;
            map.remove(key);
            // update lai vao session
            session.setAttribute("cart", map);
        }
        // chuyen ve trang gio hang
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
