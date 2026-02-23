package webshop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import webshop.entity.Material;

@Repository
public class MaterialDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả chất liệu sản phẩm
    @SuppressWarnings("unchecked")
    public List<Material> getAllMaterials() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("FROM Material").list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Lấy chất liệu sản phẩm theo ID
    public Material getMaterialById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (Material) session.get(Material.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    // Thêm mới chất liệu sản phẩm
    public boolean addMaterial(Material material) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            session.save(material);

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

    // Cập nhật chất liệu sản phẩm
    public boolean updateMaterial(Material material) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            session.update(material);

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

    // Xóa chất liệu sản phẩm
    public boolean deleteMaterial(int id) {
        Transaction transaction = null;
        Session session = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();

            Material material = (Material) session.get(Material.class, id);
            if (material != null) {
                session.delete(material);
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
