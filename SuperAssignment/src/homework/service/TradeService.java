package homework.service;

import java.util.List;

import homework.model.Consumption;
import homework.model.Payment;

public interface TradeService {
	
	public List findAllPayment();
	
	public Payment findPaymentById(String id);
	
	public List findPaymentByMem(String memid);
	
	public List findAllConsumption();
	
	public Consumption findConsumptionById(String id);
	
	public List findConsumptionByMem(String memid);

}
