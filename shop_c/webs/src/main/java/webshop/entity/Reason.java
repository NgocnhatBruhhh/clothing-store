package webshop.entity;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "reasons")
public class Reason {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name", nullable = false)
    private String name;

    // Quan hệ 1-N với bảng orders
    @OneToMany(mappedBy = "reason")
    private Set<Order> orders;

    // Constructors, Getters, Setters
    public Reason() {}

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

    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

	public Reason(int id, String name, Set<Order> orders) {
		super();
		this.id = id;
		this.name = name;
		this.orders = orders;
	}

	
    
    
}
