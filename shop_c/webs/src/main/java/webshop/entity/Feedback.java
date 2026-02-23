package webshop.entity;


import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "feedbacks")
public class Feedback {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private int id;

    @Column(name = "description")
    private String description;
    
    @Column(name = "create_time",nullable = true)
    private Date createTime;

    @ManyToOne
    @JoinColumn(name = "customersID", nullable = false)
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "productsID", nullable = false)
    private Product product;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Feedback() {
		super();
	}

	public Feedback(int id, String description, Date createTime, Customer customer, Product product) {
		super();
		this.id = id;
		this.description = description;
		this.createTime = createTime;
		this.customer = customer;
		this.product = product;
	}

	
}
