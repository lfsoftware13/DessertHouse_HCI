package homework.dao;

import java.util.List;

import javax.ejb.Remote;

import homework.model.Product;

public interface ProductDao {
	
	public List findAll();
	
	public Product findById(String id);
	
	public Product find(String name);
	
	public boolean save(Product product);
	
	public boolean update(Product product);
	
	public boolean delete(Product product);
	
	public boolean delete(String id);

}
