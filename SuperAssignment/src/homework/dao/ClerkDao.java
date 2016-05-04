package homework.dao;

import java.util.List;

import javax.ejb.Remote;

import homework.model.Clerk;

public interface ClerkDao {

	public List findAll();
	
	public Clerk findById(String id);
	
	public Clerk find(String name);
	
	public boolean save(Clerk clerk);
	
	public boolean update(Clerk clerk);
	
	public boolean delete(Clerk clerk);
	
	public boolean delete(String id);
	
	
}
