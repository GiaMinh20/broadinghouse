/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connection.DBConnect;
import Entity.Savedlist;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

/**
 *
 * @author Gia Minh
 */
public class SavedListDAO {

    public int addSavedlist(Savedlist list) {
        EntityManager em = DBConnect.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(list);
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

    public List<Savedlist> getSavedlistByUserId(int userId) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT s FROM Savedlist s WHERE s.uid = :userId";
        TypedQuery<Savedlist> q = em.createQuery(query, Savedlist.class);
        q.setParameter("userId", userId);
        List<Savedlist> savedlist;
        try {
            savedlist = q.getResultList();
            if (savedlist == null || savedlist.isEmpty()) {
                savedlist = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return savedlist;
    }

    public Savedlist getSavedlistById(int sid) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT s FROM Savedlist s WHERE s.sid = :sid";
        TypedQuery<Savedlist> q = em.createQuery(query, Savedlist.class);
        q.setParameter("sid", sid);
        Savedlist savedlist;
        try {
            savedlist = q.getSingleResult();
            if (savedlist == null) {
                savedlist = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return savedlist;
    }

    public int deletesavedlist(int sid) {
        EntityManager em = DBConnect.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        Savedlist savedlist = getSavedlistById(sid);
        try {
            trans.begin();
            em.remove(em.merge(savedlist));
            trans.commit();
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return -1;
        } finally {
            em.close();
        }
        return 1;
    }

    public Savedlist getSavedlistByHouseId(int hid) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT s FROM Savedlist s WHERE s.hid = :hid";
        TypedQuery<Savedlist> q = em.createQuery(query, Savedlist.class);
        q.setParameter("hid", hid);
        Savedlist savedlist;
        try {
            savedlist = q.getSingleResult();
            if (savedlist == null) {
                savedlist = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return savedlist;
    }

    public void deleteSavedlistByHouseId(int hid) {
        EntityManager em = DBConnect.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        Savedlist savedlist = getSavedlistByHouseId(hid);
        try {
            trans.begin();
            em.remove(em.merge(savedlist));
            trans.commit();
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
        } finally {
            em.close();
        }
    }
}
