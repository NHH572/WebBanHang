package com.example.dao;

import com.example.helper.JpaUtils;
import com.example.models.ProductEntity;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class ProductDAO extends DAOSystem<ProductEntity>{
    public ProductDAO() {
        super(ProductEntity.class);
    }

    public List<ProductEntity> findProductByTitle(String  title){
        EntityManager em = JpaUtils.getEtiEntityManager();
        String jqpl ="SELECT p FROM ProductEntity p WHERE p.title like :title";
        Query query = em.createQuery(jqpl);
        query.setParameter("title", "%" + title + "%");
        return query.getResultList();
    }

    public List<ProductEntity> findProductByCategory(Integer id){
        EntityManager em =JpaUtils.getEtiEntityManager();
        String jqpl = "select p from ProductEntity p where p.categoryId =:idCategory ";
        Query query = em.createQuery(jqpl);
        query.setParameter("idCategory",id);
        return query.getResultList();
    }




}
