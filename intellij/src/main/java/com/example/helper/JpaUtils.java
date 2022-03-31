package com.example.helper;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {
    public static EntityManager getEtiEntityManager(){
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("webbanhang");
        return factory.createEntityManager();
    }
}
