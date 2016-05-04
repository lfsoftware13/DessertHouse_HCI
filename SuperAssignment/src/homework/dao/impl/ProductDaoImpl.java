package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.ProductDao;
import homework.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private BaseDao baseDao;
	
	private Session session;
	
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Product.class);
	}

	@Override
	public Product findById(String id) {
		// TODO Auto-generated method stub
		return (Product)baseDao.load(Product.class, id);
	}

	@Override
	public Product find(String name) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Product.class);
		c.add(Restrictions.eq("name",name));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return (Product)list.get(0);
	}

	@Override
	public boolean save(Product product) {
		// TODO Auto-generated method stub
		baseDao.save(product);
		return true;
	}

	@Override
	public boolean update(Product product) {
		// TODO Auto-generated method stub
		baseDao.update(product);
		return true;
	}

	@Override
	public boolean delete(Product product) {
		// TODO Auto-generated method stub
		baseDao.delete(Product.class, product.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Product.class, id);
		return true;
	}

}
