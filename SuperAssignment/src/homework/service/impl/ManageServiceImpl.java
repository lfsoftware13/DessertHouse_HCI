package homework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.PlanDao;
import homework.model.Plan;
import homework.service.ManageService;

@Service
public class ManageServiceImpl implements ManageService {
	
	@Autowired
	PlanDao planDao;

	@Override
	public boolean approvePlan(String id) {
		// TODO Auto-generated method stub
		Plan plan=planDao.findById(id);
		if(plan==null){
			return false;
		}
		plan.setStatus("2");
		return true;
	}

	@Override
	public boolean refusePlan(String id) {
		// TODO Auto-generated method stub
		Plan plan=planDao.findById(id);
		if(plan==null){
			return false;
		}
		plan.setStatus("2");
		return true;
	}

}
