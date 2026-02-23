package webshop.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import webshop.entity.Customer;

import java.util.List;
import java.util.Optional;

@Repository
public class CustomerDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Create new customer
    public boolean createCustomer(Customer customer) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(customer);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error creating customer", e);
            return false;
        } finally {
            if (session != null) session.close();
        }
    }
 // Get customers by account ID
    public Customer getCustomerByAccountID(int accountId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            String hql = "FROM Customer WHERE account.id = :accountId";
            return (Customer) session.createQuery(hql)
                    .setParameter("accountId", accountId)
                    .uniqueResult();
        } catch (Exception e) {
            logError("Error getting customer by Account ID: " + accountId, e);
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Read customer by ID
    public Customer getCustomerById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (Customer) session.get(Customer.class, id);
        } catch (Exception e) {
            logError("Error getting customer by ID: " + id, e);
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Update a customer
    public boolean updateCustomer(Customer customer) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(customer);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error updating customer", e);
            return false;
        } finally {
            if (session != null) session.close();
        }
    }

    // Delete a customer
    public boolean deleteCustomer(int id) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            Customer customer = (Customer) session.get(Customer.class, id);
            if (customer != null) {
                session.delete(customer);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error deleting customer with ID: " + id, e);
            return false;
        } finally {
            if (session != null) session.close();
        }
    }

    // Get all customers
    public List<Customer> getAllCustomers() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("FROM Customer").list();
        } catch (Exception e) {
            logError("Error getting all customers", e);
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Log error method
    private void logError(String message, Exception e) {
        // Replace with a logging framework like SLF4J or Log4j
        System.err.println(message);
        e.printStackTrace();
    }
}
//@@te
