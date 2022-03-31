package com.example.dao;

import com.example.helper.JpaUtils;
import com.example.models.OdersEntity;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

public class OdersDAO extends DAOSystem<OdersEntity> {
    public OdersDAO() {
        super(OdersEntity.class);
    }

//    public UsersEntity findByEmail(String email){
//        EntityManager em = JpaUtils.getEtiEntityManager();
//        String jqpl ="Select u from UsersEntity u Where u.email =: email";
//        TypedQuery<UsersEntity> query = em.createQuery(jqpl,UsersEntity.class);
//        query.setParameter("email",email);
//        return query.getSingleResult();
//    }

    public OdersEntity findOderByEmailUser(String email){
        EntityManager em = JpaUtils.getEtiEntityManager();
        String jqpl ="Select o from OdersEntity o Where o.usersByUsersId.email =:email";
        TypedQuery<OdersEntity> query = em.createQuery(jqpl,OdersEntity.class);
        query.setParameter("email",email);
        return query.getSingleResult();
    }

}
