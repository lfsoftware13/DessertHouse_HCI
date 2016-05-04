package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.MemberDao;
import homework.model.Bankcard;
import homework.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private BaseDao baseDao;
	
	private Session session;
	
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Member.class);
	}

	@Override
	public Member findById(String id) {
		// TODO Auto-generated method stub
		return (Member)baseDao.load(Member.class, id);
	}

	@Override
	public Member find(String name) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(Member.class);
		c.add(Restrictions.eq("name",name));
		List list=c.list();
		session.close();
		if(list.size()<=0){
			return null;
		}
		return (Member)list.get(0);
	}

	@Override
	public boolean save(Member member) {
		// TODO Auto-generated method stub
		baseDao.save(member);
		return true;
	}

	@Override
	public boolean update(Member member) {
		// TODO Auto-generated method stub
		baseDao.update(member);
		return true;
	}

	@Override
	public boolean delete(Member member) {
		// TODO Auto-generated method stub
		baseDao.delete(Member.class, member.getId());
		return true;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		baseDao.delete(Member.class, Integer.toString(id));
		return true;
	}

	@Override
	public Bankcard findCard(String cardid) {
		// TODO Auto-generated method stub
		return (Bankcard)baseDao.load(Bankcard.class, cardid);
	}

	@Override
	public List findAllCard() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Bankcard.class);
	}

	@Override
	public boolean updateCard(Bankcard bank) {
		// TODO Auto-generated method stub
		baseDao.update(bank);
		return true;
	}

}
