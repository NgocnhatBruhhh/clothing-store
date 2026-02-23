package webshop.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import webshop.entity.OrderStatus;

@Repository
public class OrderStatusDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả trạng thái hóa đơn
    @SuppressWarnings("unchecked")
    public List<OrderStatus> getAllOrderStatuses() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("FROM OrderStatus").list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Lấy trạng thái hóa đơn theo ID
    public OrderStatus getOrderStatusById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (OrderStatus) session.get(OrderStatus.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Thêm mới trạng thái hóa đơn
    public boolean addOrderStatus(OrderStatus orderStatus) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(orderStatus);
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

    // Cập nhật trạng thái hóa đơn
    public boolean updateOrderStatus(OrderStatus orderStatus) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(orderStatus);
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

    // Xóa trạng thái hóa đơn
    public boolean deleteOrderStatus(int id) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            OrderStatus orderStatus = (OrderStatus) session.get(OrderStatus.class, id);
            if (orderStatus != null) {
                session.delete(orderStatus);
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
}
