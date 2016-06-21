package homework.dao;

import java.util.List;

import homework.model.Booktopic;

public interface BooktopicDao {
	
	public List findAll();
	
	public Booktopic findById(int id);
	
	public List findByBookid(int bookid);
	
	public List findByTopicid(int topicid);
	
	public boolean save(Booktopic top);
	
	public boolean update(Booktopic top);
	
	public boolean delete(Booktopic top);
	
	public boolean delete(int id);

}
