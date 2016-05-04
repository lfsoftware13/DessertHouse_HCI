package homework.service;

import homework.model.Consumption;

public interface ClerkService {
	
	public boolean salePro(String storeid, String memberid, Consumption con);
	
	public boolean salePro(String storeid, Consumption list);

}
