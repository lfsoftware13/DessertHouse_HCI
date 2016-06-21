package homework.dao;

import java.util.List;

import homework.model.Comment;

public interface CommentDao {

	public List findAll();
	
	public Comment findById(int id);
	
	public List findByBook(int bookid);
	
	public boolean save(Comment com);
	
	public boolean update(Comment com);
	
	public boolean delete(Comment com);
	
	public boolean delete(int id);
	
}
