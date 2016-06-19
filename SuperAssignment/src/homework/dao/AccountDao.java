package homework.dao;

import java.util.List;

import homework.model.Account;

public interface AccountDao {
	
	public List findAll();
	
	public Account findById(String id);
	
	public Account findByName(String name);
	
	public boolean save(Account acc);
	
	public boolean update(Account acc);
	
	public boolean delete(String id);
	
	public boolean delete(Account acc);

}
