package homework.dao;

import java.util.List;

import homework.model.Bankcard;
import homework.model.Member;

public interface MemberDao {

	public List findAll();
	
	public Member findById(String id);
	
	public Member find(String name);
	
	public boolean save(Member member);
	
	public boolean update(Member member);
	
	public boolean delete(Member member);
	
	public boolean delete(int id);
	
	public Bankcard findCard(String cardid);
	
	public List findAllCard();
	
	public boolean updateCard(Bankcard bank);
	
}
