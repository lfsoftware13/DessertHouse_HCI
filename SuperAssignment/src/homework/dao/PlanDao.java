package homework.dao;

import java.util.List;

import javax.ejb.Remote;

import homework.model.Plan;
import homework.model.PlanItem;

public interface PlanDao {
	
	public List findAll();
	
	public Plan findById(String id);
	
	public boolean save(Plan plan);
	
	public boolean update(Plan plan);
	
	public boolean delete(Plan plan);
	
	public boolean delete(String id);
	
	public boolean save(PlanItem item);
	
	public boolean update(PlanItem item);
	
	public boolean deleteItem(String id);
	
	public boolean deleteItemList(String planid);
	
	public PlanItem findItem(String id);
	
	public List findItemList(String planid);
	
}
