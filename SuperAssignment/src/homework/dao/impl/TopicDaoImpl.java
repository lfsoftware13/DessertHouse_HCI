package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.TopicDao;
import homework.model.OrderItem;
import homework.model.Topic;

@Repository
public class TopicDaoImpl implements TopicDao {

	@Autowired
	BaseDao baseDao;

	Session session;

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Topic.class);
	}

	@Override
	public Topic findById(int id) {
		// TODO Auto-generated method stub
		return (Topic)baseDao.load(Topic.class, id);
	}
	
	@Override
	public Topic findByName(String name){
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Topic.class);
		c.add(Restrictions.eq("name",name));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return (Topic)list.get(0);
	}

	@Override
	public boolean save(Topic topic) {
		// TODO Auto-generated method stub
		baseDao.save(topic);
		return true;
	}

	@Override
	public boolean update(Topic topic) {
		// TODO Auto-generated method stub
		baseDao.update(topic);
		return true;
	}

	@Override
	public boolean delete(Topic topic) {
		// TODO Auto-generated method stub
		baseDao.delete(Topic.class, topic.getId());
		return true;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(Topic.class, id);
		return true;
	}
	
}
