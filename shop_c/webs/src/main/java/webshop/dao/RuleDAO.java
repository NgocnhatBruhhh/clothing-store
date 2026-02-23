package webshop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import webshop.entity.Rule;

@Repository
public class RuleDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả các Rule
    @SuppressWarnings("unchecked")
    public List<Rule> getAllRules() {
        Session session = null;
        try {
            session = sessionFactory.openSession();  
            return session.createQuery("FROM Rule").list();  
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();  
            }
        }
    }

    // Lấy Rule theo ID
    public Rule getRuleById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();  
            return (Rule) session.get(Rule.class, id); 
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();  
            }
        }
    }

    // Thêm mới Rule
    public boolean addRule(Rule rule) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();  
            transaction = session.beginTransaction();  
            
            session.save(rule);
            
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

    // Cập nhật Rule
    public boolean updateRule(Rule rule) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();  
            transaction = session.beginTransaction(); 
            
            session.update(rule); 
            
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

    // Xóa Rule
    public boolean deleteRule(int id) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();  
            transaction = session.beginTransaction();  
            
            Rule rule = (Rule) session.get(Rule.class, id); 
            if (rule != null) {
                session.delete(rule);  
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
