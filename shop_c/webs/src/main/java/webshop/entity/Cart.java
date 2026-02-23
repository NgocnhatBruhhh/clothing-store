package webshop.entity;

import javax.persistence.*;

@Entity
@Table(name = "Carts")
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Khóa chính tự tăng
    private int ID;

    @Column(nullable = false)
    private Integer quantity;

    @Column(nullable = false)
    private Integer status;

    @Column(name = "total_price", nullable = false)
    private Integer totalPrice;

    @ManyToOne
    @JoinColumn(name = "customersID", nullable = false)
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "product_detailsID", nullable = false)
    private ProductDetail productDetail;

    // Getters and Setters
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }


    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    // Constructors
    public Cart() {
        super();
    }

    public Cart(int iD, Integer quantity, Integer status, Integer totalPrice, Customer customer,
			ProductDetail productDetail) {
		super();
		ID = iD;
		this.quantity = quantity;
		this.status = status;
		this.totalPrice = totalPrice;
		this.customer = customer;
		this.productDetail = productDetail;
	}
    
    public Cart(Integer quantity, Integer status, Integer totalPrice, Customer customer,
			ProductDetail productDetail) {
		super();
		this.quantity = quantity;
		this.status = status;
		this.totalPrice = totalPrice;
		this.customer = customer;
		this.productDetail = productDetail;
	}

    
}
