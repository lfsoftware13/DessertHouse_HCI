package homework.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the topic database table.
 * 
 */
@Entity
@NamedQuery(name="Topic.findAll", query="SELECT t FROM Topic t")
public class Topic implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String image;

	private String name;

	private String stockid;

	public Topic() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStockid() {
		return this.stockid;
	}

	public void setStockid(String stockid) {
		this.stockid = stockid;
	}

}