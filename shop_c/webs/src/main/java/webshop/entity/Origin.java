package webshop.entity;

import java.util.Collection;

import javax.persistence.*;
@Entity
@Table(name = "origins")
public class Origin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    @OneToMany(mappedBy = "origin")
    private Collection<Product> products;

	public Collection<Product> getProducts() {
		return products;
	}

	public void setProducts(Collection<Product> products) {
		this.products = products;
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

	public Origin() {
		super();
	}

	public Origin(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Origin(int id, String name, Collection<Product> products) {
		super();
		this.id = id;
		this.name = name;
		this.products = products;
	}

    
}
