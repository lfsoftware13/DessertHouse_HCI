package homework.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.ConsumptionDao;
import homework.dao.MemberDao;
import homework.model.Consumption;
import homework.model.Member;
import homework.model.StatBar;
import homework.model.StatPie;
import homework.service.StatService;

@Service
public class StatServiceImpl implements StatService {

	@Autowired
	MemberDao memberDao;
	@Autowired
	ConsumptionDao consumptionDao;
	
	@Override
	public List getPieSex() {
		// TODO Auto-generated method stub
		List list=memberDao.findAll();
		
		List res=new ArrayList<StatPie>();
		StatPie man=new StatPie();
		man.setName("男");
		StatPie woman=new StatPie();
		woman.setName("女");
		StatPie no=new StatPie();
		no.setName("不明");
		
		for(int i=0;i<list.size();i++){
			Member mem=(Member) list.get(i);
			if(mem.getSex().equals("男")){
				man.setValue(man.getValue()+1);
			}else if(mem.getSex().equals("女")){
				woman.setValue(woman.getValue()+1);
			}else {
				no.setValue(no.getValue()+1);
			}
		}
		
		res.add(man);
		res.add(woman);
		res.add(no);
		
		return res;
	}

	@Override
	public List getPieAge() {
		// TODO Auto-generated method stub
		List list=memberDao.findAll();
		
		List res=new ArrayList<StatPie>();
		StatPie age0=new StatPie();
		age0.setName("20以下");
		StatPie age1=new StatPie();
		age1.setName("20-40");
		StatPie age2=new StatPie();
		age2.setName("40-60");
		StatPie age3=new StatPie();
		age3.setName("60以上");
		
		for(int i=0;i<list.size();i++){
			Member mem=(Member) list.get(i);
			int age=mem.getAge();
			if(age<20){
				age0.setValue(age0.getValue()+1);
			}else if(age>=20&&age<40){
				age1.setValue(age1.getValue()+1);
			}else if(age>=40&&age<60){
				age2.setValue(age2.getValue()+1);
			}else if(age>=60){
				age3.setValue(age3.getValue()+1);
			}
		}
		
		res.add(age0);
		res.add(age1);
		res.add(age2);
		res.add(age3);
		
		return res;
	}

	@Override
	public List getPieConsumption() {
		// TODO Auto-generated method stub
		List list=consumptionDao.findAll();
		
		List res=new ArrayList<StatPie>();
		StatPie man=new StatPie();
		man.setName("50以下");
		StatPie woman=new StatPie();
		woman.setName("50-200");
		StatPie no=new StatPie();
		no.setName("200以上");
		
		for(int i=0;i<list.size();i++){
			Consumption con=(Consumption) list.get(i);
			if(con.getTotal()<50){
				man.setValue(man.getValue()+1);
			}else if(con.getTotal()>=50&&con.getTotal()<200){
				woman.setValue(woman.getValue()+1);
			}else {
				no.setValue(no.getValue()+1);
			}
		}
		
		res.add(man);
		res.add(woman);
		res.add(no);
		
		return res;
	}

	@Override
	public List getPieCard() {
		// TODO Auto-generated method stub
		List list=memberDao.findAll();
		
		List res=new ArrayList<StatPie>();
		StatPie man=new StatPie();
		man.setName("已激活");
		StatPie woman=new StatPie();
		woman.setName("未激活");
		StatPie no=new StatPie();
		no.setName("已停止");
		
		for(int i=0;i<list.size();i++){
			Member mem=(Member) list.get(i);
			if(mem.getStatus()==1){
				man.setValue(man.getValue()+1);
			}else if(mem.getStatus()==0){
				woman.setValue(woman.getValue()+1);
			}else {
				no.setValue(no.getValue()+1);
			}
		}
		
		res.add(man);
		res.add(woman);
		res.add(no);
		
		return res;
	}

	@Override
	public List getBarStore(String storeid, String time) {
		// TODO Auto-generated method stub
		List list=consumptionDao.findAll();
		
		String[] str=time.split("-");
		int year=Integer.parseInt(str[0]);
		int month=Integer.parseInt(str[1]);
		
		ArrayList<StatBar> res=new ArrayList<StatBar>();
		
		for(int i=0;i<list.size();i++){
			Consumption con=(Consumption) list.get(i);
			if(!con.getStoreid().equals(storeid)){
				continue;
			}
			Calendar c = Calendar.getInstance();
			c.setTime(con.getTime());
			int year1=c.get(Calendar.YEAR);
			int month1=c.get(Calendar.MONTH)+1;
			
			if(year!=year1||month!=month1){
				continue;
			}
			
			res=addSaleInf(res,con);
		}
		
		return res;
	}

	@Override
	public List getBarProduct(String time) {
		// TODO Auto-generated method stub
		List list=consumptionDao.findAll();
		
		ArrayList<StatBar> res=new ArrayList<StatBar>();
		
		String[] str=time.split("-");
		int year=Integer.parseInt(str[0]);
		int month=Integer.parseInt(str[1]);
		
		for(int i=0;i<list.size();i++){
			Consumption con=(Consumption) list.get(i);
			
			Calendar c = Calendar.getInstance();
			c.setTime(con.getTime());
			int year1=c.get(Calendar.YEAR);
			int month1=c.get(Calendar.MONTH)+1;
			
			if(year!=year1||month!=month1){
				continue;
			}
			
			res=addSaleInf(res,con);
		}
		
		return res;
	}
	
	public ArrayList<StatBar> addSaleInf(ArrayList<StatBar> list, Consumption con){
		if(con.getStatus().equals("已退订")){
			return list;
		}
		
		for(int i=0;i<list.size();i++){
			if(con.getProduct().equals(list.get(i).getName())){
				if(con.getStatus().equals("预定")){
					list.get(i).setPre(list.get(i).getPre()+con.getNumber());
				}else{
					list.get(i).setNumber(list.get(i).getNumber()+con.getNumber());
				}
				list.get(i).setTotal(list.get(i).getTotal()+con.getTotal());
				return list;
			}
		}
		StatBar bar=new StatBar();
		bar.setName(con.getProduct());
		if(con.getStatus().equals("预定")){
			bar.setPre(con.getNumber());
		}else{
			bar.setNumber(con.getNumber());
		}
		bar.setTotal(con.getTotal());
		list.add(bar);
		return list;
	}
	

}
