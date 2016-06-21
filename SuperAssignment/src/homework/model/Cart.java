package homework.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the cart database table.
 * 
 */
@Entity
@NamedQuery(name="Cart.findAll", query="SELECT c FROM Cart c")
public class Cart implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String member;

	private int memberid;

	private int number;

	private double total;

	public Cart() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
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

	public double getTotal() {
		return this.total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

}