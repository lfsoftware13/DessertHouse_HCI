package homework.dao;

import java.util.List;

import homework.model.Address;

public interface AddressDao {

	public List findAll();
	
	public Address findById(int id);
	
	public List findByMember(int memberid);
	
	public Address findByName(String name);
	
	public boolean save(Address address);
	
	public boolean update(Address address);
	
	public boolean delete(Address address);
	
	public boolean delete(int id);
	
}
