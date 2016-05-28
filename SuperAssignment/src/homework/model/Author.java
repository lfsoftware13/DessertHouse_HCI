package homework.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the author database table.
 * 
 */
@Entity
@NamedQuery(name="Author.findAll", query="SELECT a FROM Author a")
public class Author implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String bookid;

	private String name;

	public Author() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBookid() {
		return this.bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}