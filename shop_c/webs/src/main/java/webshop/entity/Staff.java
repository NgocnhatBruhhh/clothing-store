package webshop.entity;

import javax.persistence.*;
@Entity
@Table(name = "staffs")
public class Staff {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String phone;

    private String address;

    @Column(nullable = false)
    private int status;

    @OneToOne
    @JoinColumn(name = "accountsID", nullable = false)
    private Account account;

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Staff() {
		super();
	}

	public Staff(int id, String name, String phone, String address, int status, Account account) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.status = status;
		this.account = account;
	}

    // Getters and Setters
}

