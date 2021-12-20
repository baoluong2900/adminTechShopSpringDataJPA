package husc.edu.entities;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OrderDetail")
public class OrderDetail {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OrderDetailId")
	private int orderDetailId;
	
	@Column(name = "OrderId")
	private int orderId;
	
	@Column(name = "ProductId")
	private int productId;

	
	@Column(name = "Quantity")
	private int quantity;
	
	@Column(name = "UnitPrice")
	private double unitPrice;

	@ManyToOne
	@JoinColumn(name = "ProductId", referencedColumnName = "ProductId", insertable = false, updatable = false)
	private Product product;
	
	
	@ManyToOne
	@JoinColumn(name = "OrderId", referencedColumnName = "OrderId", insertable = false, updatable = false)
	private Order order;
	
	public OrderDetail() {
		super();
	}

	public int getOrderDetailId() {
		return orderDetailId;
	}

	public void setOrderDetailId(int orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	

}
