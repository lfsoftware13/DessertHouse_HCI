package homework.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the bankcard database table.
 * 
 */
@Entity
@NamedQuery(name="Bankcard.findAll", query="SELECT b FROM Bankcard b")
public class Bankcard implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private int money;

	public Bankcard() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMoney() {
		return this.money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

}