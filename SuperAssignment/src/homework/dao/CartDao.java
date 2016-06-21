package homework.dao;

import java.util.List;

import homework.model.Cart;
import homework.model.CartItem;

public interface CartDao {
	
	public List findAll();
	
	public Cart findById(int id);
	
	public Cart findByMemberid(int memberid);
	
	public boolean save(Cart cart);
	
	public boolean update(Cart cart);
	
	public boolean delete(Cart cart);
	
	public boolean delete(int id);
	
	
	public List findAllItem();
	
	public CartItem findItemById(int id);
	
	public List findItemByCart(int cartid);
	
	public boolean saveItem(CartItem item);
	
	public boolean updateItem(CartItem item);
	
	public boolean deleteItem(CartItem item);
	
	public boolean deleteItem(int id);
	
}
