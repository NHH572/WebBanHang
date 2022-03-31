package com.example.servlet;

import com.example.common.PageInfo;
import com.example.common.PageType;
import com.example.dao.GaleryDAO;
import com.example.dao.ProductDAO;
import com.example.models.GaleryEntity;
import com.example.models.ProductEntity;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product-all", "/detailproduct","/findproduct","/findcategory"})
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();
        if (uri.contains("product-all")) {
            getListByPage(request, response);
            PageInfo.prepareAndForward(request, response, PageType.PRODUCT_MANAGEMENT_PAGE);
        } else if (uri.contains("detailproduct")) {
            detailProduct(request, response);
            PageInfo.prepareAndForward_index_detail_product(request, response, PageType.DETAILPRODUCT_MANAGEMENT_PAGE);
        }else if(uri.contains("findcategory")){
            System.out.println("vào find categpry");
            findProductByCategory(request,response);
            PageInfo.prepareAndForward_index_detail_product(request, response, PageType.PRODUCT_MANAGEMENT_PAGE);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();
        if(uri.contains("findproduct")){
            System.out.println("vào findproduct");
            findProductByTitle(request,response);
            PageInfo.prepareAndForward_index_detail_product(request, response, PageType.PRODUCT_MANAGEMENT_PAGE);
        }
    }

    private void getListByPage(HttpServletRequest request, HttpServletResponse response) {
        try {
            ProductDAO pdao = new ProductDAO();
            List<ProductEntity> list1 = pdao.findAll();
            String xpage = request.getParameter("page");
            phantrang(list1,xpage,pdao,request,response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
    }

    public void phantrang(List<ProductEntity> list1, String xpage, ProductDAO pdao, HttpServletRequest request, HttpServletResponse response){
        int page, numberpage = 12;
        int size = list1.size();

        int num = (size % 12 == 0 ? (size / 12) : ((size / 12)) + 1);

        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numberpage;
        end = Math.min(page * numberpage, size);

        List<ProductEntity> list = pdao.getListByPage(list1, start, end);
        for (ProductEntity r:list) {
            System.out.println("Tên ảnh"+r.getThumbnail());
        }
        request.setAttribute("itemsProduct", list);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
    }

    public void detailProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            ProductDAO pdao = new ProductDAO();
            GaleryDAO gdao = new GaleryDAO();
            Integer id = Integer.parseInt(request.getParameter("idProduct"));
            List<GaleryEntity> list = gdao.findGaleryByIdProduct(id);
            System.out.println("id: "+id);
            ProductEntity entity = pdao.findByID(id);
            request.setAttribute("item", entity);
            request.setAttribute("itemsGalery", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void findProductByTitle(HttpServletRequest req, HttpServletResponse resp){
        try {
            String title = req.getParameter("keyword");
            String xpage = req.getParameter("page");
            ProductDAO pdao = new ProductDAO();
            List<ProductEntity> list = pdao.findProductByTitle(title);
            for (ProductEntity p: list) {
                System.out.println("title for database: "+title);
            }
            phantrang(list,xpage,pdao,req,resp);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void findProductByCategory(HttpServletRequest req, HttpServletResponse resp){
        try {
            ProductDAO productDAO = new ProductDAO();
            Integer id = Integer.parseInt(req.getParameter("idCategory"));
            String xpage = req.getParameter("page");
            System.out.println("id request : "+id);
           List<ProductEntity> list= productDAO.findProductByCategory(id);
            for (ProductEntity p: list ) {
                System.out.println("id: "+p.getId()+ " Title: "+ p.getTitle());
            }
            phantrang(list,xpage,productDAO,req,resp);
        }catch (Exception e){
            e.printStackTrace();
        }
    }


// dự bị phân trang
//    private void getListByPage(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            ProductDAO pdao = new ProductDAO();
//            List<ProductEntity> list1 = pdao.findAll();
//
//            int page, numberpage = 12;
//            int size = list1.size();
//
//            int num = (size % 12 == 0 ? (size / 12) : ((size / 12)) + 1);
//            String xpage = request.getParameter("page");
//            if (xpage == null) {
//                page = 1;
//            } else {
//                page = Integer.parseInt(xpage);
//            }
//            int start, end;
//            start = (page - 1) * numberpage;
//            end = Math.min(page * numberpage, size);
//            List<ProductEntity> list = pdao.getListByPage(list1, start, end);
//            for (ProductEntity r:list) {
//                System.out.println("Tên ảnh"+r.getThumbnail());
//            }
//
//            request.setAttribute("itemsProduct", list);
//            request.setAttribute("page", page);
//            request.setAttribute("num", num);
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.print(e.getMessage());
//        }
//    }
}
