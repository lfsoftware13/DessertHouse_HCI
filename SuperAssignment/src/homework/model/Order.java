package homework.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;


/**
 * The persistent class for the order database table.
 * 
 */
@Entity
@NamedQuery(name="Order.findAll", query="SELECT o FROM Order o")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String address;

	private int addressid;

	private String member;

	private int memberid;

	private int number;

	private String status;

	@Temporal(TemporalType.DATE)
	private Date time;

	private double total;
	
	@Transient
	private List<OrderItem> items;

	@Transient
	public List<OrderItem> getItems() {
		return items;
	}

	@Transient
	public void setItems(List<OrderItem> items) {
		this.items = items;
	}

	public Order() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAddressid() {
		return this.addressid;
	}

	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}

	public String getMember() {
		return this.member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public int getMemberid() {
		return this.memberid;
	}

	public void setMemberid(int memberid) {
		this.memberid = memberid;
	}

	public int getNumber() {
		return this.number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public double getTotal() {
		return this.total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

}