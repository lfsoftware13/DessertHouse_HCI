package homework.dao;

import java.util.List;

import homework.model.Stock;

public interface StockDao {

	public List findAll();
	
	public Stock findById(String id);
	
	public List findByStore(String storeid);
	
	public boolean save(Stock stock);
	
	public boolean update(Stock stock);
	
	public boolean delete(Stock stock);
	
	public boolean delete(String id);
	
}
