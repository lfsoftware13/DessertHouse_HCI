package homework.dao;

import java.util.List;

import homework.model.Book;

public interface BookDao {
	
	public List findAll();
	
	public Book findById(String id);
	
	public boolean save(Book book);
	
	public boolean update(Book book);
	
	public boolean delete(Book book);
	
	public boolean delete(String id);

}
