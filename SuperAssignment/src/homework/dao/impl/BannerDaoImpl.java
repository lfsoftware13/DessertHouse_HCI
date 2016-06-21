package homework.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BannerDao;
import homework.dao.BaseDao;
import homework.model.Banner;

@Repository
public class BannerDaoImpl implements BannerDao {

	@Autowired
	BaseDao baseDao;

	Session session;
	
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Banner.class);
	}

	@Override
	public Banner findBannerById(int id) {
		// TODO Auto-generated method stub
		return (Banner)baseDao.load(Banner.class, id);
	}

	@Override
	public boolean save(Banner ban) {
		// TODO Auto-generated method stub
		baseDao.save(ban);
		return true;
	}

	@Override
	public boolean update(Banner ban) {
		// TODO Auto-generated method stub
		baseDao.update(ban);
		return true;
	}

	@Override
	public boolean delete(Banner ban) {
		// TODO Auto-generated method stub
		baseDao.delete(Banner.class, ban.getId());
		return true;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(Banner.class, id);
		return true;
	}

}
