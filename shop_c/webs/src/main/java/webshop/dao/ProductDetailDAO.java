package webshop.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import webshop.entity.ProductDetail;

@Repository
public class ProductDetailDAO {

    @Autowired
    private SessionFactory sessionFactory;

    // Lấy tất cả chi tiết sản phẩm
    @SuppressWarnings("unchecked")
	public List<ProductDetail> getAllProductDetails() {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return session.createQuery("FROM ProductDetail").list();
        } catch (Exception e) {
            logError("Error fetching all product details", e);
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    // Lấy chi tiết sản phẩm theo ID
    public ProductDetail getProductDetailById(int id) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            return (ProductDetail) session.get(ProductDetail.class, id);
        } catch (Exception e) {
            logError("Error fetching product detail by ID: " + id, e);
            return null;
        } finally {
            if (session != null) session.close();
        }
    }
    


    // Thêm mới chi tiết sản phẩm
    public boolean addProductDetail(ProductDetail productDetail) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.save(productDetail);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error adding product detail", e);
            return false;
        } finally {
            if (session != null) session.close();
        }
    }

    // Cập nhật chi tiết sản phẩm
    public boolean updateProductDetail(ProductDetail productDetail) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            session.update(productDetail);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error updating product detail", e);
            return false;
        } finally {
            if (session != null) session.close();
        }
    }

    // Xóa chi tiết sản phẩm
    public boolean deleteProductDetail(int id) {
        Session session = null;
        Transaction transaction = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            ProductDetail productDetail = (ProductDetail) session.get(ProductDetail.class, id);
            if (productDetail != null) {
                session.delete(productDetail);
                transaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logError("Error deleting product detail with ID: " + id, e);
            return false;
        } finally {
            if (session != null) session.close();
        }
    }

    // Lấy danh sách chi tiết sản phẩm theo ProductID
    @SuppressWarnings("unchecked")
	public List<ProductDetail> getProductDetailsByProductId(int productId) {
        Session session = null;
        try {
            session = sessionFactory.openSession();
            String hql = "FROM ProductDetail pd WHERE pd.product.id = :productId";
            return session.createQuery(hql)
                    .setParameter("productId", productId)
                    .list();
        } catch (Exception e) {
            logError("Error fetching product details by ProductID: " + productId, e);
            return null;
        } finally {
            if (session != null) session.close();
        }
    }

    
    private void logError(String message, Exception e) {
        // Replace this with your preferred logging framework (e.g., SLF4J, Log4j)
        System.err.println(message);
        e.printStackTrace();
    }
}
//@@te
