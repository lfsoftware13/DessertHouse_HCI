package homework.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.MemberDao;
import homework.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	BaseDao baseDao;

	Session session;

	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Member.class);
	}

	@Override
	public Member findById(int id) {
		// TODO Auto-generated method stub
		return (Member)baseDao.load(Member.class, id);
	}

	@Override
	public boolean save(Member mem) {
		// TODO Auto-generated method stub
		baseDao.save(mem);
		return true;
	}

	@Override
	public boolean update(Member mem) {
		// TODO Auto-generated method stub
		baseDao.update(mem);
		return true;
	}

	@Override
	public boolean delete(Member mem) {
		// TODO Auto-generated method stub
//		baseDao.delete(Member.class, mem.getId());
		return true;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(Member.class, id);
		return true;
	}
	
}
