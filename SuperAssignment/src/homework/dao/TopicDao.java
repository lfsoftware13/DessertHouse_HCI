package homework.dao;

import java.util.List;

import homework.model.Topic;

public interface TopicDao {
	
	public List findAll();
	
	public Topic findById(int id);
	
	public Topic findByName(String name);
	
	public boolean save(Topic topic);
	
	public boolean update(Topic topic);
	
	public boolean delete(Topic topic);
	
	public boolean delete(int id);

}
