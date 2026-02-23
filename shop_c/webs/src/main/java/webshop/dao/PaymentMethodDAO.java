package webshop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import webshop.entity.PaymentMethod;

@Repository
public class PaymentMethodDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả phương thức thanh toán
    @SuppressWarnings("unchecked")
    public List<PaymentMethod> getAllPaymentMethods() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("FROM PaymentMethod").list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Lấy phương thức thanh toán theo ID
    public PaymentMethod getPaymentMethodById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (PaymentMethod) session.get(PaymentMethod.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Thêm mới phương thức thanh toán
    public boolean addPaymentMethod(PaymentMethod paymentMethod) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(paymentMethod);
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

    // Cập nhật phương thức thanh toán
    public boolean updatePaymentMethod(PaymentMethod paymentMethod) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(paymentMethod);
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

    // Xóa phương thức thanh toán
    public boolean deletePaymentMethod(int id) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            PaymentMethod paymentMethod = (PaymentMethod) session.get(PaymentMethod.class, id);
            if (paymentMethod != null) {
                session.delete(paymentMethod);
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
