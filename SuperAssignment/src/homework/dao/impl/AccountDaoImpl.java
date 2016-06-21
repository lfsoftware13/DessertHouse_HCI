package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.AccountDao;
import homework.dao.BaseDao;
import homework.model.Account;

@Repository
public class AccountDaoImpl implements AccountDao{

	@Autowired
	BaseDao baseDao;

	Session session;
	
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Account.class);
	}

	@Override
	public Account findById(int id) {
		// TODO Auto-generated method stub
		return (Account)baseDao.load(Account.class, id);
	}

	@Override
	public Account findByName(String account) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Account.class);
		c.add(Restrictions.eq("account",account));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return (Account)list.get(0);
	}

	@Override
	public boolean save(Account acc) {
		// TODO Auto-generated method stub
		baseDao.save(acc);
		return true;
	}

	@Override
	public boolean update(Account acc) {
		// TODO Auto-generated method stub
		baseDao.update(acc);
		return true;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(Account.class, id);
		return true;
	}

	@Override
	public boolean delete(Account acc) {
		// TODO Auto-generated method stub
//		baseDao.delete(Account.class, acc.getId());
		return true;
	}

}
