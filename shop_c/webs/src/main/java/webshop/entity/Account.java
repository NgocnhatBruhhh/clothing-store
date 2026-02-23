package webshop.entity;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name = "accounts")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private int id;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "status")
    private Integer status;

    @ManyToOne
    @JoinColumn(name = "rulesID", nullable = false)
    private Rule rule;
    
    @OneToMany(mappedBy = "account")
    private Collection<Customer> customers;

    @OneToMany(mappedBy = "account")
    private Collection<Staff> staffs;


	public Collection<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(Collection<Customer> customers) {
		this.customers = customers;
	}

	public Collection<Staff> getStaffs() {
		return staffs;
	}

	public void setStaffs(Collection<Staff> staffs) {
		this.staffs = staffs;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Rule getRule() {
		return rule;
	}

	public void setRule(Rule rule) {
		this.rule = rule;
	}

	public Account() {
		super();
	}

	public Account(int id, String email, String password, Integer status, Rule rule) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.status = status;
		this.rule = rule;
	}

	public Account(int id, String email, String password, Integer status, Rule rule, Collection<Customer> customers,
			Collection<Staff> staffs) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.status = status;
		this.rule = rule;
		this.customers = customers;
		this.staffs = staffs;
	}
    
    
    
}
