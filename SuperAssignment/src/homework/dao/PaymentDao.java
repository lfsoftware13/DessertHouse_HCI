package homework.dao;

import java.util.List;

import javax.ejb.Remote;

import homework.model.Payment;

public interface PaymentDao {

	public List findAll();
	
	public Payment findById(String id);
	
	public List find(String memberid);
	
	public boolean save(Payment payment);
	
	public boolean update(Payment payment);
	
	public boolean delete(Payment payment);
	
	public boolean delete(String id);
	
	
}
