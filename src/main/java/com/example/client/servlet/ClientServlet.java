package com.example.client.servlet;

import com.example.dao.OdersDAO;
import com.example.dao.ProductDAO;
import com.example.dao.UserDAO;
import com.example.models.OdersEntity;
import com.example.models.UsersEntity;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;
import org.hibernate.service.NullServiceException;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "ClientServlet",urlPatterns = {"/signin","/signup","/logout"})
public class ClientServlet extends HttpServlet {
    private UserDAO udao = new UserDAO();
    OdersDAO odersDAO = new OdersDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();
        if(uri != null && uri.contains("100")){
            request.setAttribute("error","Tài khoản hoặc mật khẩu không đúng");
        }
        else if(uri.contains("logout")){

        }

        request.getRequestDispatcher("/client/login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();
        if(uri.contains("signin")){
            setSessionAdmin(request);
            if(checkLogin(request)){
                System.out.println("vào view index");
//                request.getRequestDispatcher("/views/index.jsp").forward(request,response);
                response.sendRedirect(request.getContextPath() + "/home-servlet");
            }
            else {
                System.out.println("vào admin login");
                response.sendRedirect(request.getContextPath() + "/signin?error=100");
            }

        }else if(uri.contains("signup")){
            registration(request,response);
            request.getRequestDispatcher("/client/login.jsp").forward(request,response);

        }

    }

    public  void setSessionAdmin(HttpServletRequest request){
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            UserDAO udao = new UserDAO();
            UsersEntity user = udao.Login(email,password);
            request.getSession().setAttribute("sessionUser",user);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private boolean checkLogin(HttpServletRequest request){
        if(request.getSession().getAttribute("sessionUser")==null){
            return false;
        }else{
            return true;
        }
    }

    public void registration(HttpServletRequest request, HttpServletResponse response){

        try {

            UsersEntity user = new UsersEntity();
            Date now = new Date();
            Timestamp time = new Timestamp(now.getTime());
            DateTimeConverter dtc = new DateConverter(time);

            dtc.setPattern("dd-MM-yyyy hh:mm:ss");
            ConvertUtils.register(dtc, Timestamp.class);


            UserDAO udao = new UserDAO();
            BeanUtils.populate(user,request.getParameterMap());
            user.setCreatedAt(time);
            udao.insert(user);
            System.out.println("email: "+user.getEmail());
            createOders(request,response,user.getEmail());
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public void createOders(HttpServletRequest req, HttpServletResponse resp, String email ){
        UsersEntity usersEntity = udao.findByEmail(email);
        try {
            if(usersEntity !=null){
                System.out.println("insert user vào od");
                OdersEntity odersEntity = new OdersEntity();
                odersEntity.setUsersId(usersEntity.getId());
                odersDAO.insert(odersEntity);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
