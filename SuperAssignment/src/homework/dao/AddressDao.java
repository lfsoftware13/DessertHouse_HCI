package homework.dao;

import java.util.List;

import homework.model.Address;

public interface AddressDao {

	public List findAll();
	
	public Address findById(String id);
	
	public List findByMember(String memberid);
	
	public Address findByName(String name);
	
	public boolean save(Address address);
	
	public boolean update(Address address);
	
	public boolean delete(Address address);
	
	public boolean delete(String id);
	
}
