package webshop.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import webshop.entity.OrderDetail;
import webshop.entity.OrderDetailId;

@Repository
public class OrderDetailDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả các chi tiết hóa đơn
    @SuppressWarnings("unchecked")
    public List<OrderDetail> getAllOrderDetails() {
        Session session = sessionFactory.openSession();
        try {
            return session.createQuery("FROM OrderDetail").list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }
    
 // Lấy chi tiết hóa đơn theo OrderId
    @SuppressWarnings("unchecked")
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        Session session = sessionFactory.openSession();
        try {
            return session.createQuery("FROM OrderDetail od WHERE od.id.ordersID = :orderId")
                          .setParameter("orderId", orderId)
                          .list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }


    // Lấy chi tiết hóa đơn theo ID
    public OrderDetail getOrderDetailById(OrderDetailId id) {
        Session session = sessionFactory.openSession();
        try {
            return (OrderDetail) session.get(OrderDetail.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }

    // Thêm mới chi tiết hóa đơn
    public boolean addOrderDetail(OrderDetail orderDetail) {
        Transaction transaction = null;
        Session session = sessionFactory.openSession();
        try {
            transaction = session.beginTransaction();
            session.save(orderDetail);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    // Cập nhật chi tiết hóa đơn
    public boolean updateOrderDetail(OrderDetail orderDetail) {
        Transaction transaction = null;
        Session session = sessionFactory.openSession();
        try {
            transaction = session.beginTransaction();
            session.update(orderDetail);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    // Xóa chi tiết hóa đơn
    public boolean deleteOrderDetail(OrderDetailId id) {
        Transaction transaction = null;
        Session session = sessionFactory.openSession();
        try {
            transaction = session.beginTransaction();
            OrderDetail orderDetail = (OrderDetail) session.get(OrderDetail.class, id);
            if (orderDetail != null) {
                session.delete(orderDetail);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }
}
