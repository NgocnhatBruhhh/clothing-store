package webshop.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import webshop.entity.Order;

@Repository
public class OrderDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả các đơn hàng
    @SuppressWarnings("unchecked")
    public List<Order> getAllOrders() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("FROM Order").list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Lấy đơn hàng theo ID
    public Order getOrderById(int orderId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (Order) session.get(Order.class, orderId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Thêm mới đơn hàng
    public boolean addOrder(Order order) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(order);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) session.close();
        }
    }

    // Cập nhật đơn hàng
    public boolean updateOrder(Order order) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(order);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) session.close();
        }
    }

    // Xóa đơn hàng
    public boolean deleteOrder(int orderId) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Order order = (Order) session.get(Order.class, orderId);
            if (order != null) {
                session.delete(order);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) session.close();
        }
    }
    
    // Lấy danh sách đơn hàng theo CustomerId
    @SuppressWarnings("unchecked")
    public List<Order> getOrdersByCustomerId(int customerId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            String hql = "FROM Order o WHERE o.customer.id = :customerId";
            return session.createQuery(hql)
                    .setParameter("customerId", customerId)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }
    
 // Lấy đơn hàng gần nhất của một Customer
    public Order getLatestOrderByCustomerId(int customerId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            String hql = "FROM Order o WHERE o.customer.id = :customerId ORDER BY o.createTime DESC";
            return (Order) session.createQuery(hql)
                    .setParameter("customerId", customerId)
                    .setMaxResults(1)
                    .uniqueResult(); // Lấy kết quả duy nhất
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

}
//@@te
