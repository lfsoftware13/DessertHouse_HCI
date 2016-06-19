package homework.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.BookDao;
import homework.model.Book;

@Repository
public class BookDaoImpl implements BookDao {

	@Autowired
	BaseDao baseDao;

	Session session;

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Book.class);
	}

	@Override
	public Book findById(String id) {
		// TODO Auto-generated method stub
		return (Book)baseDao.load(Book.class, id);
	}

	@Override
	public boolean save(Book book) {
		// TODO Auto-generated method stub
		baseDao.save(book);
		return true;
	}

	@Override
	public boolean update(Book book) {
		// TODO Auto-generated method stub
		baseDao.update(book);
		return true;
	}

	@Override
	public boolean delete(Book book) {
		// TODO Auto-generated method stub
		baseDao.delete(Book.class, book.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Book.class, id);
		return true;
	}
	
}
