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
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private int bookid;

	private String image;

	public Banner() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBookid() {
		return this.bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}