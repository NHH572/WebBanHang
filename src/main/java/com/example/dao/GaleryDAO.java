package com.example.dao;

import com.example.helper.JpaUtils;
import com.example.models.GaleryEntity;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class GaleryDAO extends DAOSystem<GaleryEntity>{
    public GaleryDAO() {
        super(GaleryEntity.class);
    }

    public List<GaleryEntity> findGaleryByIdProduct(Integer idProduct){
        EntityManager em = JpaUtils.getEtiEntityManager();
        String jqpl = "select g from GaleryEntity g where g.productId =:idProduct ";
        Query query = em.createQuery(jqpl);
        query.setParameter("idProduct",idProduct);
        return query.getResultList();
    }
}
