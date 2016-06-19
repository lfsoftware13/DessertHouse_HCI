package homework.dao;

import java.util.List;

import homework.model.Cart;
import homework.model.CartItem;

public interface CartDao {
	
	public List findAll();
	
	public Cart findById(String id);
	
	public List findByMemberid(String memberid);
	
	public boolean save(Cart cart);
	
	public boolean update(Cart cart);
	
	public boolean delete(Cart cart);
	
	public boolean delete(String id);
	
	
	public List findAllItem();
	
	public CartItem findItemById(String id);
	
	public List findItemByCart(String cartid);
	
	public boolean saveItem(CartItem item);
	
	public boolean updateItem(CartItem item);
	
	public boolean deleteItem(CartItem item);
	
	public boolean deleteItem(String id);
	
}
