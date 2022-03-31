package com.example.dao;

import com.example.helper.JpaUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

public abstract class DAOSystem<T> {
    private Class<T> entityClass;
    public DAOSystem(Class<T> cls){
        this.entityClass = cls;
    }

    public void insert(T entity) {
        EntityManager em = JpaUtils.getEtiEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(entity);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void update(T entity) {
        EntityManager em = JpaUtils.getEtiEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(entity);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void delete(Integer id) {
        EntityManager em = JpaUtils.getEtiEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            T entity = em.find(entityClass,id);
            em.remove(entity);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public T findByID(Integer id) {
        EntityManager em = JpaUtils.getEtiEntityManager();
        T entity = em.find(entityClass,id);
        return entity;
    }

    public List<T> findAll(){
        EntityManager em = JpaUtils.getEtiEntityManager();
        CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        cq.select(cq.from(entityClass));
        return em.createQuery(cq).getResultList();
    }

    public Long count(){
        EntityManager em = JpaUtils.getEtiEntityManager();
        CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
        Root<T>  rt= cq.from(entityClass);
        cq.select(em.getCriteriaBuilder().count(rt));
        Query q =em .createQuery(cq);
        return (Long) q.getSingleResult();
    }

    public List<T> getListByPage(List<T> list , int start, int end){
        ArrayList<T> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
}
