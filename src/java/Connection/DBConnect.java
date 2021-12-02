/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Gia Minh
 */
public class DBConnect {
    public static EntityManager getEntityManager(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("boardinghouse2.0PU");
        return emf.createEntityManager();
    }
}
