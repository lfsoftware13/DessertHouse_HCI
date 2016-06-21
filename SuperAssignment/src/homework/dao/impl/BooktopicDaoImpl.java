package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.BooktopicDao;
import homework.model.Booktopic;

@Repository
public class BooktopicDaoImpl implements BooktopicDao {

	@Autowired
	BaseDao baseDao;

	Session session;

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Booktopic.class);
	}

	@Override
	public Booktopic findById(int id) {
		// TODO Auto-generated method stub
		return (Booktopic)baseDao.load(Booktopic.class, id);
	}

	@Override
	public List findByBookid(int bookid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Booktopic.class);
		c.add(Restrictions.eq("bookid",bookid));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return list;
	}

	@Override
	public List findByTopicid(int topicid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Booktopic.class);
		c.add(Restrictions.eq("topicid",topicid));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return list;
	}

	@Override
	public boolean save(Booktopic top) {
		// TODO Auto-generated method stub
		baseDao.save(top);
		return true;
	}

	@Override
	public boolean update(Booktopic top) {
		// TODO Auto-generated method stub
		baseDao.update(top);
		return true;
	}

	@Override
	public boolean delete(Booktopic top) {
		// TODO Auto-generated method stub
		baseDao.delete(Booktopic.class, top.getId());
		return true;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(Booktopic.class, id);
		return true;
	}
	
}
