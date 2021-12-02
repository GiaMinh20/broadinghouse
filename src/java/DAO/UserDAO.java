/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connection.DBConnect;
import Entity.User;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

/**
 *
 * @author Gia Minh
 */
public class UserDAO {

    public int register(User user) {
        EntityManager em = DBConnect.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            System.out.println("Error: " + e.toString());
            return -1;
        } finally {
            em.close();
        }
        return 1;
    }

    public User getUserById(int id) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT u FROM User u WHERE u.id = :id";
        TypedQuery<User> q = em.createQuery(query, User.class);
        q.setParameter("id", id);
        User user = null;
        try {
            user = q.getSingleResult();
            if (user == null) {
                user = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return user;
    }

    public User getUserByEmail(String email) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT u FROM User u WHERE u.email = :email";
        TypedQuery<User> q = em.createQuery(query, User.class);
        q.setParameter("email", email);
        User user = null;
        try {
            user = q.getSingleResult();
            if (user == null) {
                user = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return user;
    }
    public User login(String email, String password) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT u FROM User u WHERE u.email = :email AND u.password = :password";
        TypedQuery<User> q = em.createQuery(query, User.class);
        q.setParameter("email", email);
        q.setParameter("password", password);
        User user = null;
        try {
            user = q.getSingleResult();
            if (user == null) {
                user = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return user;
    }

    public int editAccount(User user) {
        EntityManager em = DBConnect.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.merge(user);
            trans.commit();
            return 1;
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return -1;
        } finally {
            em.close();
        }
    }
}
