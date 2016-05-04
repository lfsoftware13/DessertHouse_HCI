package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.ClerkDao;
import homework.model.Clerk;

@Repository
public class ClerkDaoImpl implements ClerkDao {

	
	@Autowired
	private BaseDao baseDao;
	
	private Session session;
	
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Clerk.class);
	}

	@Override
	public Clerk findById(String id) {
		// TODO Auto-generated method stub
		return (Clerk) baseDao.load(Clerk.class,id);
	}

	@Override
	public Clerk find(String name) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Clerk.class);
		c.add(Restrictions.eq("name",name));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return (Clerk)list.get(0);
	}

	@Override
	public boolean save(Clerk clerk) {
		// TODO Auto-generated method stub
		baseDao.save(clerk);
		return true;
	}

	@Override
	public boolean update(Clerk clerk) {
		// TODO Auto-generated method stub
		baseDao.update(clerk);
		return true;
	}

	@Override
	public boolean delete(Clerk clerk) {
		// TODO Auto-generated method stub
		baseDao.delete(Clerk.class, clerk.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Clerk.class, id);
		return true;
	}

}
