package homework.dao;

import java.util.List;

import homework.model.Banner;

public interface BannerDao {
	
	public List findAll();
	
	public Banner findBannerById(String id);
	
	public boolean save(Banner ban);
	
	public boolean update(Banner ban);
	
	public boolean delete(Banner ban);
	
	public boolean delete(String id);

}
