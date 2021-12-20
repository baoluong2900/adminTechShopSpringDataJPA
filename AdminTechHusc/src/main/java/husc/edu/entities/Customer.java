package husc.edu.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Customer")
public class Customer {

	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CustomerId")
	private int customerId;
	
	@Column(name = "Name", columnDefinition = "nvarchar(50)")
	private String name;
	
	@Column(name = "Email", columnDefinition = "nvarchar(150)")
	private String email;
	
	
	@Column(name = "Password", columnDefinition = "nvarchar(30)")
	private String password;
	
	
	@Column(name = "Phone", columnDefinition = "nvarchar(15)")
	private String phone;
	
	
	@Column(name = "RegisteredDate", columnDefinition = "date")
	private Date registeredDate;
	
	public Customer() {
		super();
	}


	public int getCustomerId() {
		return customerId;
	}


	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
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


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getRegisteredDate() {
		return registeredDate;
	}


	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}
	

}
