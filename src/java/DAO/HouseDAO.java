/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connection.DBConnect;
import Entity.House;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

/**
 *
 * @author Gia Minh
 */
public class HouseDAO {

    public List<House> getAllNewHouse() {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT h FROM House h ORDER BY h.id DESC";
        TypedQuery<House> q = em.createQuery(query, House.class);
        List<House> listHouse;
        try {
            listHouse = q.getResultList();
            if (listHouse == null || listHouse.isEmpty()) {
                listHouse = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listHouse;
    }

    public List<House> getNewHouse() {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT h FROM House h ORDER BY h.id DESC";
        TypedQuery<House> q = em.createQuery(query, House.class).setMaxResults(4);
        List<House> listHouse;
        try {
            listHouse = q.getResultList();
            if (listHouse == null || listHouse.isEmpty()) {
                listHouse = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listHouse;
    }

    public List<House> getHouseByCategory(String category) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT h FROM House h WHERE h.category = :category ORDER BY h.id DESC";
        TypedQuery<House> q = em.createQuery(query, House.class);
        q.setParameter("category", category);
        List<House> listHouse;
        try {
            listHouse = q.getResultList();
            if (listHouse == null || listHouse.isEmpty()) {
                listHouse = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listHouse;
    }

    public List<House> get4HouseByCategory(String category) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT h FROM House h WHERE h.category = :category ORDER BY h.id DESC";
        TypedQuery<House> q = em.createQuery(query, House.class).setMaxResults(4);
        q.setParameter("category", category);
        List<House> listHouse = new ArrayList<House>();
        House house = null;
        try {
            listHouse = q.getResultList();
            if (listHouse == null || listHouse.isEmpty()) {
                listHouse = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listHouse;
    }

    public House getHouseById(int id) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT h FROM House h WHERE h.id = :id";
        TypedQuery<House> q = em.createQuery(query, House.class);
        q.setParameter("id", id);
        House house = null;
        try {
            house = q.getSingleResult();
            if (house == null) {
                house = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return house;
    }

    public List<House> get4HouseByUserId(int userId) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT h FROM House h WHERE h.userId = :userId ORDER BY h.id DESC";
        TypedQuery<House> q = em.createQuery(query, House.class).setMaxResults(4);
        q.setParameter("userId", userId);
        List<House> listHouse = new ArrayList<House>();
        House house = null;
        try {
            listHouse = q.getResultList();
            if (listHouse == null || listHouse.isEmpty()) {
                listHouse = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listHouse;
    }

    public List<House> getAllHouseByUserId(int userId) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT h FROM House h WHERE h.userId = :userId ORDER BY h.id DESC";
        TypedQuery<House> q = em.createQuery(query, House.class);
        q.setParameter("userId", userId);
        List<House> listHouse = new ArrayList<House>();
        House house = null;
        try {
            listHouse = q.getResultList();
            if (listHouse == null || listHouse.isEmpty()) {
                listHouse = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listHouse;
    }

    public int addHouse(House house) {
        EntityManager em = DBConnect.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(house);
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

    public int deleteHouse(int id) {
        EntityManager em = DBConnect.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        House house = getHouseById(id);
        try {
            trans.begin();
            em.remove(em.merge(house));
            trans.commit();
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return -1;
        } finally {
            em.close();
        }
        return 1;
    }

    public int editHouse(House house) {
        EntityManager em = DBConnect.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(house);
            trans.commit();
            return 1;
        } catch (Exception e) {
            trans.rollback();
            System.out.println("Error: " + e.toString());
            return -1;
        } finally {
            em.close();
        }
    }

    public List<House> getHouseByLocation(String location) {
        EntityManager em = DBConnect.getEntityManager();
        String query = "SELECT h FROM House h WHERE h.location like :location ORDER BY h.id DESC";
        TypedQuery<House> q = em.createQuery(query, House.class);
        q.setParameter("location", location);
        List<House> listHouse ;
        try {
            listHouse = q.getResultList();
            if (listHouse == null || listHouse.isEmpty()) {
                listHouse = null;
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
            return null;
        } finally {
            em.close();
        }
        return listHouse;
    }
}
