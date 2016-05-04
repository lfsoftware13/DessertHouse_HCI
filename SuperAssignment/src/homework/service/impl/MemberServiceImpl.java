package homework.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.AccountDao;
import homework.dao.ConsumptionDao;
import homework.dao.MemberDao;
import homework.dao.PaymentDao;
import homework.dao.StockDao;
import homework.model.Account;
import homework.model.Bankcard;
import homework.model.Consumption;
import homework.model.Member;
import homework.model.Payment;
import homework.model.Stock;
import homework.service.MemberService;
import homework.service.NoteService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao memberDao;
	@Autowired
	AccountDao accountDao;
	@Autowired
	ConsumptionDao consumptionDao;
	@Autowired
	PaymentDao paymentDao;
	@Autowired
	StockDao stockDao;
	
	@Autowired
	NoteService noteService;

	@Override
	public String register(String account, String password) {
		// TODO Auto-generated method stub
		
		Account acc1=accountDao.find(account);
		
		if(acc1!=null){
			return null;
		}
		
		String id=noteService.getNote("member");
		
		Account acc=new Account();
		acc.setId(id);
		acc.setAccount(account);
		acc.setPassword(password);
		acc.setType(1);
		
		Member member=new Member();
		member.setId(id);
		member.setName(account);
		member.setAge(0);
		member.setSex("-");
		member.setAddress("");
		member.setLevel(0);
		member.setPoint(0);
		member.setDiscount(1);
		member.setStatus(0);
		
		Date d=new Date();
		long ti=d.getTime();
		long temp=365*24;
		temp=temp*3600;
		temp=temp*1000;
		ti=ti+temp;
		
		member.setValid(new Date(ti));
		member.setMoney(0);
//		member.setBankcards(new ArrayList<Bankcard>());
		
		if(accountDao.save(acc)&&memberDao.save(member)){
			return id;
		}
		return null;
	}
	
	@Override
	public Account login(String account, String password){
		Account acc=accountDao.find(account);
		if(acc!=null){
			if(acc.getPassword().equals(password)){
				return acc;
			}
			return null;
		}
		return null;
	}

	@Override
	public boolean activeMember(String id) {
		// TODO Auto-generated method stub
		Member mem=memberDao.findById(id);
		mem.setValid(new Date(new Date().getTime()+365*24*3600*1000));
		mem.setStatus(2);
		memberDao.update(mem);
		return true;
	}

	@Override
	public boolean addBankcard(String id, String cardid) {
		// TODO Auto-generated method stub
		Bankcard bank=memberDao.findCard(cardid);
		Member mem=memberDao.findById(id);
//		mem.addBankcard(bank);
//		bank.setMember(mem);
		memberDao.update(mem);
		memberDao.updateCard(bank);
		return true;
	}

	@Override
	public boolean deleteBankcard(String cardid) {
		// TODO Auto-generated method stub
		Bankcard bank=memberDao.findCard(cardid);
		Member mem=new Member();
//		mem.removeBankcard(bank);
//		bank.setMember(null);
		memberDao.update(mem);
		memberDao.updateCard(bank);
		return true;
	}

	@Override
	public boolean updatePassword(String id, String password) {
		// TODO Auto-generated method stub
		Account acc=accountDao.findById(id);
		acc.setPassword(password);
		accountDao.update(acc);
		return true;
	}

	@Override
	public boolean updateMemInf(String id, String name, String sex, String address) {
		// TODO Auto-generated method stub
		Member mem=memberDao.findById(id);
		mem.setName(name);
		mem.setSex(sex);
		mem.setAddress(address);
		memberDao.update(mem);
		return true;
	}

	@Override
	public boolean payMemberFee(String id, String cardid, int money) {
		// TODO Auto-generated method stub
		Member mem=memberDao.findById(id);
		Bankcard bank=memberDao.findCard(cardid);
		
		if(mem==null||bank==null){
			return false;
		}
		
		if(bank.getMoney()<money){
			return false;
		}
		
		bank.setMoney(bank.getMoney()-money);
		mem.setMoney(mem.getMoney()+money);
		int level=getLevel(mem.getMoney());
		if(mem.getLevel()<level){
			mem.setLevel(level);
			mem.setDiscount(getDiscount(level));
		}
		if(mem.getMoney()>100){
			long time=(new Date()).getTime();
			long ti=365*24;
			ti=ti*3600;
			ti=ti*1000;
			time=time+ti;
			mem.setValid(new Date(time));
			mem.setStatus(1);
		}
		memberDao.updateCard(bank);
		memberDao.update(mem);
		
		Payment pay=new Payment();
		String payid=noteService.getNote("payment");
		pay.setId(payid);
		pay.setCardid(cardid);
		pay.setMemberid(id);
		pay.setMember(mem.getName());
		pay.setMoney(money);
		pay.setTime(new Date());
		paymentDao.save(pay);
		
		return true;
	}

	@Override
	public Member findMember(String id) {
		// TODO Auto-generated method stub
		Member mem=memberDao.findById(id);
		if(mem==null){
			return mem;
		}
		long note=mem.getValid().getTime();
		long now=(new Date()).getTime();
		long temp=now-note;
		
		if(temp>0&&mem.getStatus()>=0){
			mem.setStatus(mem.getStatus()-1);
			long te=365*24;
			te=te*3600;
			te=te*1000;
			note=note+te;
			mem.setValid(new Date(note));
			memberDao.update(mem);
		}
		
		return memberDao.findById(id);
	}

	@Override
	public Account findAccountById(String id) {
		// TODO Auto-generated method stub
		return accountDao.findById(id);
	}

	@Override
	public Account findAccount(String name) {
		// TODO Auto-generated method stub
		return accountDao.find(name);
	}
	
	@Override
	public List findAllMember() {
		// TODO Auto-generated method stub
		List list=memberDao.findAll();
		
		for(int i=0;i<list.size();i++){
			Member mem=(Member)list.get(i);
			long note=mem.getValid().getTime();
			long now=(new Date()).getTime();
			long temp=now-note;
			
			if(temp>0&&mem.getStatus()>=0){
				mem.setStatus(mem.getStatus()-1);
				long te=365*24;
				te=te*3600;
				te=te*1000;
				note=note+te;
				mem.setValid(new Date(note));
				memberDao.update(mem);
			}
		}
		
		return memberDao.findAll();
	}

	@Override
	public boolean stopMember(String id) {
		// TODO Auto-generated method stub
		Member mem=memberDao.findById(id);
		mem.setStatus(-1);
		return memberDao.update(mem);
	}

	@Override
	public boolean chargePoint(String id, int point) {
		// TODO Auto-generated method stub
		Member mem=memberDao.findById(id);
		if(mem.getPoint()<point){
			return false;
		}
		mem.setPoint(mem.getPoint()-point);
		mem.setMoney(mem.getMoney()+point/100.0);
		memberDao.update(mem);
		return true;
	}

	@Override
	public boolean reseveProduct(String stockid, String memberid, int number, String time) {
		// TODO Auto-generated method stub
		
		Member mem=memberDao.findById(memberid);
		Stock sto=stockDao.findById(stockid);
		double discountprice=sto.getPrice();
		if(mem!=null){
			discountprice=discountprice*mem.getDiscount();
		}
		
		double tot=number*discountprice;
		
//		for(int i=0;i<list.size();i++){
//			num=num+list.get(i).getNumber();
//			tot=tot+list.get(i).getTotal();
//		}
		
		if(mem!=null){
			if(mem.getMoney()<tot){
				return false;
			}
		}
		

		
		if(sto.getNumber()<number){
			return false;
		}
		
		SimpleDateFormat sim=new SimpleDateFormat("yyyy-MM-dd");
		Date d=new Date();
		String str="";
		try {
			str=sim.format(new Date());
			d = sim.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println("reseve:"+str);
		System.out.println("reseve:"+time);
		
		String status="";
		if(str.equals(time)){
			status="已完成";
		}else if(str.compareTo(time)<0){
			status="预定";
		}else{
			return false;
		}
		
		if(mem!=null){
			mem.setMoney(mem.getMoney()-tot);
			mem.setPoint(mem.getPoint()+getPoint(tot));
		}
		
		sto.setNumber(sto.getNumber()-number);
		
		String noteid=noteService.getNote("consumption");
		
		Consumption con=new Consumption();
		con.setId(noteid);
		if("-".equals(memberid)){
			con.setMemberid("-");
			con.setMember("-");
		}else{
			con.setMemberid(mem.getId());
			con.setMember(mem.getName());
		}
		con.setStoreid(sto.getStoreid());
		con.setStore(sto.getStore());
		con.setProductid(sto.getProductid());
		con.setProduct(sto.getProduct());
		con.setPrice(sto.getPrice());
		con.setDiscountprice(discountprice);
		con.setTotal(tot);
		con.setNumber(number);
		con.setStatus(status);
		con.setTime(d);
		con.setStockid(stockid);
		
		if(mem!=null){
			memberDao.update(mem);
		}
		stockDao.update(sto);
		consumptionDao.save(con);
		return true;
	}
	
	public boolean returnedProduct(String id){
		Consumption con=consumptionDao.findById(id);
		
		if(!"预定".equals(con.getStatus())){
			return false;
		}
		
		long ti=con.getTime().getTime();
		long time=(new Date()).getTime();
		
		if(ti<=time){
			return false;
		}
		
		Member mem=memberDao.findById(con.getMemberid());
		Stock sto=stockDao.findById(con.getStockid());
		
		mem.setMoney(mem.getMoney()+con.getTotal());
		mem.setPoint(mem.getPoint()-getPoint(con.getTotal()));
		sto.setNumber(sto.getNumber()+con.getNumber());
		
		con.setStatus("已退订");
		
		memberDao.update(mem);
		stockDao.update(sto);
		consumptionDao.update(con);
		
		return true;
	}
	
	public int getLevel(double money){
		return (int)money/200;
	}
	
	public int getPoint(double money){
		return (int)money/10;
	}
	
	public double getDiscount(int level){
		return (1-0.05*level);
	}

	@Override
	public boolean updateMemInf(Member mem) {
		// TODO Auto-generated method stub
		return memberDao.update(mem);
	}
	
	@Override
	public boolean updateAccInf(Account acc) {
		// TODO Auto-generated method stub
		return accountDao.update(acc);
	}

}
