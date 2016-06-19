package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.CommentDao;
import homework.model.Booktopic;
import homework.model.Comment;

@Repository
public class CommentDaoImpl implements CommentDao {
	
	@Autowired
	BaseDao baseDao;

	Session session;

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Comment.class);
	}

	@Override
	public Comment findById(String id) {
		// TODO Auto-generated method stub
		return (Comment)baseDao.load(Comment.class, id);
	}

	@Override
	public List findByBook(String bookid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Comment.class);
		c.add(Restrictions.eq("bookid",bookid));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return list;
	}

	@Override
	public boolean save(Comment com) {
		// TODO Auto-generated method stub
		baseDao.save(com);
		return true;
	}

	@Override
	public boolean update(Comment com) {
		// TODO Auto-generated method stub
		baseDao.update(com);
		return true;
	}

	@Override
	public boolean delete(Comment com) {
		// TODO Auto-generated method stub
		baseDao.delete(Comment.class, com.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Comment.class, id);
		return true;
	}
	
}
