package homework.dao;

import java.util.List;

import homework.model.Orderesd;
import homework.model.OrderItem;

public interface OrderDao {
	
	public List findAll();
	
	public Orderesd findById(int id);
	
	public List findByMember(int memberid);
	
	public boolean save(Orderesd order);
	
	public boolean update(Orderesd order);
	
	public boolean delete(Orderesd order);
	
	public boolean delete(int id);
	
	
	public List findAllItem();
	
	public OrderItem findItemById(int id);
	
	public List findByOrder(int orderid);
	
	public boolean saveItem(OrderItem item);
	
	public boolean updateItem(OrderItem item);
	
	public boolean deleteItem(OrderItem item);
	
	public boolean deleteItem(int id);

}
