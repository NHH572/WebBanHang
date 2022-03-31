package com.example.dao;
import com.example.helper.JpaUtils;
import com.example.models.OdersEntity;
import com.example.models.OrderDetailsEntity;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class OrderDetailsDAO extends DAOSystem<OrderDetailsEntity> {
    public OrderDetailsDAO() {
        super(OrderDetailsEntity.class);
    }

    public List<OdersEntity> findOder_DetailsByEmailUser(String email){
        EntityManager em = JpaUtils.getEtiEntityManager();
        String jqpl ="Select o.productByProductId , o.odersByOrderId from OrderDetailsEntity o Where o.odersByOrderId.usersByUsersId.email =: email";
        TypedQuery<OdersEntity> query = em.createQuery(jqpl,OdersEntity.class);
        query.setParameter("email",email);
        return query.getResultList();
    }
}
