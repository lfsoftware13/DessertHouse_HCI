package homework.dao;

import java.util.List;

import homework.model.Order;
import homework.model.OrderItem;

public interface OrderDao {
	
	public List findAll();
	
	public Order findById(int id);
	
	public List findByMember(int memberid);
	
	public boolean save(Order order);
	
	public boolean update(Order order);
	
	public boolean delete(Order order);
	
	public boolean delete(int id);
	
	
	public List findAllItem();
	
	public OrderItem findItemById(int id);
	
	public List findByOrder(int orderid);
	
	public boolean saveItem(OrderItem item);
	
	public boolean updateItem(OrderItem item);
	
	public boolean deleteItem(OrderItem item);
	
	public boolean deleteItem(int id);

}
