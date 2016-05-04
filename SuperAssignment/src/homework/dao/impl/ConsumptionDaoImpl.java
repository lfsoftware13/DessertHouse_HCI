package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.ConsumptionDao;
import homework.model.Consumption;

@Repository
public class ConsumptionDaoImpl implements ConsumptionDao {
	
	@Autowired
	private BaseDao baseDao;
	
	private Session session;
	
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Consumption.class);
	}

	@Override
	public List findMember(String memberid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Consumption.class);
		c.add(Restrictions.eq("memberid",memberid));
		List list=c.list();
		session.close();
		return list;
	}

	@Override
	public Consumption findById(String id) {
		// TODO Auto-generated method stub
		return (Consumption)baseDao.load(Consumption.class, id);
	}

	@Override
	public boolean save(Consumption con) {
		// TODO Auto-generated method stub
		baseDao.save(con);
		return true;
	}

	@Override
	public boolean update(Consumption con) {
		// TODO Auto-generated method stub
		baseDao.update(con);
		return true;
	}

	@Override
	public boolean delete(Consumption con) {
		// TODO Auto-generated method stub
		baseDao.delete(Consumption.class, con.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Consumption.class, id);
		return true;
	}

}
