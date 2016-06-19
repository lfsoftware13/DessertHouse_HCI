package homework.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the booktopic database table.
 * 
 */
@Entity
@NamedQuery(name="Booktopic.findAll", query="SELECT b FROM Booktopic b")
public class Booktopic implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String bookid;

	private String topicid;

	public Booktopic() {
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

	public String getTopicid() {
		return this.topicid;
	}

	public void setTopicid(String topicid) {
		this.topicid = topicid;
	}

}