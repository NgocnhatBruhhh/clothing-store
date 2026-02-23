package webshop.entity;

import java.util.Collection;

import javax.persistence.*;
@Entity
@Table(name = "sizes")
public class Size {
    @Id
    @Column(name = "ID")
    private String id;

    @Column(name = "name")
    private String name;

    @OneToMany(mappedBy = "size")
    private Collection<ProductDetail> productDetails;

    
	public Collection<ProductDetail> getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(Collection<ProductDetail> productDetails) {
		this.productDetails = productDetails;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Size() {
		super();
	}

	public Size(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Size(String id, String name, Collection<ProductDetail> productDetails) {
		super();
		this.id = id;
		this.name = name;
		this.productDetails = productDetails;
	}

    
}
