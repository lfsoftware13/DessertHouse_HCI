package homework.dao;

import java.util.List;

import javax.ejb.Remote;

import homework.model.Account;

public interface AccountDao {
	
	public List findAll();
	
	public Account findById(String id);
	
	public Account find(String name);
	
	public boolean save(Account account);
	
	public boolean update(Account account);
	
	public boolean delete(Account account);
	
	public boolean delete(String id);

}
