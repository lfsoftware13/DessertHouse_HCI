package homework.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the plan_item database table.
 * 
 */
@Entity
@Table(name="plan_item")
@NamedQuery(name="PlanItem.findAll", query="SELECT p FROM PlanItem p")
public class PlanItem implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private int number;

	private String planid;

	private double price;

	private String product;

	private String productid;

	public PlanItem() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNumber() {
		return this.number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getPlanid() {
		return this.planid;
	}

	public void setPlanid(String planid) {
		this.planid = planid;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getProduct() {
		return this.product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getProductid() {
		return this.productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

}