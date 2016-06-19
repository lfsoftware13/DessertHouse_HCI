package homework.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the cart_item database table.
 * 
 */
@Entity
@Table(name="cart_item")
@NamedQuery(name="CartItem.findAll", query="SELECT c FROM CartItem c")
public class CartItem implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String id;

	private String book;

	private String bookid;

	private String cartid;

	private int number;

	private double price;

	private double total;

	public CartItem() {
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBook() {
		return this.book;
	}

	public void setBook(String book) {
		this.book = book;
	}

	public String getBookid() {
		return this.bookid;
	}

	public void setBookid(String bookid) {
		this.bookid = bookid;
	}

	public String getCartid() {
		return this.cartid;
	}

	public void setCartid(String cartid) {
		this.cartid = cartid;
	}

	public int getNumber() {
		return this.number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getTotal() {
		return this.total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

}