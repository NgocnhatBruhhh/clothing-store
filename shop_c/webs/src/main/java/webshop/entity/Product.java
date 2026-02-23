package webshop.entity;

import java.util.Collection;

import javax.persistence.*;
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    private String image;
    private String description;

    @ManyToOne
    @JoinColumn(name = "typesID", nullable = false)
    private Type type;

    @ManyToOne
    @JoinColumn(name = "originsID", nullable = false)
    private Origin origin;

    @ManyToOne
    @JoinColumn(name = "brandsID", nullable = false)
    private Brand brand;

    @ManyToOne
    @JoinColumn(name = "materialsID", nullable = false)
    private Material material;

    @OneToMany(mappedBy = "product")
    private Collection<Feedback> feedbacks;

    @OneToMany(mappedBy = "product")
    private Collection<ProductDetail> productDetails;

    
	public Collection<Feedback> getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(Collection<Feedback> feedbacks) {
		this.feedbacks = feedbacks;
	}

	public Collection<ProductDetail> getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(Collection<ProductDetail> productDetails) {
		this.productDetails = productDetails;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Origin getOrigin() {
		return origin;
	}

	public void setOrigin(Origin origin) {
		this.origin = origin;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Material getMaterial() {
		return material;
	}

	public void setMaterial(Material material) {
		this.material = material;
	}

	public Product() {
		super();
	}

	public Product(int id, String name, String image, String description, Type type, Origin origin, Brand brand,
			Material material) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.description = description;
		this.type = type;
		this.origin = origin;
		this.brand = brand;
		this.material = material;
	}

	public Product(int id, String name, String image, String description, Type type, Origin origin, Brand brand,
			Material material, Collection<Feedback> feedbacks, Collection<ProductDetail> productDetails) {
		super();
		this.id = id;
		this.name = name;
		this.image = image;
		this.description = description;
		this.type = type;
		this.origin = origin;
		this.brand = brand;
		this.material = material;
		this.feedbacks = feedbacks;
		this.productDetails = productDetails;
	}

}

