package homework.service;

import java.util.List;

import homework.model.Account;
import homework.model.Consumption;
import homework.model.Member;

public interface MemberService {
	
	public String register(String account, String password);
	
	public Account login(String account, String password);
	
	public boolean activeMember(String id);
	
	public boolean addBankcard(String id, String cardid);
	
	public boolean deleteBankcard(String cardid);
	
	public boolean updateMemInf(Member mem);
	
	public boolean updateAccInf(Account acc);
	
	public boolean updatePassword(String id, String password);
	
	public boolean updateMemInf(String id, String name, String sex, String address);
	
	public boolean payMemberFee(String id, String cardid, int money);
	
	public Member findMember(String id);
	
	public List findAllMember();
	
	public Account findAccountById(String id);
	
	public Account findAccount(String name);
	
	public boolean stopMember(String id);
	
	public boolean chargePoint(String id, int point);
	
	public boolean reseveProduct(String stockid, String memberid, int number, String time);
	
	public boolean returnedProduct(String id);
	
}
