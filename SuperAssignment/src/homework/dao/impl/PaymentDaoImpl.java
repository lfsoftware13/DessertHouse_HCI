package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.PaymentDao;
import homework.model.Payment;
import homework.model.Product;

@Repository
public class PaymentDaoImpl implements PaymentDao {
	
	@Autowired
	private BaseDao baseDao;
	
	private Session session;
	
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Payment.class);
	}

	@Override
	public Payment findById(String id) {
		// TODO Auto-generated method stub
		return (Payment)baseDao.load(Payment.class, id);
	}

	@Override
	public boolean save(Payment payment) {
		// TODO Auto-generated method stub
		baseDao.save(payment);
		return true;
	}

	@Override
	public boolean update(Payment payment) {
		// TODO Auto-generated method stub
		baseDao.update(payment);
		return true;
	}

	@Override
	public boolean delete(Payment payment) {
		// TODO Auto-generated method stub
		baseDao.delete(Payment.class, payment.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Payment.class, id);
		return true;
	}

	@Override
	public List find(String memberid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Payment.class);
		c.add(Restrictions.eq("memberid",memberid));
		List list=c.list();
		session.close();
		return list;
	}

}
