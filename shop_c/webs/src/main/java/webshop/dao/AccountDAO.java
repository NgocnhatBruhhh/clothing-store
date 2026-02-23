package webshop.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import webshop.entity.Account;
import webshop.entity.Rule;
import webshop.security.Bcrypt;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class AccountDAO {
    @Autowired
    private SessionFactory sessionFactory;

    // Create
    public boolean saveAccount(Account account) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(account);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            if (session != null) {
                session.close();  // Đóng session thủ công
            }
        }
    }
    
    public Optional<Account> findAccountByUsernameAndPassword(String email, String password) {
        Session session = null;
       email = email.trim();
       password = password.trim();
        try {
            session = sessionFactory.openSession();
            String hql = "FROM Account WHERE TRIM(email) = :email";
            Account account = (Account) session.createQuery(hql)
                    .setParameter("email", email)
                    .uniqueResult();
            
            //if (account != null && Bcrypt.verifyPassword(password, account.getPassword().trim())) {
            
            if (account != null && Bcrypt.matches(password.trim(), account.getPassword().trim())) {
                return Optional.of(account);
            }else {
            	return Optional.empty();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return Optional.empty();
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Read
    public Account getAccountById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (Account) session.get(Account.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();  
            }
        }
    }

 // Read
    public Account getAccountByEmail(String email) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            String hql = "FROM Account WHERE email = :email";  // HQL query
            Query query = session.createQuery(hql);  // Sử dụng Hibernate 4's Query
            query.setParameter("email", email);
            
            return (Account) query.uniqueResult();  // Trả về một Account hoặc null nếu không tìm thấy
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();  
            }
        }
    }
    
    //@@CH 
    public List<Account> getAccountByRule(Rule rule) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            String hql = "FROM Account WHERE rule = :rule";
            Query query = session.createQuery(hql);  
            query.setParameter("rule", rule);  
            
            return query.list();  
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();  
        } finally {
            if (session != null) {
                session.close();  
            }
        }
    }

    
    // Update
    public boolean updateAccount(Account account) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(account);
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

    // Delete
    public boolean deleteAccount(int id) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Account account = (Account) session.get(Account.class, id);
            if (account != null) {
                session.delete(account);
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
//@@te
