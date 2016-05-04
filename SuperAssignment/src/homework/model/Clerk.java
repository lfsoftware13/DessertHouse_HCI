package homework.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the clerk database table.
 * 
 */
@Entity
@NamedQuery(name="Clerk.findAll", query="SELECT c FROM Clerk c")
public class Clerk implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String name;

	private String sex;

	private String store;

	private String storeid;

	public Clerk() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getStore() {
		return this.store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getStoreid() {
		return this.storeid;
	}

	public void setStoreid(String storeid) {
		this.storeid = storeid;
	}

}