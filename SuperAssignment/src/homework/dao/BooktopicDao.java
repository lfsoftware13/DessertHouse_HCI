package homework.dao;

import java.util.List;

import homework.model.Booktopic;

public interface BooktopicDao {
	
	public List findAll();
	
	public Booktopic findById(String id);
	
	public List findByBookid(String bookid);
	
	public List findByTopicid(String topicid);
	
	public boolean save(Booktopic top);
	
	public boolean update(Booktopic top);
	
	public boolean delete(Booktopic top);
	
	public boolean delete(String id);

}
