package homework.service;

import java.util.List;

public interface StatService {
	
	public List getPieSex();
	
	public List getPieAge();
	
	public List getPieConsumption();
	
	public List getPieCard();
	
	public List getBarStore(String storeid, String time);
	
	public List getBarProduct(String time);

}
