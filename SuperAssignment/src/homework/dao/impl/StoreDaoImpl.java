package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.StoreDao;
import homework.model.Store;

@Repository
public class StoreDaoImpl implements StoreDao {
	
	@Autowired
	private BaseDao baseDao;
	
	private Session session;
	
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Store.class);
	}

	@Override
	public Store findById(String id) {
		// TODO Auto-generated method stub
		System.out.println("StoreDao:"+id);
		return (Store) baseDao.load(Store.class, id);
	}

	@Override
	public Store find(String name) {
		// TODO Auto-generated method stub		
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Store.class);
		c.add(Restrictions.eq("name",name));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return (Store) list.get(0);
	}

	@Override
	public boolean save(Store store) {
		// TODO Auto-generated method stub
		baseDao.save(store);
		return true;
	}

	@Override
	public boolean update(Store store) {
		// TODO Auto-generated method stub
		baseDao.update(store);
		return true;
	}

	@Override
	public boolean delete(Store store) {
		// TODO Auto-generated method stub
		baseDao.delete(Store.class, store.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Store.class, id);
		return true;
	}

}
