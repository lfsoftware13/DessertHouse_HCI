package homework.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import homework.dao.BaseDao;
import homework.dao.PlanDao;
import homework.model.Plan;
import homework.model.PlanItem;

@Repository
public class PlanDaoImpl implements PlanDao {

	@Autowired
	private BaseDao baseDao;
	
	private Session session;
	
	@Override
	public List findAll() {
		// TODO Auto-generated method stub
		return baseDao.getAllList(Plan.class);
	}

	@Override
	public Plan findById(String id) {
		// TODO Auto-generated method stub
		return (Plan)baseDao.load(Plan.class,id);
	}

	@Override
	public boolean save(Plan plan) {
		// TODO Auto-generated method stub
		baseDao.save(plan);
		return true;
	}

	@Override
	public boolean update(Plan plan) {
		// TODO Auto-generated method stub
		baseDao.update(plan);
		return true;
	}

	@Override
	public boolean delete(Plan plan) {
		// TODO Auto-generated method stub
		baseDao.delete(Plan.class, plan.getId());
		return true;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(Plan.class,id);
		return true;
	}

	@Override
	public boolean deleteItem(String id) {
		// TODO Auto-generated method stub
		baseDao.delete(PlanItem.class,id);
		return true;
	}

	@Override
	public PlanItem findItem(String id) {
		// TODO Auto-generated method stub
		return (PlanItem)baseDao.load(PlanItem.class, id);
	}

	@Override
	public boolean save(PlanItem item) {
		// TODO Auto-generated method stub
		baseDao.save(item);
		return true;
	}

	@Override
	public boolean update(PlanItem item) {
		// TODO Auto-generated method stub
		baseDao.update(item);
		return true;
	}

	@Override
	public boolean deleteItemList(String planid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(PlanItem.class);
		c.add(Restrictions.eq("planid",planid));
		List list=c.list();
		session.close();
		
		if(list.size()<=0){
			return true;
		}
		
		for(int i=0;i<list.size();i++){
			baseDao.delete(PlanItem.class, ((PlanItem)list.get(i)).getId());
		}
		
		return true;
	}

	@Override
	public List findItemList(String planid) {
		// TODO Auto-generated method stub
		session=baseDao.getNewSession();
		Criteria c=session.createCriteria(PlanItem.class);
		c.add(Restrictions.eq("planid",planid));
		List list=c.list();
		session.close();
		return list;
	}

}
