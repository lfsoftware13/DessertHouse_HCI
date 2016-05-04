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
public class AccountDaoImpl implements AccountDao {
	
	
	@Autowired
	private BaseDao baseDao;
	
	private Session session;
	

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Account.class);
	}

	@Override
	public Account findById(String id) {
		// TODO Auto-generated method stub

		return (Account)baseDao.load(Account.class,id);
	}

	@Override
	public Account find(String account) {
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
	public boolean save(Account account) {
		// TODO Auto-generated method stub
		baseDao.save(account);
		return true;
	}

	@Override
	public boolean update(Account account) {
		// TODO Auto-generated method stub
		baseDao.update(account);
		return true;
	}

	@Override
	public boolean delete(Account account) {
		// TODO Auto-generated method stub
		baseDao.delete(Account.class, account.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Account.class, id);
		return true;
	}

}
