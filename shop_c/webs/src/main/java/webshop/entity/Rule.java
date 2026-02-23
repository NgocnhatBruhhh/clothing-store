package webshop.entity;

import java.util.Collection;

import javax.persistence.*;

@Entity
@Table(name = "rules")
public class Rule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private int id;

    @Column(name = "name", nullable = false)
    private String name;
    
    @OneToMany(mappedBy = "rule")
    private Collection<Account> accounts;

    public Rule(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
    

	public Rule(int id, String name, Collection<Account> accounts) {
		super();
		this.id = id;
		this.name = name;
		this.accounts = accounts;
	}


	public Rule() {
		super();
	}

	
	
	public Collection<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(Collection<Account> accounts) {
		this.accounts = accounts;
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

    
}
