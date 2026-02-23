package webshop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import webshop.entity.Brand;

@Repository
public class BrandDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả Brand
    @SuppressWarnings("unchecked")
    public List<Brand> getAllBrands() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("FROM Brand").list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Lấy Brand theo ID
    public Brand getBrandById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (Brand) session.get(Brand.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Thêm mới Brand
    public boolean addBrand(Brand brand) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            session.save(brand);

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

    // Cập nhật Brand
    public boolean updateBrand(Brand brand) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            session.update(brand);

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

    // Xóa Brand
    public boolean deleteBrand(int id) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            Brand brand = (Brand) session.get(Brand.class, id);
            if (brand != null) {
                session.delete(brand);
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