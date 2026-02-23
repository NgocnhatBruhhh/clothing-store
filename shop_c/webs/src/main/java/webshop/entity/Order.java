package webshop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "create_time")
    private Date createTime;
    @Column(name = "update_time")
    private Date updateTime;
    @Column(name = "ship_fee")
    private double shipFee;
    @Column(name = "product_fee")
    private double productFee;
    @Column(name = "total")
    private double total;
    @Column(name = "payment_status")
    private int paymentStatus;
    @Column(name = "address")
    private String address;
    @Column(name = "description")
    private String description;
    

    // Mối quan hệ với OrderStatus
    @ManyToOne
    @JoinColumn(name = "order_statusID")
    private OrderStatus orderStatus;

    // Mối quan hệ với Customers
    @ManyToOne
    @JoinColumn(name = "customersID")
    private Customer customer;

    // Mối quan hệ với PaymentMethods
    @ManyToOne
    @JoinColumn(name = "payment_methodsID")
    private PaymentMethod paymentMethod;

    // Quan hệ với OrderDetails (Một đơn hàng có nhiều chi tiết đơn hàng)
    @OneToMany(mappedBy = "order")
    private Set<OrderDetail> orderDetails;
    
 // Quan hệ với Reasons (Mỗi đơn hàng có một lý do)
    @ManyToOne
    @JoinColumn(name = "reasonID")
    private Reason reason;

    public Reason getReason() {
        return reason;
    }

    public void setReason(Reason reason) {
        this.reason = reason;
    }


    // Constructors, Getters, Setters
    public Order() {}


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public double getShipFee() {
        return shipFee;
    }

    public void setShipFee(double shipFee) {
        this.shipFee = shipFee;
    }

    public double getProductFee() {
        return productFee;
    }

    public void setProductFee(double productFee) {
        this.productFee = productFee;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

   
    public int getPaymentStatus() {
		return paymentStatus;
	}


	public void setPaymentStatus(int paymentStatus) {
		this.paymentStatus = paymentStatus;
	}


	public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Set<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(Set<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    


	@Override
	public String toString() {
		return "Order [id=" + id + ", createTime=" + createTime + ", updateTime=" + updateTime + ", shipFee=" + shipFee
				+ ", productFee=" + productFee + ", total=" + total + ", paymentStatus=" + paymentStatus + ", address="
				+ address + ", description=" + description + ", orderStatus=" + orderStatus + ", customer=" + customer
				+ ", paymentMethod=" + paymentMethod + ", orderDetails=" + orderDetails + ", reason=" + reason + "]";
	}

	public Order(int id, Date createTime, Date updateTime, double shipFee, double productFee, double total,
			int paymentStatus, String address, String description, OrderStatus orderStatus, Customer customer,
			PaymentMethod paymentMethod, Set<OrderDetail> orderDetails) {
		super();
		this.id = id;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.shipFee = shipFee;
		this.productFee = productFee;
		this.total = total;
		this.paymentStatus = paymentStatus;
		this.address = address;
		this.description = description;
		this.orderStatus = orderStatus;
		this.customer = customer;
		this.paymentMethod = paymentMethod;
		this.orderDetails = orderDetails;
	}
    
	
	
}
