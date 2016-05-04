package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.StockDao;
import homework.model.Stock;

@Repository
public class StockDaoImpl implements StockDao {

	@Autowired
	private BaseDao baseDao;
	
	private Session session;

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Stock.class);
	}

	@Override
	public Stock findById(String id) {
		// TODO Auto-generated method stub
		return (Stock) baseDao.load(Stock.class, id);
	}

	@Override
	public boolean save(Stock stock) {
		// TODO Auto-generated method stub
		baseDao.save(stock);
		return true;
	}

	@Override
	public boolean update(Stock stock) {
		// TODO Auto-generated method stub
		baseDao.update(stock);
		return true;
	}

	@Override
	public boolean delete(Stock stock) {
		// TODO Auto-generated method stub
		baseDao.delete(Stock.class, stock.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Stock.class,id);
		return true;
	}

	@Override
	public List findByStore(String storeid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Stock.class);
		c.add(Restrictions.eq("storeid",storeid));
		List list=c.list();
		session.close();
		return list;
	}
	
}
