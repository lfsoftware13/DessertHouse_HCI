package homework.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the banner database table.
 * 
 */
@Entity
@NamedQuery(name="Banner.findAll", query="SELECT b FROM Banner b")
public class Banner implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String image;

	private String stockid;

	public Banner() {
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

	public String getStockid() {
		return this.stockid;
	}

	public void setStockid(String stockid) {
		this.stockid = stockid;
	}

}