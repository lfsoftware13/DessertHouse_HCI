package homework.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.ConsumptionDao;
import homework.dao.PaymentDao;
import homework.model.Consumption;
import homework.model.Payment;
import homework.service.TradeService;

@Service
public class TradeServiceImpl implements TradeService {

	@Autowired
	PaymentDao paymentDao;
	@Autowired
	ConsumptionDao consumptionDao;
	
	@Override
	public List findAllPayment() {
		// TODO Auto-generated method stub
		return paymentDao.findAll();
	}

	@Override
	public List findAllConsumption() {
		// TODO Auto-generated method stub
		return consumptionDao.findAll();
	}

	@Override
	public Payment findPaymentById(String id) {
		// TODO Auto-generated method stub
		return paymentDao.findById(id);
	}

	@Override
	public Consumption findConsumptionById(String id) {
		// TODO Auto-generated method stub
		return consumptionDao.findById(id);
	}


	@Override
	public List findPaymentByMem(String memid) {
		// TODO Auto-generated method stub
		return paymentDao.find(memid);
	}

	@Override
	public List findConsumptionByMem(String memid) {
		// TODO Auto-generated method stub
		return consumptionDao.findMember(memid);
	}

}
