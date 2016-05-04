package homework.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.ConsumptionDao;
import homework.dao.MemberDao;
import homework.model.Consumption;
import homework.model.Member;
import homework.service.ClerkService;

@Service
public class ClerkServiceImpl implements ClerkService{

	@Autowired
	ConsumptionDao consumptionDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public boolean salePro(String storeid, String id, Consumption list) {
		// TODO Auto-generated method stub
		Member mem=memberDao.findById(id);
		
		int num=0;
		double tot=0.0;
		
//		for(int i=0;i<list.size();i++){
//			num=num+list.get(i).getNumber();
//			tot=tot+list.get(i).getTotal();
//		}
		
		if(mem.getMoney()<tot){
			return false;
		}
		
		mem.setMoney(mem.getMoney()-tot);
		mem.setPoint(mem.getPoint()+getPoint(tot));
		memberDao.update(mem);
		
		Consumption con=new Consumption();
		con.setMemberid(id);
		con.setMember(mem.getName());
		con.setStatus("2");
		con.setTime(new Date());
		con.setNumber(num);
		con.setTotal(tot);
		con.setStoreid(storeid);
		
		consumptionDao.save(con);
		
		return true;
	}

	@Override
	public boolean salePro(String storeid, Consumption list) {
		// TODO Auto-generated method stub
		int num=0;
		double tot=0.0;
		
//		for(int i=0;i<list.size();i++){
//			num=num+list.get(i).getNumber();
//			tot=tot+list.get(i).getTotal();
//		}
		
		Consumption con=new Consumption();
		con.setMemberid("");
		con.setMember("");
		con.setStatus("2");
		con.setTime(new Date());
		con.setNumber(num);
		con.setTotal(tot);
		con.setStoreid(storeid);
//		con.setConItems(list);
		
		consumptionDao.save(con);
		
		return true;
	}
	
	public int getPoint(double money){
		return (int)money/10;
	}

}
