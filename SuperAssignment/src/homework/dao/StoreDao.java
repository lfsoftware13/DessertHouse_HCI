package homework.dao;

import java.util.List;

import javax.ejb.Remote;

import homework.model.Store;

public interface StoreDao {

	public List findAll();
	
	public Store findById(String id);
	
	public Store find(String name);
	
	public boolean save(Store store);
	
	public boolean update(Store store);
	
	public boolean delete(Store store);
	
	public boolean delete(String id);
	
}
