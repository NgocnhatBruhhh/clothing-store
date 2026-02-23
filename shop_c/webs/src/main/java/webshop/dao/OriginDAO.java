package webshop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import webshop.entity.Origin;

@Repository
public class OriginDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả nguồn gốc sản phẩm
    @SuppressWarnings("unchecked")
    public List<Origin> getAllOrigins() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("FROM Origin").list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Lấy nguồn gốc sản phẩm theo ID
    public Origin getOriginById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (Origin) session.get(Origin.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Thêm mới nguồn gốc sản phẩm
    public boolean addOrigin(Origin origin) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            session.save(origin);

            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Cập nhật nguồn gốc sản phẩm
    public boolean updateOrigin(Origin origin) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            session.update(origin);

            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Xóa nguồn gốc sản phẩm
    public boolean deleteOrigin(int id) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            Origin origin = (Origin) session.get(Origin.class, id);
            if (origin != null) {
                session.delete(origin);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}
