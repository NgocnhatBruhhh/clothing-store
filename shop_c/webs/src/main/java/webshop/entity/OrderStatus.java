package webshop.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import java.util.Set;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "order_status")
public class OrderStatus {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String statusName;

    // Quan hệ với bảng order: Một OrderStatus có thể có nhiều order
    @OneToMany(mappedBy = "orderStatus")
    private Set<Order> order;

    // Constructors, Getters, Setters
    public OrderStatus() {}

    public OrderStatus(int id, String statusName) {
        this.id = id;
        this.statusName = statusName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public Set<Order> getOrders() {
        return order;
    }

    public void setOrders(Set<Order> order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "OrderStatus{id=" + id + ", statusName='" + statusName + "'}";
    }
}
