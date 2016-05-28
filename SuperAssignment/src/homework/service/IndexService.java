package homework.service;

import java.util.Date;
import java.util.List;

import homework.model.Banner;
import homework.model.Stock;
import homework.model.Topic;

public interface IndexService {
	
	public List<Banner> getBanner();
	
	public List<Stock> getNewBook();
	
	public List<Topic> getTopic();
	
	public List<Stock> getSellWell(String name);
	
	public Stock getStock(String stockid);
	
	public List<Stock> search(int level1, int level2, String topic, String word, String publisher, 
			Date starttime, Date endtime, int startprice, int endprice, boolean instock, String sort);

}
