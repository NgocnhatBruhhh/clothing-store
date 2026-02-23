package webshop.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;

@Embeddable
public class OrderDetailId implements Serializable {
    private int product_detailsID;
    private int ordersID;
	
	
	public int getProduct_detailsID() {
		return product_detailsID;
	}
	public void setProduct_detailsID(int product_detailsID) {
		this.product_detailsID = product_detailsID;
	}
	public int getOrdersID() {
		return ordersID;
	}
	public void setOrdersID(int ordersID) {
		this.ordersID = ordersID;
	}
	@Override
	public int hashCode() {
		return Objects.hash(ordersID, product_detailsID);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDetailId other = (OrderDetailId) obj;
		return ordersID == other.ordersID && product_detailsID == other.product_detailsID;
	}
	public OrderDetailId() {
		super();
	}
	public OrderDetailId(int productDetailsID, int invoicesID) {
		super();
		this.product_detailsID = productDetailsID;
		this.ordersID = invoicesID;
	}

}
