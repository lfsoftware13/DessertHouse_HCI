package homework.dao;

import java.util.List;


import homework.model.Consumption;

public interface ConsumptionDao {

	public List findAll();
	
	public List findMember(String memberid);
	
	public Consumption findById(String id);
	
	public boolean save(Consumption con);
	
	public boolean update(Consumption con);

	public boolean delete(Consumption con);
	
	public boolean delete(String id);
	
	
}
