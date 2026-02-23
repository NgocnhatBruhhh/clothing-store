package webshop.entity;

import java.util.Collection;

import javax.persistence.*;
@Entity
@Table(name = "payment_methods")
public class PaymentMethod {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    @OneToMany(mappedBy = "paymentMethod")
    private Collection<Order> order;

    
	public Collection<Order> getInvoices() {
		return order;
	}

	public void setInvoices(Collection<Order> order) {
		this.order = order;
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

	public PaymentMethod() {
		super();
	}

	public PaymentMethod(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public PaymentMethod(int id, String name, Collection<Order> order) {
		super();
		this.id = id;
		this.name = name;
		this.order = order;
	}

    
}

