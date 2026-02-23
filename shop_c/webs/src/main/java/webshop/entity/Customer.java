package webshop.entity;


import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name = "customers")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "phone", nullable = false)
    private String phone;

    @Column(name = "image")
    private String image;

    @ManyToOne
    @JoinColumn(name = "accountsID", nullable = false)
    private Account account;

    @OneToMany(mappedBy = "customer")
    private Collection<Feedback> feedbacks;

    @OneToMany(mappedBy = "customer")
    private Collection<Cart> carts;
    
    @OneToMany(mappedBy = "customer")
    private Collection<Order> order;

	public Collection<Order> getInvoices() {
		return order;
	}

	public void setInvoices(Collection<Order> order) {
		this.order = order;
	}

	public Collection<Feedback> getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(Collection<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	public Collection<Cart> getCarts() {
		return carts;
	}

	public void setCarts(Collection<Cart> carts) {
		this.carts = carts;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Customer(int id, String name, String phone, String image, Account account) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.image = image;
		this.account = account;
	}

	public Customer() {
		super();
	}

	public Customer(int id) {
		super();
		this.id = id;
	}
	
	public Customer(int id, String name, String phone, String image, Account account, Collection<Feedback> feedbacks,
			Collection<Cart> carts, Collection<Order> order) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.image = image;
		this.account = account;
		this.feedbacks = feedbacks;
		this.carts = carts;
		this.order = order;
	}
	

}
