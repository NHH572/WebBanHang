package com.example.dao;

import com.example.helper.JpaUtils;
import com.example.models.UsersEntity;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

public class UserDAO extends DAOSystem<UsersEntity> {
    public UserDAO() {
        super(UsersEntity.class);
    }

public UsersEntity Login(String email,String password){
    EntityManager em = JpaUtils.getEtiEntityManager();
    String jqpl ="Select u from UsersEntity u Where u.email =: email and u.password =: password";
    TypedQuery<UsersEntity> query = em.createQuery(jqpl,UsersEntity.class);
    query.setParameter("email",email);
    query.setParameter("password",password);
    return query.getSingleResult();
}

    public UsersEntity findByEmail(String email){
        EntityManager em = JpaUtils.getEtiEntityManager();
        String jqpl ="Select u from UsersEntity u Where u.email =: email";
        TypedQuery<UsersEntity> query = em.createQuery(jqpl,UsersEntity.class);
        query.setParameter("email",email);
        return query.getSingleResult();
    }

}
