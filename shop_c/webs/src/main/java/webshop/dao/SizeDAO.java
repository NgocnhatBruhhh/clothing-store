package webshop.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import webshop.entity.Size;

import java.util.List;

@Repository
public class SizeDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả các Size
    @SuppressWarnings("unchecked")
    public List<Size> getAllSizes() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            List<Size> list = session.createQuery("FROM Size").list();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Lấy Size theo ID
    public Size getSizeById(String id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (Size) session.get(Size.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Thêm mới Size
    public boolean addSize(Size size) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(size);
            transaction.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Cập nhật Size
    public boolean updateSize(Size size) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(size);
            transaction.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Xóa Size
    public boolean deleteSize(String id) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Size size = (Size) session.get(Size.class, id);
            if (size != null) {
                session.delete(size);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}
//@@te
