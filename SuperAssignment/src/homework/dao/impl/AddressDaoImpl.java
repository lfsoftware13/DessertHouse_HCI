package homework.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.AddressDao;
import homework.dao.BaseDao;
import homework.model.Address;

@Repository
public class AddressDaoImpl implements AddressDao {
	
	@Autowired
	BaseDao baseDao;

	Session session;

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Address.class);
	}

	@Override
	public Address findById(int id) {
		// TODO Auto-generated method stub
		return (Address)baseDao.load(Address.class, id);
	}

	@Override
	public List findByMember(int memberid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Address.class);
		c.add(Restrictions.eq("memberid",memberid));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return new ArrayList<Address>();
		}
		return list;
	}

	@Override
	public Address findByName(String name) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Address.class);
		c.add(Restrictions.eq("name",name));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return (Address)list.get(0);
	}

	@Override
	public boolean save(Address address) {
		// TODO Auto-generated method stub
		baseDao.save(address);
		return true;
	}

	@Override
	public boolean update(Address address) {
		// TODO Auto-generated method stub
		baseDao.update(address);
		return true;
	}

	@Override
	public boolean delete(Address address) {
		// TODO Auto-generated method stub
		baseDao.delete(Address.class, address.getId());
		return true;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(Address.class, id);
		return true;
	}

}
