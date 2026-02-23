package webshop.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import webshop.entity.Cart;

import java.util.List;

@Repository
public class CartDAO {

    @Autowired
    private SessionFactory sessionFactory;

 // Tạo mới Cart
    public boolean createCart(Cart cart) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(cart); // Sử dụng save để tạo mới
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error creating Cart", e);
            return false;
        } finally {
            if (session != null) session.close();
        }
    }

    // Cập nhật Cart
    public boolean updateCart(Cart cart) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(cart); // Sử dụng update để cập nhật
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error updating Cart", e);
            return false;
        } finally {
            if (session != null) session.close();
        }
    }

    // Get Cart by id
    public Cart getCartById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (Cart) session.get(Cart.class, id);
        } catch (Exception e) {
            logError("Error getting Cart by ID: " + id, e);
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Get All Carts
    public List<Cart> getAllCarts() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("from Cart").list();
        } catch (Exception e) {
            logError("Error getting all Carts", e);
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Delete Cart by Composite Key
    public boolean deleteCart(int id) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Cart cart = (Cart) session.get(Cart.class, id);
            if (cart != null) {
                session.delete(cart);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error deleting Cart with ID: " + id, e);
            return false;
        } finally {
            if (session != null) session.close();
        }
    }
    
    //Sửa status
	/*
	 * public boolean deleteCart(int id) { Session session = null; Transaction
	 * transaction = null; try { session = sessionFactory.openSession(); transaction
	 * = session.beginTransaction(); Cart cart = (Cart) session.get(Cart.class, id);
	 * if (cart != null) { session.delete(cart); transaction.commit(); return true;
	 * } return false; } catch (Exception e) { if (transaction != null)
	 * transaction.rollback(); logError("Error deleting Cart with ID: " + id, e);
	 * return false; } finally { if (session != null) session.close(); } }
	 */

    // Get Carts by Customer ID
    @SuppressWarnings("unchecked")
	public List<Cart> getCartsByCustomerId(int customerId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            String hql = "from Cart where customer.id = :customerId";
            return session.createQuery(hql)
                          .setParameter("customerId", customerId)
                          .list();
        } catch (Exception e) {
            logError("Error getting Carts by Customer ID: " + customerId, e);
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Log Error Method
    private void logError(String message, Exception e) {
        // Replace with a proper logging framework like SLF4J or Log4j
        System.err.println(message);
        e.printStackTrace();
    }
}
//@@te
