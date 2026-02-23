package webshop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import webshop.entity.Staff;

@Repository
public class StaffDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả Staff
    @SuppressWarnings("unchecked")
    public List<Staff> getAllStaffs() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("FROM Staff").list();
        } catch (Exception e) {
            logError("Error getting all Staff", e);
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Lấy Staff theo ID
    public Staff getStaffById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (Staff) session.get(Staff.class, id);
        } catch (Exception e) {
            logError("Error getting Staff by ID: " + id, e);
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
    
 // Lấy Staff theo accountId
    public Staff getStaffByAccountId(int accountId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            String hql = "FROM Staff WHERE accountsId = :accountId";
            Query query = session.createQuery(hql);
            query.setParameter("accountId", accountId);
            return (Staff) query.uniqueResult();
        } catch (Exception e) {
            logError("Error getting Staff by accountId: " + accountId, e);
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }


    // Thêm mới Staff
    public boolean addStaff(Staff staff) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(staff);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error adding new Staff", e);
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Cập nhật Staff
    public boolean updateStaff(Staff staff) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(staff);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error updating Staff", e);
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Xóa Staff
    public boolean deleteStaff(int id) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Staff staff = (Staff) session.get(Staff.class, id);
            if (staff != null) {
                session.delete(staff);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error deleting Staff with ID: " + id, e);
            return false;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    private void logError(String message, Exception e) {
        System.err.println(message);
        e.printStackTrace();
    }
}
//@@te
