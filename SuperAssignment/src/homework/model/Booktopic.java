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
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private int bookid;

	private int topicid;

	public Booktopic() {
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

	public int getTopicid() {
		return this.topicid;
	}

	public void setTopicid(int topicid) {
		this.topicid = topicid;
	}

}