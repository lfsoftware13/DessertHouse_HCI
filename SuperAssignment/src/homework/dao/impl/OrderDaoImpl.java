package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.OrderDao;
import homework.model.Order;
import homework.model.OrderItem;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	BaseDao baseDao;

	Session session;

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Order.class);
	}

	@Override
	public Order findById(String id) {
		// TODO Auto-generated method stub
		return (Order)baseDao.load(Order.class, id);
	}

	@Override
	public List findByMember(String memberid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Order.class);
		c.add(Restrictions.eq("memberid",memberid));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return list;
	}

	@Override
	public boolean save(Order order) {
		// TODO Auto-generated method stub
		baseDao.save(order);
		return true;
	}

	@Override
	public boolean update(Order order) {
		// TODO Auto-generated method stub
		baseDao.update(order);
		return true;
	}

	@Override
	public boolean delete(Order order) {
		// TODO Auto-generated method stub
		baseDao.delete(Order.class, order.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Order.class, id);
		return true;
	}
	

	@Override
	public List findAllItem() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(OrderItem.class);
	}

	@Override
	public OrderItem findItemById(String id) {
		// TODO Auto-generated method stub
		return (OrderItem)baseDao.load(OrderItem.class, id);
	}

	@Override
	public List findByOrder(String orderid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(OrderItem.class);
		c.add(Restrictions.eq("orderid",orderid));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return list;
	}

	@Override
	public boolean saveItem(OrderItem item) {
		// TODO Auto-generated method stub
		baseDao.save(item);
		return true;
	}

	@Override
	public boolean updateItem(OrderItem item) {
		// TODO Auto-generated method stub
		baseDao.update(item);
		return true;
	}

	@Override
	public boolean deleteItem(OrderItem item) {
		// TODO Auto-generated method stub
		baseDao.delete(OrderItem.class, item.getId());
		return true;
	}

	@Override
	public boolean deleteItem(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(OrderItem.class, id);
		return true;
	}
	
}
