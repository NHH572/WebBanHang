package com.example.admin.servlet;

import com.example.common.PageInfo;
import com.example.common.PageType;
import com.example.dao.CategoryDAO;
import com.example.dao.ProductDAO;
import com.example.models.CategoryEntity;
import com.example.models.ProductEntity;
import org.apache.commons.beanutils.BeanUtils;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

// đang lỗi update
@MultipartConfig
@WebServlet(name = "ManagerProductServlet", urlPatterns = {"/admin/manager-product", "/admin/page-index",
"/admin/edit-product","/admin/create-product", "/admin/delete-product", "/admin/update-product"})

public class ManagerProductServlet extends HttpServlet {
    private Timestamp date_tam ;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");
       response.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();
        if (uri.contains("manager-product")) {
            getListByPage(request, response);
            findAllCategory(request,response);
//            request.getRequestDispatcher("/admin/manager-product.jsp").forward(request, response);
                PageInfo.prepareAndForward_admin_manager(
                        request,response, PageType.ADMIN_MANAGER_PRODUCT);
        } else if (uri.contains("edit-product")) {
            findByID(request, response);
            getListByPage(request, response);
            request.getRequestDispatcher("/admin/manager-product.jsp").forward(request, response);
        }else if(uri.contains("delete-product")){
            deleteProduct(request,response);getListByPage(request, response);
            request.getRequestDispatcher("/admin/manager-product.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String uri = request.getRequestURI();
        if (uri.contains("update-product")) {
            System.out.println("Vào update");
            updateProduct(request, response);
            getListByPage(request, response);
            request.getRequestDispatcher("/admin/manager-product.jsp").forward(request, response);
        }else if(uri.contains("delete-product")){
            deleteProduct(request,response);getListByPage(request, response);
            request.getRequestDispatcher("/admin/manager-product.jsp").forward(request, response);

        }else if(uri.contains("create-product")){
            insertProduct(request,response);
            getListByPage(request, response);
            request.getRequestDispatcher("/admin/manager-product.jsp").forward(request, response);

        }
    }

    public void insertProduct(HttpServletRequest request, HttpServletResponse response) {
        ProductEntity entity = new ProductEntity();
        try {
            Date now = new Date();
            Timestamp time = new Timestamp(now.getTime());
            DateTimeConverter dtc = new DateConverter(time);

            dtc.setPattern("dd-MM-yyyy hh:mm:ss");
            ConvertUtils.register(dtc, Timestamp.class);
            ProductDAO pdao = new ProductDAO();
            BeanUtils.populate(entity, request.getParameterMap());
            // update ảnh
            Part part = request.getPart("thumbnail");
            String realPath =request.getServletContext().getRealPath("/images");
            String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
            if(!Files.exists(Path.of(realPath))) {
                Files.createDirectories(Path.of(realPath));
            }
            System.out.println("realPath: "+realPath);
            System.out.println("part: "+part);
            System.out.println("filename: "+filename);

            part.write(realPath+"/"+filename);
            entity.setCreatedAt(time);
            entity.setThumbnail(filename);

            pdao.insert(entity);
            System.out.println("Loại sản phẩm : "+entity.getCategoryId());
            System.out.println("Tên sản phẩm"+entity.getTitle());
            request.setAttribute("message","Thêm thành công");
        } catch (Exception e) {
            request.setAttribute("error","Thêm thất bại!");
            e.printStackTrace();
        }
    }

    public void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        ProductEntity entity = new ProductEntity();
        try {

            Date now = new Date();
            Timestamp time = new Timestamp(now.getTime());
            DateTimeConverter dtc = new DateConverter(time);

            dtc.setPattern("dd-MM-yyyy hh:mm:ss");
            ConvertUtils.register(dtc, Timestamp.class);
            ProductDAO pdao = new ProductDAO();
            BeanUtils.populate(entity, request.getParameterMap());
            entity.setCreatedAt(date_tam);
            entity.setUpdatedAt(time);

            // update ảnh
            Part part = request.getPart("thumbnail");
            String realPath =request.getServletContext().getRealPath("/images");
            String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
            if(!Files.exists(Path.of(realPath))) {
                Files.createDirectories(Path.of(realPath));
            }
            System.out.println("realPath: "+realPath);
            System.out.println("part: "+part);
            System.out.println("filename: "+filename);

            part.write(realPath+"/"+filename);
            entity.setThumbnail(filename);


            pdao.update(entity);
            System.out.println("Loại sản phẩm : "+entity.getCategoryId());
            System.out.println("Tên sản phẩm"+entity.getTitle());
            request.setAttribute("message","Sửa thành công");
        } catch (Exception e) {
            request.setAttribute("error","Sửa thất bại!");
            e.printStackTrace();
        }
    }

    public void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            ProductDAO pdao = new ProductDAO();
            Integer id = Integer.parseInt(request.getParameter("id"));
            pdao.delete(id);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void findByID(HttpServletRequest request, HttpServletResponse response) {
        try {
            ProductDAO pdao = new ProductDAO();
            Integer id = Integer.parseInt(request.getParameter("id"));
            ProductEntity entity = pdao.findByID(id);
            date_tam = entity.getCreatedAt();
            request.setAttribute("itemCategory",null);
            request.setAttribute("product", entity);
        } catch (Exception e) {
            e.printStackTrace();
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
            for (ProductEntity p :list) {
                System.out.println("create_at: "+p.getCreatedAt());
            }
            request.setAttribute("listproduct", list);
            request.setAttribute("page", page);
            request.setAttribute("num", num);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void findAllCategory(HttpServletRequest request, HttpServletResponse response){
        try {
            CategoryDAO cdao = new CategoryDAO();
            List<CategoryEntity> list = cdao.findAll();
            request.setAttribute("itemCategory",list);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
