package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.CartDao;
import homework.model.Booktopic;
import homework.model.Cart;
import homework.model.CartItem;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	BaseDao baseDao;

	Session session;

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Cart.class);
	}

	@Override
	public Cart findById(int id) {
		// TODO Auto-generated method stub
		return (Cart)baseDao.load(Cart.class, id);
	}

	@Override
	public Cart findByMemberid(int memberid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Cart.class);
		c.add(Restrictions.eq("memberid",memberid));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return (Cart)list.get(0);
	}

	@Override
	public boolean save(Cart cart) {
		// TODO Auto-generated method stub
		baseDao.save(cart);
		return true;
	}

	@Override
	public boolean update(Cart cart) {
		// TODO Auto-generated method stub
		baseDao.update(cart);
		return true;
	}

	@Override
	public boolean delete(Cart cart) {
		// TODO Auto-generated method stub
		baseDao.delete(Cart.class, cart.getId());
		return true;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(Cart.class, id);
		return true;
	}

	
	@Override
	public List findAllItem() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(CartItem.class);
	}

	@Override
	public CartItem findItemById(int id) {
		// TODO Auto-generated method stub
		return (CartItem)baseDao.load(CartItem.class, id);
	}

	@Override
	public List findItemByCart(int cartid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(CartItem.class);
		c.add(Restrictions.eq("cartid",cartid));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return list;
	}

	@Override
	public boolean saveItem(CartItem item) {
		// TODO Auto-generated method stub
		baseDao.save(item);
		return true;
	}

	@Override
	public boolean updateItem(CartItem item) {
		// TODO Auto-generated method stub
		baseDao.update(item);
		return true;
	}

	@Override
	public boolean deleteItem(CartItem item) {
		// TODO Auto-generated method stub
		baseDao.delete(CartItem.class, item.getId());
		return true;
	}

	@Override
	public boolean deleteItem(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(CartItem.class, id);
		return true;
	}
	
}
