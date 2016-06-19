package homework.dao;

import java.util.List;

import homework.model.Order;
import homework.model.OrderItem;

public interface OrderDao {
	
	public List findAll();
	
	public Order findById(String id);
	
	public List findByMember(String memberid);
	
	public boolean save(Order order);
	
	public boolean update(Order order);
	
	public boolean delete(Order order);
	
	public boolean delete(String id);
	
	
	public List findAllItem();
	
	public OrderItem findItemById(String id);
	
	public List findByOrder(String orderid);
	
	public boolean saveItem(OrderItem item);
	
	public boolean updateItem(OrderItem item);
	
	public boolean deleteItem(OrderItem item);
	
	public boolean deleteItem(String id);

}
