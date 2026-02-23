package webshop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import webshop.entity.Feedback;

@Repository
public class FeedbackDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Thêm mới phản hồi
    public boolean addFeedback(Feedback feedback) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(feedback);
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

    // Lấy phản hồi theo ID
    public Feedback getFeedbackById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (Feedback) session.get(Feedback.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Cập nhật phản hồi
    public boolean updateFeedback(Feedback feedback) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(feedback);
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

    // Xóa phản hồi
    public boolean deleteFeedback(int id) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Feedback feedback = (Feedback) session.get(Feedback.class, id);
            if (feedback != null) {
                session.delete(feedback);
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

    // Lấy tất cả phản hồi
    @SuppressWarnings("unchecked")
    public List<Feedback> getAllFeedback() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("FROM Feedback").list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }
    
 // Lấy danh sách phản hồi theo Product ID
    @SuppressWarnings("unchecked")
    public List<Feedback> getFeedbackByProductId(int productId) {
        String hql = "FROM Feedback f WHERE f.product.id = :productId";
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery(hql)
                          .setParameter("productId", productId)
                          .list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) session.close();
        }
    }
}
//@@te