package webshop.entity;

import javax.persistence.Entity;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.JoinColumn;
import javax.persistence.FetchType;

@Entity
@Table(name = "order_details")
public class OrderDetail {

    // Sử dụng @EmbeddedId để chỉ định composite key
    @EmbeddedId
    private OrderDetailId id;

    private int quantity;
    @Column(name = "unit_price")
    private double unitPrice;

    // Mối quan hệ với bảng Orders
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ordersID", insertable = false, updatable = false)
    private Order order;

    // Mối quan hệ với ProductDetails
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_detailsID", insertable = false, updatable = false)
    private ProductDetail productDetail;

    // Constructors, Getters, Setters
    public OrderDetail() {}

    public OrderDetail(OrderDetailId id, int quantity, double unitPrice) {
        this.id = id;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public OrderDetailId getId() {
        return id;
    }

    public void setId(OrderDetailId id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetails) {
        this.productDetail = productDetails;
    }

    @Override
    public String toString() {
        return "OrderDetails{id=" + id + ", quantity=" + quantity + ", unitPrice=" + unitPrice + "}";
    }
}
